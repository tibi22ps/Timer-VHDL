library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity mux41 is	
	port(A,B,C,D: in std_logic_vector(3 downto 0);
	s0, s1: in std_logic;
	Z: out std_logic_vector(3 downto 0));
end mux41;

architecture arhmux41 of mux41 is
begin
	process(A,B,C,D,s0,s1)
	begin
		if (s0='0' and s1='0') then Z<=A;
		elsif(s0='0' and s1='1') then Z<=B;
		elsif(s0='1' and s1='0') then Z<=C;
		else Z<=D;	 
		end if;
	end process;
end architecture ;