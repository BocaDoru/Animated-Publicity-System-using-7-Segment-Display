----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 04:00:13 PM
-- Design Name: 
-- Module Name: SevenSegment - Behavioral
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

entity SEVENSEGMENT is
    Port ( CODE_ARR: std_logic_vector (47 downto 0);
           CLK: in std_logic;
           CAT: out std_logic_vector(7 downto 0);
           AN : out std_logic_vector(7 downto 0));
    type CODE_Array is array(natural range<>) of std_logic_vector (5 downto 0);
    type CAT_Array is array(7 downto 0) of std_logic_vector(7 downto 0);
end SEVENSEGMENT;

architecture Behavioral of SEVENSEGMENT is
signal clkD1: std_logic;
signal CAT_ARR: CAT_Array := (x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF");
signal CHAR_ARR: CODE_Array(7 downto 0);
signal an_counter: std_logic_vector(2 downto 0) := "000";

component clock_div is
    generic(N: integer := 100_000_000);
    port(clk,reset: in std_logic;
         clock_out: out std_logic);
end component;

component DCD7SEG is
     Port ( S: in std_logic_vector (5 downto 0);
            Q: out std_logic_vector (7 downto 0));
end component;

component MUX8x1 is
    Port (sel:in std_logic_vector (2 downto 0);
          D0,D1,D2,D3,D4,D5,D6,D7:in std_logic_vector(7 downto 0);
          Q:out std_logic_vector(7 downto 0));
end component;

begin

CHAR_ARR(0)<=CODE_ARR( 5 downto  0);
CHAR_ARR(1)<=CODE_ARR(11 downto  6);
CHAR_ARR(2)<=CODE_ARR(17 downto 12);
CHAR_ARR(3)<=CODE_ARR(23 downto 18);
CHAR_ARR(4)<=CODE_ARR(29 downto 24);
CHAR_ARR(5)<=CODE_ARR(35 downto 30);
CHAR_ARR(6)<=CODE_ARR(41 downto 36);
CHAR_ARR(7)<=CODE_ARR(47 downto 42);

CLKDIVC1: clock_div generic map(108_000) port map(CLK,'0',clkD1);--108_000

DCD7SEGS:for I in 0 to 7 generate
    DCD7SEGC: DCD7SEG port map(CHAR_ARR(I),CAT_ARR(I));
end generate DCD7SEGS;

CATDMUX:MUX8x1 port map(an_counter,CAT_ARR(0),CAT_ARR(1),CAT_ARR(2),CAT_ARR(3),CAT_ARR(4),CAT_ARR(5),CAT_ARR(6),CAT_ARR(7),CAT);
ANDMUX: MUX8x1 port map(an_counter,x"FE",x"FD",x"FB",x"F7",x"EF",x"DF",x"BF",x"7F",AN);

HRENDER: process(clkD1)
begin
    if rising_edge(clkD1) then
        an_counter <= an_counter + 1;
    end if;
end process HRENDER;
end Behavioral;
