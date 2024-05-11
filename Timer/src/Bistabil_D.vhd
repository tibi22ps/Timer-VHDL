library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity bist_d is	  
	port ( D, R, clk: in std_logic;
	Q: out std_logic);
end entity;		

architecture arhbistd of bist_d is
begin
	process (clk, R)
	begin
		if (R = '1') then 
			Q <= '0';
		elsif (clk'event and clk = '1') then
			Q <= D;
		end if;
	end process;
end architecture arhbistd;
