----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2024 10:45:12 PM
-- Design Name: 
-- Module Name: COUNTER - Behavioral
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER is
    Generic(stop: std_logic_vector (2 downto 0):="111");
    Port (ENIN: in std_logic;
          clk: in std_logic;
          rst: in std_logic;
          Q:out std_logic_vector(2 downto 0);
          ENOUT:out std_logic:='0');
end COUNTER;

architecture Behavioral of COUNTER is

signal count : std_logic_vector(2 downto 0):="000";
begin
process(clk,ENIN,rst)
begin
    if rst='1' then 
        Q<="000";
        ENOUT<='0';
    elsif ENIN='1' then
        if rising_edge(clk) then
            if count=stop-1 then ENOUT<='1';
            end if;
            count <= count + 1;
        end if;
        Q <= count;
    else
        Q<="000";
    end if;
end process;
end Behavioral;
