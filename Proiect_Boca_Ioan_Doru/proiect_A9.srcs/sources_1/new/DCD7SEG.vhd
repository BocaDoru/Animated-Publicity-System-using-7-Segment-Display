----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2024 10:44:56 AM
-- Design Name: 
-- Module Name: DCD7SEG - Behavioral
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

entity DCD7SEG is
     Port ( S: in std_logic_vector (5 downto 0);
            Q: out std_logic_vector (7 downto 0));
end DCD7SEG;

architecture Behavioral of DCD7SEG is

begin
with S select
    Q <= "11000000" when "000000",--0
         "11111001" when "000001",--1
         "10100100" when "000010",--2
         "10110000" when "000011",--3
         "10011001" when "000100",--4
         "10010010" when "000101",--5
         "10000010" when "000110",--6
         "11111000" when "000111",--7
         "10000000" when "001000",--8
         "10010000" when "001001",--9
         "10001000" when "001010",--A
         "10000011" when "001011",--b
         "11000110" when "001100",--C
         "10100001" when "001101",--d
         "10000110" when "001110",--E
         "10001110" when "001111",--F
         "11000010" when "010000",--G
         "10001011" when "010001",--h
         "11001111" when "010010",--I
         "11100001" when "010011",--J
         "10001010" when "010100",--k
         "11000111" when "010101",--L
         "11001000" when "010110",--N
         "10100011" when "010111",--O
         "10001100" when "011000",--P
         "10011000" when "011001",--q
         "10101111" when "011010",--r
         "10010010" when "011011",--S
         "10000111" when "011100",--t
         "11000001" when "011101",--U
         "10001001" when "011110",--X
         "10010001" when "011111",--y
         "01111111" when "100000",--.
         "01111101" when "100001",--!
         "10101100" when "100010",--?
         "11111110" when "100011",--c1
         "11011110" when "100100",--c2
         "11001110" when "100101",--c3
         "11000111" when "100110",--c4
         "11100011" when "100111",--c5
         "11110001" when "101000",--c6
         "11111000" when "101001",--c7
         "11111100" when "101010",--c8
         "10111111" when "101011",-- -
         "11111111" when others;--OFF
end Behavioral;
