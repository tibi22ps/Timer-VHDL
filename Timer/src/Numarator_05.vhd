library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity numarator05 is 
	port ( clk, R, en, sens: in std_logic;
	Dout: out std_logic_vector (2 downto 0);
	carry: out std_logic); 
end entity;

architecture ahrnumarator05 of numarator05 is
signal M: std_logic_vector (2 downto 0) :=(others => '0');	  
--signal sens_a: std_logic;
begin
	process(clk, R, en, sens)
	begin
		if R='1' then M <= "000";
			else
			if (clk'event and clk ='1') then
				if (en = '0') then	M <= M;
						else
						if (sens = '0') then
							if (M < "101") then 
								M <= M + "001";	
								carry <= '0';
							else 
								M <= "000";	
								carry <= '1';  
							end if;	
						else
							if (M > "000") then 
								M <= M - "001";	
								carry <= '0';
							else				 
								M <= "101";	 
								carry <= '1';  
							end if;
						end if;
					end if;
				end if;
			end if;	 
	end process;  
	Dout <= M; 
--process (sens)
--begin		
--	if (clk'event and clk ='1') then
--		sens_a <= sens;	  
--	end if;
--end process;
end architecture;
					