library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity timer is
	port(START, M, S: in std_logic;	 
	clock : in std_logic;
	afisajS0: out std_logic_vector(3 downto 0);
	afisajS1: out std_logic_vector(2 downto 0);
	afisajM0: out std_logic_vector(3 downto 0);
	afisajM1: out std_logic_vector(3 downto 0);
	alarma: out std_logic);
end entity;

architecture arhtimer of timer is

component cascadorie is
	port( M, S, clkk, reset, en, sns: in std_logic;
	s0: out std_logic_vector (3 downto 0) ;	
	s1: out std_logic_vector (2 downto 0) ;	 
	m0: out std_logic_vector (3 downto 0) ;	
	m1: out std_logic_vector (3 downto 0)) ;
end component;

component UC_organigrama is
	 port(
		 Start : in STD_LOGIC;
		 M : in STD_LOGIC;
		 S : in STD_LOGIC;
		 is0: in std_logic;
		 clk: in std_logic;
		 updown : out STD_LOGIC;
		 reset : out STD_LOGIC;
		 inS: out std_logic;
		 inM: out std_logic;
		 en: out std_logic;
		 alarma: out std_logic );
end component;	

signal dir, areset: std_logic;
signal maux, saux: std_logic; 
signal enaux: std_logic;


begin
areset <= M and S; 
a1: UC_organigrama port map ( START, M, S, '0', clock, dir, areset, maux, saux, enaux, alarma);
a2: cascadorie port map (M, S, clock, areset, enaux, dir, afisajS0( 3 downto 0), afisajS1(2 downto 0), afisajM0(3 downto 0), afisajM1(3 downto 0)); 

end  architecture ;




	