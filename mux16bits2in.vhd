library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux16bits2in is
	 port(   entr0 : in unsigned(15 downto 0);
			 entr1 : in unsigned(15 downto 0);
			 sel : in unsigned(1 downto 0); 
			 saida : out unsigned(15 downto 0));
end entity;

architecture a_mux16bits2in of mux16bits2in is
begin
	 saida <= entr0 when sel="00" else
			  entr1 when sel="01" else
			  "0000000000000000";
end architecture;