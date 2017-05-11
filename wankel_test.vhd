--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:47:46 05/10/2017
-- Design Name:   
-- Module Name:   /home/robert/Github/Spartan-HW/wankel_test.vhd
-- Project Name:  SpartanHardware
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rotary_machine
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY wankel_test IS
END wankel_test;
 
ARCHITECTURE behavior OF wankel_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rotary_machine
    PORT(
         EN : IN  std_logic;
         INS : IN  std_logic_vector(1 downto 0);
         DIR : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';
   signal INS : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal DIR : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rotary_machine PORT MAP (
          EN => EN,
          INS => INS,
          DIR => DIR
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		EN <= '1';

      wait for CLK_period*10;
		
      -- insert stimulus here 
		INS <= "01";
		
		wait for CLK_period;
		
		INS <= "11";
		
		wait for CLK_period;
		
		INS <= "00";
		
		wait for CLK_period;
		
		INS <= "01";
		
		wait for CLK_period;
		
		INS <= "11";
		
		wait for CLK_period;
		
		INS <= "10";
		
		wait for CLK_period;
		
		INS <= "00";
		
		wait for CLK_period;
		
		INS <= "10";
		
		wait for CLK_period;
		
		INS <= "11";
		
		wait for CLK_period;
		
		INS <= "00";
		
		
      wait;
   end process;

END;
