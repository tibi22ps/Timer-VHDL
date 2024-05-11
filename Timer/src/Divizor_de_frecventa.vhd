library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity divizor_frecv is	  
	port ( clk_100: in std_logic;
	clk_1: out std_logic);
end entity;		

architecture arhdivizor of divizor_frecv is
begin
	process (clk_100)
	variable x: std_logic_vector (0 to 26) := (others => '0');
	begin 
		if (clk_100'event and clk_100 = '1')
			then x := x+1;
		end if;
		clk_1 <=x(26);
	end process;
end architecture;