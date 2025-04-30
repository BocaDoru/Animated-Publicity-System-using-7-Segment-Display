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

entity ANIMATIE4 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
end ANIMATIE4;

architecture Behavioral of ANIMATIE4 is

signal clkD2: std_logic;
signal mesaj2: std_logic_vector (47 downto 0):=x"FFFFFFFFFFFF";
signal char_counter: std_logic_vector(3 downto 0) := "0000";

signal N: integer:=200_000_000;
signal count: integer:=1;
signal tmp : std_logic := '0';

begin

process(CLK,EN)
begin
if EN='0' then
    count<=1;
    tmp<='0'; 
elsif(rising_edge(CLK)) then
    count <=count+1;
    if (count = N/(conv_integer(char_counter)+1)) then
        tmp <= NOT tmp;
        count <= 1;
    end if;
end if;
clkD2 <= tmp;
end process;

process(clkD2,EN)
begin
if EN='0' then
    mesaj2<=x"FFFFFFFFFFFF";
    char_counter<="0000";
elsif rising_edge(clkD2) then
    mesaj2<=mesaj2(41 downto 0)&MESAJ((7-conv_integer(char_counter))*6+5 downto (7-conv_integer(char_counter))*6);
    char_counter <= char_counter + 1;
    if char_counter="1000" then
        char_counter<="0000";
        mesaj2<=x"FFFFFFFFFFFF";
    end if;
end if;
MESAJNEXT<= mesaj2;
end process;
end Behavioral;
