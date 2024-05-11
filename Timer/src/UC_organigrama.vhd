library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity UC_organigrama is
	 port(
		 Start : in STD_LOGIC;
		 M : in STD_LOGIC;
		 S : in STD_LOGIC;
		 is0: in std_logic;
		 clk: in std_logic;
		 updown: out STD_LOGIC;
		 reset: out STD_LOGIC;
		 inS: out std_logic;
		 inM: out std_logic;
		 en: out std_logic;
		 alarma: out std_logic);
end UC_organigrama;

architecture arhuc of UC_organigrama is	 
type stare_a is (ST0, CU, ST2, WT, CD, Alarm);
	signal stare, nextstare: stare_a;
begin
	actualizare_stare: process (M, S, clk)
	begin
		if (M = '1' and S = '1') then
		stare <= ST0;
		elsif (clk'EVENT and clk = '1') then
		stare <= nextstare;
		end if;
	end process actualizare_stare;

	tranzitii: process (stare, M, S, Start, is0)
	begin
		case stare is
			when ST0 =>	
			reset<= '0';
			alarma <='0';
			if Start = '1'then 
				nextstare <= CU;
				en <= '0';
				updown <='0'; --numara crescator
			elsif (M='0' and S='0') then
				nextstare <= ST0;
				updown<='0';
				en <='0'; 
			elsif (M='0' and S='1') then
				inS <='1';
				updown <= '1';
				nextstare <= WT; 
				en<='0';
			elsif (M='1' and S='0')	then
				inM <='1';
				nextstare <= WT;
				updown <= '1';
				en<='0';
			else 
				nextstare <= ST0;
				updown <='0';
				en<='0';
				reset <='1';
			end if;
			
			when CU =>
			   if Start = '1'then 
				nextstare <= ST2;
				en <= '1';
				updown <='0'; --numara crescator
			elsif (M='0' and S='0') then
				nextstare <= CU;
				updown<='0';
				en <='0';
			elsif (M='0' and S='1')	then
				inS <='1';
				updown <= '1';
				nextstare <= WT; 
				en<='0';
			elsif (M='1' and S='0')	then
				inM <='1';
				nextstare <= WT;
				updown <= '1';
				en<='0';
			else 
				nextstare <= ST0;
				updown <='0';
				en<='0';   
				reset<='1';
			end if;	 
			
			when ST2 =>
			 if Start = '1'then 
				nextstare <= CU;
				en <= '0';
				updown <='0'; --numara crescator
			elsif (M='0' and S='0')	then
				nextstare <= ST2;
				updown<='0';
				en <='0';
			elsif (M='0' and S='1')	then
				inS <='1';
				updown <= '1';
				nextstare <= WT; 
				en<='0';
			elsif (M='1' and S='0')	then
				inM <='1';
				nextstare <= WT;
				updown <= '1';
				en<='0';
			else 
				nextstare <= ST0;
				updown <='0';
				en<='0';  
				reset <='1';
			end if;	 
		
			when WT =>
			 if Start = '1'then 
				nextstare <= CD;
				en <= '0';
				updown <='1'; --numara descrescator
			elsif (M='0' and S='0')	then
				nextstare <= WT;
				updown<='1';
				en <='0';
			elsif (M='0' and S='1')	then
				inS <='1';
				updown <= '1';
				nextstare <= WT; 
				en<='0';
			elsif (M='1' and S='0') then
				inM <='1';
				nextstare <= WT;
				updown <= '1';
				en<='0';
			else 
				nextstare <= ST0;
				updown <='0';
				en<='0';  
				reset <='1';
			end if;	 
		
			when CD =>
			   if Start = '1' then 
				nextstare <= WT;
				en <= '1';
				updown <='1';
			else 
				en<='1';
				updown<='1'; 
				if (is0='1') then
					nextstare<= Alarm;
					alarma <= '1';
				else 
					nextstare <= CD;
					alarma <= '0';
			end if ;
		end if;	 
		when others	=>
		reset <='1';
		end case;
	end process	tranzitii; 
	
end arhuc;
