----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:32 04/28/2017 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
	Generic(wait_time : INTEGER := 20);
	
	Port(	CLK		: in STD_LOGIC;
			EN			: in STD_LOGIC;
			INPUT		: in STD_LOGIC;
			OUTPUT	: out STD_LOGIC);
end debounce;

architecture Logic of debounce is

	signal D_STATE	: STD_LOGIC_VECTOR (1 downto 0);
	signal D_SET	: STD_LOGIC;
	signal COUNT	: STD_LOGIC_VECTOR (wait_time downto 0) := (others => '0');

begin
	
	-- If state change exists, set D_SET high
	D_SET <= D_STATE(0) xor D_STATE(1);
	
	input_monitor: process(EN, CLK)
	begin
		if (CLK'event and CLK = '1' and EN = '1') then
			D_STATE(0) <= INPUT;
			D_STATE(1) <= D_STATE(0);
			if (D_SET = '1') then
				COUNT <= (others => '0');
			elsif (Count(wait_time) = '0') then
				COUNT <= COUNT + 1;
			else
				OUTPUT <= D_STATE(1);
			end if;
		end if;
	end process;
	
end Logic;


-- vim:set ts=3 sw=3 noexpandtab: