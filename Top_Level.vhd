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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Level is
	Port(	CLK	: in STD_LOGIC;
		PBN	: in STD_LOGIC;
		PBS	: in STD_LOGIC;
		PBE	: in STD_LOGIC;
		PBW	: in STD_LOGIC;
		SW	: in STD_LOGIC_VECTOR(3 downto 0);
		LED	: out STD_LOGIC_VECTOR(7 downto 0)
	);
end Top_Level;

architecture Structural of Top_Level is

begin

LED(0) <= PBN;

end Structural;

