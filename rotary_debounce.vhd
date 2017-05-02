----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:52:06 04/28/2017 
-- Design Name: 
-- Module Name:    rotary_debounce - Structural 
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

entity rotary_debounce is
	
	Port(	CLK	: in STD_LOGIC;
			EN		: in STD_LOGIC;
			ROTIN	: in STD_LOGIC_VECTOR(1 downto 0);
			ROUT	: out STD_LOGIC_VECTOR(1 downto 0));
			
end rotary_debounce;

architecture Structural of rotary_debounce is

	signal DEBOUNCED	: STD_LOGIC_VECTOR(1 downto 0);

begin

	----> Debounce input <----
	ROT_0: entity work.debounce
	port map(CLK		=> CLK,
				EN			=> EN,
				INPUT		=> ROTIN(0),
				OUTPUT	=> DEBOUNCED(0));
	
	ROT_1: entity work.debounce
	port map(CLK		=> CLK,
				EN			=> EN,
				INPUT		=> ROT(1),
				OUTPUT	=> DEBOUNCED(1));
	
	----> Change state <----
	--the_wankel: entity work.rotary_machine
	

end Structural;

