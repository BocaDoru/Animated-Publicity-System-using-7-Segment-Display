----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2024 10:17:06 AM
-- Design Name: 
-- Module Name: DMUX8x1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX4x1 is
    Port (sel:in std_logic_vector (1 downto 0);
          D0,D1,D2,D3:in std_logic_vector (47 downto 0);
          Q:out std_logic_vector (47 downto 0));
end MUX4x1;

architecture Behavioral of MUX4x1 is

begin
with sel select
    Q<=D0 when "00",
       D1 when "01",
       D2 when "10",
       D3 when "11",
       x"FFFFFFFFFFFF" when others;
end Behavioral;
