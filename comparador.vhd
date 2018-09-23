library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparador is
 port( 	in1 : in unsigned(15 downto 0);
 	    in2 : in unsigned(15 downto 0);
 		maiorIgual : out std_logic );
end entity;
  
architecture a_comparador of comparador is
begin
 			 maiorIgual <= '1' when in1 > in2 else
 			 			   '0'; 
end architecture;