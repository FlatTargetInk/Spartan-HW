----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:50 03/25/2017 
-- Design Name: 
-- Module Name:    Top_Level - Behavioral 
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
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Level is

	Port(	CLK		: in STD_LOGIC;
		BTN_NORTH	: in STD_LOGIC;
		BTN_SOUTH	: in STD_LOGIC;
		BTN_EAST		: in STD_LOGIC;
		BTN_WEST		: in STD_LOGIC;
		ROT_CENTER	: in STD_LOGIC;
		ROT_A			: in STD_LOGIC;
		ROT_B			: in STD_LOGIC;
		SW				: in STD_LOGIC_VECTOR(3 downto 0);
		LED			: out STD_LOGIC_VECTOR(7 downto 0));
		
end Top_Level;

architecture Structural of Top_Level is

	----> Management <----
	signal RESET	: STD_LOGIC := '0';
	signal BTNS		: STD_LOGIC_VECTOR(3 downto 0);
	signal T_ROTIN	: STD_LOGIC_VECTOR(1 downto 0);
	----> Inputs <----
	signal SCLK		: STD_LOGIC := '0';
	signal ENABLE	: STD_LOGIC := '1';	-- May want to drive this signal with a switch
	signal DBTN		: STD_LOGIC_VECTOR (3 downto 0) := (OTHERS => '0');
	signal ROTARY	: STD_LOGIC_VECTOR (1 downto 0) := (OTHERS => '0');	-- 1 means left, 0 means right, signaled by state transition
	----> Outputs <----
	signal LED_OUT	: STD_LOGIC_VECTOR (7 downto 0) := (OTHERS => '0');

begin

	------ Place UUT Here ------
	----------------------------
--	Incrementer: entity work.led_increment
--	port map(INPUT	=> ROTARY(0),
--				EN		=> ENABLE,
--				RST	=> RESET,
--				LEDS	=> LED_OUT);
	
	LED_OUT <= "000000" & ROTARY;
	
	------ Hardware Units ------
	----------------------------
	BTNS <= BTN_EAST & ROT_CENTER & BTN_NORTH & BTN_WEST;
	Button_Debounce: entity work.button_debounce
	port map(CLK	=> CLK,
				EN		=> ENABLE,
				BTN	=> BTNS,
				DBTN	=> DBTN);
	
	T_ROTIN <= ROT_A & ROT_B;
	Rotary_Encoder: entity work.rotary_debounce
	port map(CLK	=> CLK,
				EN		=> ENABLE,
				ROTIN	=> T_ROTIN,
				ROUT	=> ROTARY);
	
	LED <= LED_OUT;
	RESET <= BTN_SOUTH;
	
end Structural;

-- vim:set ts=3 sw=3 noexpandtab: