----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 02:57:09 PM
-- Design Name: 
-- Module Name: TOP_MODULE - Behavioral
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

entity TOP_MODULE is
    Port ( SEL : in std_logic_vector(1 downto 0);
           CLK: in std_logic;
           CAT: out std_logic_vector(7 downto 0);
           AN : out std_logic_vector(7 downto 0));
    type MESAJ_Array is array(3 downto 0) of std_logic_vector (47 downto 0);
end TOP_MODULE;

architecture Behavioral of TOP_MODULE is
signal MESAJ1: std_logic_vector (47 downto 0):="001100010111001100001010001100010111010101001010";--COCACOLA
signal MESAJ2: MESAJ_Array;
signal MESAJOUT: std_logic_vector (47 downto 0);
signal EN: std_logic_vector(3 downto 0):="0001";

component ROM4x48 is
    Port ( ADD:in std_logic_vector (1 downto 0);
           D: out std_logic_vector (47 downto 0));
end component;

component ANIMATIE1 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
end component;

component ANIMATIE2 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
end component;

component ANIMATIE3 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
end component;

component ANIMATIE4 is
    Port ( EN: in std_logic;
           MESAJ:in std_logic_vector (47 downto 0);
           CLK:in std_logic;
           MESAJNEXT:out std_logic_vector (47 downto 0));
end component;

component MUX4x1 is
    Port (sel:in std_logic_vector (1 downto 0);
          D0,D1,D2,D3:in std_logic_vector (47 downto 0);
          Q:out std_logic_vector (47 downto 0));
end component;

component DMUX1x4 is
    Port (sel:in std_logic_vector (1 downto 0);
          Q:out std_logic_vector(3 downto 0));
end component ;

component SEVENSEGMENT is
    Port ( CODE_ARR: std_logic_vector (47 downto 0);
           CLK: in std_logic;
           CAT: out std_logic_vector(7 downto 0);
           AN : out std_logic_vector(7 downto 0));
end component;

begin

CROM4x48: ROM4x48 port map(SEL,MESAJ1);

CDMUX1x4: DMUX1x4 port map(SEL,EN);

ANIM1: ANIMATIE1 port map(EN(0),MESAJ1,CLK,MESAJ2(0));
ANIM2: ANIMATIE2 port map(EN(1),MESAJ1,CLK,MESAJ2(1));
ANIM3: ANIMATIE3 port map(EN(2),MESAJ1,CLK,MESAJ2(2));
ANIM4: ANIMATIE4 port map(EN(3),MESAJ1,CLK,MESAJ2(3));

CMUX4x1: MUX4x1 port map(SEL,MESAJ2(0),MESAJ2(1),MESAJ2(2),MESAJ2(3),MESAJOUT);

SEVSEG: SEVENSEGMENT port map(MESAJOUT,CLK,CAT,AN);

end Behavioral;
