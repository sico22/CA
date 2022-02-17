----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 11:06:28 AM
-- Design Name: 
-- Module Name: test_env - Behavioral
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

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is

    signal cnt : std_logic_vector(15 downto 0) := (others => '0');
    signal st0 : std_logic;
    
    component mpg is
        Port ( clk : in STD_LOGIC;
               btn : in STD_LOGIC;
               st : out STD_LOGIC);
    end component mpg;
    
begin

    comp1 : mpg Port Map (clk => clk, btn => btn(0), st => st0);

    led <= cnt;
    an <= btn(3 downto 0);
    cat <= (others=>'0');
    
    counter: process(clk)
    begin
        if rising_edge(clk) then
            if st0 = '1' then
                cnt <= cnt + 1;
            end if;
        end if;
    end process counter;
    
    

end Behavioral;
