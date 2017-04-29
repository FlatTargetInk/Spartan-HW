----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:23 04/28/2017 
-- Design Name: 
-- Module Name:    button_debounce - Behavioral 
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

entity button_debounce is

	Port(	CLK	: in STD_LOGIC;
			EN		: in STD_LOGIC;
			BTN	: in STD_LOGIC_VECTOR (3 downto 0);
			DBTN	: out STD_LOGIC_VECTOR (3 downto 0));

end button_debounce;

architecture Structural of button_debounce is

	signal DEBOUNCED : STD_LOGIC_VECTOR (3 downto 0) := (OTHERS => '0');

begin
	
	DBTN <= DEBOUNCED;

	BTN_0: entity work.debounce
	port map(CLK		=> CLK,
				EN			=> EN,
				INPUT		=> BTN(0),
				OUTPUT	=> DEBOUNCED(0));
	
	BTN_1: entity work.debounce
	port map(CLK		=> CLK,
				EN			=> EN,
				INPUT		=> BTN(1),
				OUTPUT	=> DEBOUNCED(1));
	
	BTN_2: entity work.debounce
	port map(CLK		=> CLK,
				EN			=> EN,
				INPUT		=> BTN(2),
				OUTPUT	=> DEBOUNCED(2));
	
	BTN_3: entity work.debounce
	port map(CLK		=> CLK,
				EN			=> EN,
				INPUT		=> BTN(3),
				OUTPUT	=> DEBOUNCED(3));

end Structural;

-- vim:set ts=3 sw=3 noexpandtab: