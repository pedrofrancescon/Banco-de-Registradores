library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula_tb is
end;

architecture a_ula_tb of ula_tb is
    component ula
	    port ( entr0 : in unsigned(15 downto 0);
	    	   entr1 : in unsigned(15 downto 0);
	    	   sel : in unsigned(1 downto 0);
	    	   result : out unsigned(15 downto 0);
	    	   maiorIgual : out std_logic);
    end component;

    signal sel: unsigned(1 downto 0);
    signal maiorIgual: std_logic;
    signal entr0,entr1,result: unsigned(15 downto 0); 

		begin

		uut: ula port map(sel => sel, 
		                  entr0 => entr0,
		                  entr1 => entr1,
						  result => result,
						  maiorIgual => maiorIgual); 


		

		process
		begin
		sel <= "00"; -- soma
		entr0 <= "0000000001000101"; -- 69
		entr1 <= "0000000000011000"; -- 24
		wait for 10 ns;
		sel <= "01"; -- sub
		entr0 <= "0000000001000101"; -- 69
		entr1 <= "0000000000011000"; -- 24
		wait for 10 ns;
		sel <= "10"; -- multiplicação
		entr0 <= "0000000001000101"; -- 69
		entr1 <= "0000000000011000"; -- 24
		wait for 10 ns;
		sel <= "11"; -- divisão
		entr0 <= "0000000001000101"; -- 69
		entr1 <= "0000000000000011"; -- 3
		wait for 10 ns;
		sel <= "00"; -- soma
		entr0 <= "0000000000010101"; -- 21
		entr1 <= "0000000000000011"; -- 3
		wait for 10 ns;
		sel <= "01"; -- sub
		entr0 <= "0000000000010101"; -- 21
		entr1 <= "0000000000000011"; -- 3
		wait for 10 ns;
		sel <= "10"; -- multiplicação
		entr0 <= "0000000000010101"; -- 21
		entr1 <= "0000000000000011"; -- 3
		wait for 10 ns;
		sel <= "11"; -- divisão
		entr0 <= "0000000000010101"; -- 21
		entr1 <= "0000000000000011"; -- 3
		wait for 10 ns;
		wait;
		end process;
		end architecture;
