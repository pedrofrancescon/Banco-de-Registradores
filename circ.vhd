library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circ is
	port ( selUla: in unsigned(1 downto 0);
		   selBankOut1: in unsigned(2 downto 0);
		   selBankOut2: in unsigned(2 downto 0);
		   selBankIn: in unsigned(2 downto 0);
		   selMux: in unsigned(1 downto 0);
		   wr_en: in std_logic;
		   rst: in std_logic;
		   clk: in std_logic;
		   topLevel : in unsigned(15 downto 0);
		   outUla : out unsigned(15 downto 0)
		);
end entity;

architecture a_circ of circ is
	component ula
	    port ( entr0 : in unsigned(15 downto 0);
	    	   entr1 : in unsigned(15 downto 0);
	    	   sel : in unsigned(1 downto 0);
	    	   result : out unsigned(15 downto 0);
	    	   maiorIgual : out std_logic
	    	   );
    end component;

	component bank8regs
		port ( selOut1: in unsigned(2 downto 0);
		   	   selOut2: in unsigned(2 downto 0);
		   	   dataIn: in unsigned(15 downto 0);
		   	   selIn: in unsigned(2 downto 0);
		   	   wr_en: in std_logic;
		   	   clk: in std_logic;
		   	   rst: in std_logic;
		   	   out1: out unsigned(15 downto 0);
		   	   out2: out unsigned(15 downto 0)
			   );
	end component;

	component mux16bits2in
		port(   entr0 : in unsigned(15 downto 0);
			 	entr1 : in unsigned(15 downto 0);
			 	sel : in unsigned(1 downto 0);
			 	saida : out unsigned(15 downto 0)
			 );
	end component;

    signal out_Ula, outBank1, outBank2, outMux: unsigned(15 downto 0);

    signal maiorIgual: std_logic;

    	begin

    	lua: ula port map ( entr0=> outBank1,
    						entr1=> outMux,
    						sel=> selUla,
    						result=> out_Ula,
    						maiorIgual=> maiorIgual);

    	banco: bank8regs port map ( selOut1=> selBankOut1,
    								selOut2=> selBankOut2,
    								dataIn=> out_Ula,
    								selIn=> selBankIn,
    								wr_en=> wr_en,
    								clk=> clk,
    								rst=> rst,
    								out1=> outBank1,
    								out2=> outBank2);

    	mux: mux16bits2in port map ( entr0=> outBank2,
    								 entr1=> topLevel,
    								 sel=> selMux,
    								 saida=> outMux);

    	outUla <= out_Ula;

end architecture;