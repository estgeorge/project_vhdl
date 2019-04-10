entity calculadora is
   port (x1 : in bit_vector (3 downto 0);
         x2 : in bit_vector (3 downto 0);
			s0, s1, s2  : in bit;
         y : out bit_vector (3 downto 0);
         ctrl : out bit_vector (1 downto 0);
			co : out bit);
end calculadora;

architecture comportamento of calculadora is

component somador_quatro_bits is
   port ( a : in bit_vector (3 downto 0);
          b : in bit_vector (3 downto 0);
          cin : in bit;
          s : out bit_vector (3 downto 0);
          cout : out bit);
end component;

component subtrator_quatro_bits is
	port(a : in bit_vector(3 downto 0);
		  b : in bit_vector(3 downto 0);
		  t_in : in bit;
		  s : out bit_vector(3 downto 0);
		  t_out : out bit);
end component;

component multiplexador is
   port (a, b, c, d, e, s0, s1, s2  : in bit;
         y : out bit);
end component;

component comparador_quatro_bits is
	port(a, b : in bit_vector(3 downto 0);
	maiorQue, menorQue, igual : out bit);
end component;

component inversor_quatro_bits is
   port ( a : in bit_vector (3 downto 0);
          s : out bit_vector (3 downto 0));
end component;

signal soma_cout, sub_cout, maiorQue, menorQue, igual : bit;
signal soma, sub, inv: bit_vector (3 downto 0);

begin

-- operações da calculadora
usub:subtrator_quatro_bits port map (x1, x2, '1', sub, sub_cout);
usoma:somador_quatro_bits port map (x1, x2, '0', soma, soma_cout);
ucomp:comparador_quatro_bits port map (x1, x2, maiorQue, menorQue, igual);
uinv:inversor_quatro_bits port map (x1, inv);
    	 
-- multiplexação para o display de 7 segmentos		 
uy: for i in 0 to 3 generate
 		    ut: multiplexador port map (sub(i), soma(i), '0', '0', inv(i), s0, s1, s2, y(i));		
 	    end generate;
		 
-- multiplexação para o código de controle		 
uctrl1:multiplexador port map (menorQue, '0', '0', '0', '0', s0, s1, s2, ctrl(0));
uctrl2:multiplexador port map ('0', '0', '1', '1', '0', s0, s1, s2, ctrl(1));

-- multiplexação para o led
uco:multiplexador port map ('0', soma_cout, maiorQue, menorQue, '0', s0, s1, s2, co);	
	
end comportamento;