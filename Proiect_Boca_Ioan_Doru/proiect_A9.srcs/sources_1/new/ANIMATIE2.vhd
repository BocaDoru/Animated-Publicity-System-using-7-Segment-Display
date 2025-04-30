----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2024 06:49:46 PM
-- Design Name: 
-- Module Name: ANIMATIE1 - Behavioral
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

entity ANIMATIE2 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
end ANIMATIE2;

architecture Behavioral of ANIMATIE2 is

signal NEN:std_logic :='1';
signal clkD2: std_logic;
signal n: std_logic := '0';

component clock_div is
    Generic(N: integer := 100_000_000);
    Port(clk,reset: in std_logic;
         clock_out: out std_logic);
end component;

begin

NEN<=not(EN);
CLKDIVC2: clock_div generic map(50_000_000) port map(CLK,NEN,clkD2);--50_000_000

process(clkD2,EN)
begin
if EN='0' then 
    n<='0';
    MESAJNEXT<= x"FFFFFFFFFFFF";
elsif rising_edge(clkD2) then
    if n='1' then
        MESAJNEXT<=MESAJ;
        n<='0';
    else
        MESAJNEXT<=x"FFFFFFFFFFFF";
        n<='1';
    end if;
end if;
end process;
end Behavioral;
