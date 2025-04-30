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

entity ANIMATIE3 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
    type Counter_Array is array(7 downto 0) of std_logic_vector(2 downto 0);
end ANIMATIE3;

architecture Behavioral of ANIMATIE3 is

signal NEN:std_logic :='1';
signal clkD2: std_logic;
signal ENIN: std_logic_vector (8 downto 0):="000000001";
signal C_ARR: Counter_Array:=("000","000","000","000","000","000","000","000");

component clock_div is
    Generic(N: integer := 100_000_000);
    Port(clk,reset: in std_logic;
         clock_out: out std_logic);
end component;

component COUNTER is
    Generic(stop: std_logic_vector (2 downto 0));
    Port (ENIN: in std_logic;
          clk: in std_logic;
          rst: in std_logic;
          Q:out std_logic_vector(2 downto 0);
          ENOUT:out std_logic);
end component;

begin

NEN<=not(EN);
CLKDIVC2: clock_div generic map(12_500_000) port map(CLK,NEN,clkD2);--12_500_000

ANIMLOAD:for I in 0 to 7 generate
    ALOAD: COUNTER generic map("111") port map(ENIN(I),clkD2,NEN,C_ARR(I),ENIN(I+1));
end generate ANIMLOAD;

process(clkD2,EN)
begin
if EN='0' then 
    MESAJNEXT<= x"FFFFFFFFFFFF";
elsif rising_edge(clkD2) then
    for I in 0 to 7 loop
        if ENIN(I)='1' then
            MESAJNEXT(I*6+5 downto I*6)<=MESAJ(conv_integer(C_ARR(I))*6+5 downto conv_integer(C_ARR(I))*6);
        else
            MESAJNEXT(I*6+5 downto I*6)<="111111";
        end if;
    end loop;
end if;
end process;
end Behavioral;
