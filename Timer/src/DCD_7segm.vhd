library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity dcd_7segm is
	port(nr: in std_logic_vector(3 downto 0);
	seg: out std_logic_vector(0 to 6));
end entity;

architecture arhdcd of dcd_7segm is
begin
	process(nr)
	begin
		case nr is	   
			when x"0" => seg <= "1111110"; 
			when x"1" => seg <= "0110000";
			when x"2" => seg <= "1101101";
			when x"3" => seg <= "1111001";
			when x"4" => seg <= "0110011";
			when x"5" => seg <= "1011011";
			when x"6" => seg <= "1011111";
			when x"7" => seg <= "1110001";
			when x"8" => seg <= "1111111";
			when x"9" => seg <= "1111011"; 
			when others => seg <= "0000000";  
		end case;
	end process;
end architecture;