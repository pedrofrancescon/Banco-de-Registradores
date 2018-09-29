library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circ_tb is
end entity;

architecture a_circ_tb of circ_tb is

    component circ 
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
    end component;

    signal outUla,topLevel: unsigned(15 downto 0);
    signal selBankOut1,selBankOut2,selBankIn: unsigned(2 downto 0);
    signal selUla,selMux: unsigned(1 downto 0);
    signal wr_en,clk,rst: std_logic;

    begin

    borboleta: circ port map ( selUla => selUla,
		   					   selBankOut1 => selBankOut1, 
							   selBankOut2 => selBankOut2,
							   selBankIn => selBankIn, 
							   selMux => selMux, 
							   wr_en => wr_en, 
							   rst => rst, 
							   clk => clk, 
							   topLevel => topLevel,  
							   outUla => outUla
							);

    	process
		begin
		clk <= '0';
	    wait for 50 ns;
	    clk <= '1';
	    wait for 50 ns;
	    end process;

	    process -- sinal de reset
	    begin
	    rst <= '1';
	    wait for 100 ns;
	    rst <= '0';
	    wait;
	    end process;

		process
		begin
		selBankOut1 <= "000";
		--selBankOut2 <= "000";
		selBankIn <= "000";
		selUla <= "00";
		--selMux <= "01";
		wr_en <= '0';
		topLevel <= "0000000000000101";
		selMux <= "01";
		wait for 100 ns;
		--outUla <= "0000000000000001";
		--outBank1 <= "0000000000000010";
		--outBank2 <= "0000000000000011";
		--outMux <= "0000000000000100";
		topLevel <= "0000000000000101";
		selBankOut1 <= "000";
		selBankOut2 <= "000";
		selBankIn <= "000";
		selUla <= "00";
		selMux <= "01";
		wr_en <= '1';
		wait for 100 ns;
		selBankOut1 <= "001";
		selBankOut2 <= "010";
		selBankIn <= "011";
		selUla <= "01";
		selMux <= "01";
		wait for 100 ns;
		selBankOut1 <= "010";
		selBankOut2 <= "100";
		selBankIn <= "011";
		selUla <= "10";
		selMux <= "01";
		wait for 100 ns;
		selBankOut1 <= "110";
		selBankOut2 <= "101";
		selBankIn <= "001";
		selUla <= "10";
		selMux <= "01";
		wait for 100 ns;
		selBankOut1 <= "000";
		selBankOut2 <= "100";
		selBankIn <= "010";
		selUla <= "00";
		selMux <= "01";
		wait for 100 ns;
		wait;
		end process;


end architecture;
