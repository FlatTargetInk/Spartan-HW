----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:33 04/28/2017 
-- Design Name: 
-- Module Name:    led_increment - Behavioral 
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

entity led_increment is
	
	generic(count_width : INTEGER := 8);

	Port(	INPUT	: in STD_LOGIC;
			EN		: in STD_LOGIC;
			RST	: in STD_LOGIC;
			LEDS	: out STD_LOGIC_VECTOR);
			
end led_increment;

architecture Behavioral of led_increment is
	
	signal COUNTER	: STD_LOGIC_VECTOR(count_width-1 downto 0) := (OTHERS => '0');
	signal ZEROS	: STD_LOGIC_VECTOR(count_width-1 downto 0) := (OTHERS => '0');

begin
	
	LEDS <= COUNTER;
	
	incrementer: process(RST,EN,INPUT)
	begin
		if (RST = '1') then
			COUNTER <= ZEROS;
		elsif (INPUT'event and INPUT = '1' and EN = '1') then
			COUNTER <= COUNTER + '1';
		end if;
	end process;

end Behavioral;

