----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:58 04/28/2017 
-- Design Name: 
-- Module Name:    rotary_machine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rotary_machine is
	
	Port(	EN		: in STD_LOGIC;
			INS	: in STD_LOGIC_VECTOR(1 downto 0);	-- 1->A, 0->B
			DIR	: out STD_LOGIC_VECTOR(1 downto 0)); -- Event shown by transition
			
end rotary_machine;

architecture Behavioral of rotary_machine is
	
	type STATE_TYPE IS (IDLE, RISING_LEFT, RISING_RIGHT);
	signal cur_state	: STATE_TYPE;
	--signal next_state	: STATE_TYPE;
	signal OUTBUF		: STD_LOGIC_VECTOR(1 downto 0) := (OTHERS => '0');
	
begin
	DIR <= OUTBUF;
	
	change_state: process(INS)
	begin
	--	if (INS'event) --and (EN = '1')
	--	then
			case cur_state is
				when RISING_LEFT =>
					if (INS = "11")
					then
						OUTBUF(1) <= not OUTBUF(1);
					end if;
					cur_state <= IDLE;
				when RISING_RIGHT =>
					if (INS = "11")
					then
						OUTBUF(0) <= not OUTBUF(0);
					end if;
					cur_state <= IDLE;
				when IDLE =>
					case INS is
						when "10" => cur_state <= RISING_LEFT;
						when "01" => cur_state <= RISING_RIGHT;
						when others => cur_state <= IDLE;
					end case;
			end case;
			--cur_state <= next_state;
	--	end if;
	end process;

end Behavioral;

-- vim:set ts=3 sw=3 noexpandtab: