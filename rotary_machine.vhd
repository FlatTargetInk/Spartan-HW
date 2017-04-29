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
	
	Port(	CLK	: in STD_LOGIC;
			EN		: in STD_LOGIC;
			INS	: in STD_LOGIC_VECTOR(1 downto 0);	-- 1->A, 0->B
			DIR	: out STD_LOGIC_VECTOR(1 downto 0));
			
end rotary_machine;

architecture Mixed of rotary_machine is
	
	type STATE_TYPE IS (IDLE, RISING_LEFT, RISING_RIGHT);
	signal cur_state	: STATE_TYPE;
	signal next_state	: STATE_TYPE;

begin
	
	process(CLK)
	begin
		if (CLK'event and CLK = '1' and EN = '1')
		then
			next_state <= cur_state;
		end if
	end process
	

end Mixed;

