library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity numarator09 is 
	port ( increm, clk, R, en, sens: in std_logic;
	Dout: out std_logic_vector (3 downto 0);
	carry: out std_logic); 
end entity;

architecture ahrnumarator09 of numarator09 is
signal M: std_logic_vector (3 downto 0):=(others => '0'); 	
--signal sens_a: std_logic;
begin
process(clk, R, en)
begin 					
	
		if R='1' then M <= "0000"; 	  
		else
		if (clk'event and clk = '1') then 	
			if (en='0') then M <= M;
			else
				if (increm'event and increm = '1') then
					M <= M + "0001";
				elsif (sens = '0') then
								if (M < "1001") then 
									M <= M + "0001"; 
									carry <= '0';
								else 
									M <= "0000"; 
									carry <= '1';  
								end if;	
							else
								if (M > "0000") then 
									M <= M - "0001"; 
									carry <= '0';
								else			
									M <= "1001";
									carry <= '1';  
								end if;
							end if;
						end if;
					end if;
				end if;	
end process; 
Dout <= M; 	
end architecture;				   
