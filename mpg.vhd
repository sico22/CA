----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 12:02:25 PM
-- Design Name: 
-- Module Name: mpg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mpg is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           st : out STD_LOGIC);
end mpg;

architecture Behavioral of mpg is

    signal cnt : std_logic_vector(15 downto 0) := (others => '0');
    signal q1 : std_logic;
    signal q2 : std_logic;

begin

    counter: process(clk)
    begin
        if rising_edge(clk) then
            if btn = '1' then
                cnt <= cnt + 1;
            end if;
        end if;
    end process counter;
    
    first_ff: process(clk)
    begin
        if rising_edge(clk) then
            if cnt = x"ffff" then
                q1 <= btn;
            end if;
        end if;
    end process first_ff;
    
    second_ff: process(clk)
    begin
        if rising_edge(clk) then
            q2 <= q1;
        end if;
    end process second_ff;
 
    st <= q1 and not q2;

end Behavioral;
