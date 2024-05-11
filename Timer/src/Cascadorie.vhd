library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity cascadorie is
	port( M, S, clkk, reset, en, sns: in std_logic;  
	s0: out std_logic_vector (3 downto 0) ;	
	s1: out std_logic_vector (2 downto 0) ;	 
	m0: out std_logic_vector (3 downto 0) ;	
	m1: out std_logic_vector (3 downto 0)) ;	
	--cry: out std_logic); 
end entity;					   

architecture arhcascadare of cascadorie is 

component numarator09 is 
	port ( increm, clk, R, en, sens: in std_logic;
	Dout: out std_logic_vector (3 downto 0);
	carry: out std_logic); 
end component;

component numarator05 is 
	port ( clk, R, en, sens: in std_logic;
	Dout: out std_logic_vector (2 downto 0);
	carry: out std_logic); 
end component;

signal carry1, carry2, carry3, carry4 :std_logic ; 
signal semnals0, semnalm0, semnalm1 :std_logic_vector(3 downto 0) ;	
signal semnals1 :std_logic_vector(2 downto 0);
begin			
	p1:numarator09 port map(S, clkk, reset, en, sns, semnals0, carry1);
	p2:numarator05 port map(carry1, reset, en , sns, semnals1, carry2);
	p3:numarator09 port map(M, carry2, reset, en , sns, semnalm0, carry3);
	p4:numarator09 port map('0', carry3, reset, en , sns, semnalm1, carry4);
	s0 <= semnals0;
	s1 <= semnals1;
	m0 <= semnalm0;
	m1 <= semnalm1;
end architecture ;