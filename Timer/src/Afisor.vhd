library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity afisor is
	port(N1,N2,N3,N4:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	CLK_100: in std_logic;
	R:in std_logic;		
	an: out std_logic_vector(3 downto 0);
	cat:out std_logic_vector(6 downto 0));
end entity;

architecture arhafisor of afisor is

component mux41 is
	port(A,B,C,D: in std_logic_vector(3 downto 0);
	s0, s1: in std_logic;
	Z: out std_logic_vector(3 downto 0));
end component;

component dcd_7segm is
	port(nr: in std_logic_vector(3 downto 0);
	seg: out std_logic_vector(0 to 6));
end component;

component num is
	port(clk, R: in std_logic;
	Q: out std_logic_vector(1 downto 0));
end component; 

signal md: std_logic_vector(3 downto 0);
signal sig: std_logic_vector(1 downto 0);

begin 
	c1:mux41 port map (N1, N2, N3, N4, sig(0), sig(1), md);
	c2:mux41 port map ("1110", "1101", "1011", "0111", sig(0), sig(1), an);
	c3:num port map (clk_100, R, sig);
	c4: dcd_7segm port map (md, cat);
end architecture;

