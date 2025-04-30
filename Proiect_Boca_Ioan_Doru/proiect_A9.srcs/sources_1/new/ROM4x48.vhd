----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 12:13:02 PM
-- Design Name: 
-- Module Name: ROM4x8 - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM4x48 is
    Port ( ADD:in std_logic_vector (1 downto 0);
           D: out std_logic_vector (47 downto 0));
    type MEM_TYPE is array(0 to 3) of std_logic_vector (47 downto 0);
end ROM4x48;

architecture Behavioral of ROM4x48 is
signal MEM: MEM_TYPE :=("001100010111001100001010001100010111010101001010",
                        "001100010111001100001010001100010111010101001010",
                        "100011100100100101100110100111101000101001101010",
                        "101011101011101011101011101011101011101011101011");
begin
    D<=MEM(TO_INTEGER(UNSIGNED(ADD)));
end Behavioral;
