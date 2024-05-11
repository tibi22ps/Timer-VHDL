library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity debouncer is
	port( btn, clock: in std_logic;
	dbc: out std_logic);
end entity;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity si3 is
	port(a,b,c: in std_logic;
	O: out std_logic); 
end entity;

architecture arhsi3 of si3 is	
begin
	O <= a and b and c;
end architecture ;

architecture arhdebouncer of debouncer is

component si3 is
	port(a,b,c: in std_logic;
	O: out std_logic);
end component ;			   

component bist_d is	  
	port ( D, R, clk: in std_logic;
	Q: out std_logic);
end component;

signal s1, s2, s3: std_logic; 
signal rst: std_logic;
begin  
	d1: bist_d port map (btn, rst, clock, s1);
	d2: bist_d port map (s1, rst, clock, s2);
	d3: bist_d port map (s2, rst, clock, s3);
	d4: si3 port map (s1, s2, s3, dbc);
end architecture ;