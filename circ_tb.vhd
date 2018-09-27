library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circ_tb is
end entity;

architecture a_circ_tb of circ_tb is
	component ula
	    port ( entr0 : in unsigned(15 downto 0);
	    	   entr1 : in unsigned(15 downto 0);
	    	   sel : in unsigned(1 downto 0);
	    	   result : out unsigned(15 downto 0);
	    	   maiorIgual : out std_logic);
    end component;

	component bank8regs
		port(   saida0 : out unsigned(15 downto 0);
				saida1 : out unsigned(15 downto 0);
			 	saida2 : out unsigned(15 downto 0);
			 	saida3 : out unsigned(15 downto 0);
			 	saida4 : out unsigned(15 downto 0);
			 	saida5 : out unsigned(15 downto 0);
			 	saida6 : out unsigned(15 downto 0);
			 	saida7 : out unsigned(15 downto 0);
			 	sel : in unsigned(2 downto 0); 
			 	entrada : in unsigned(15 downto 0)
			 );
	end component;

    signal sel: unsigned(1 downto 0);
    signal maiorIgual: std_logic;
    signal entr0,entr1,result: unsigned(15 downto 0);

end architecture;
