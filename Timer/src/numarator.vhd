library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity num is
	port(clk, R: in std_logic;
	Q: out std_logic_vector(1 downto 0));
end num;

architecture arhnum of num is
signal X: std_logic_vector(1 downto 0);
begin
	process(clk, R)
	begin
		if R='1' then
			X <="00";
		elsif (clk'event and clk='0') then
			X<=X+1;
		end if;
	end process;
	Q <=X;
end architecture ;