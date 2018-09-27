library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bank8regs is
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
end entity;

architecture a_bank8regs of bank8regs is

	component reg16bits
	    port( clk: in std_logic;
		  rst: in std_logic;
		  wr_en: in std_logic;
		  data_in: in unsigned(15 downto 0);
		  data_out: in unsigned(15 downto 0)
		);
    end component;

    component mux16bits
    	port(entr0 : in unsigned(15 downto 0);
			 entr1 : in unsigned(15 downto 0);
			 entr2 : in unsigned(15 downto 0);
			 entr3 : in unsigned(15 downto 0);
			 entr4 : in unsigned(15 downto 0);
			 entr5 : in unsigned(15 downto 0);
			 entr6 : in unsigned(15 downto 0);
			 entr7 : in unsigned(15 downto 0);
			 sel : in unsigned(2 downto 0);
			 saida : out unsigned(15 downto 0));
    end component;

	begin --como difeerenciar variaveis de mesmo nome na arquitetura e no componente
		r0: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r1: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r2: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r3: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r4: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r5: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r6: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		r7: reg16bits port map( rst =>rst, wr_en=>wr_en , data_in=>data_in , data_out=>data_out);
		--eu devo fazer com flexinha indo ou voltando?
		mux1: mux16bits port map(entr0<=, entr1<=, entr2<=, entr3<=, entr4<=, entr5<=, entr6<=, entr7<=, sel<=, saida<=);
		mux2: mux16bits port map(entr0<=, entr1<=, entr2<=, entr3<=, entr4<=, entr5<=, entr6<=, entr7<=, sel<=, saida<=);

end architecture;
