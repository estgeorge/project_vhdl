entity comparador_quatro_bits is
	port(a, b : in bit_vector(3 downto 0);
	maiorQue, menorQue, igual : out bit);
end comparador_quatro_bits;

architecture comportamento of comparador_quatro_bits is

component comparador is 
	port(a, b, aigualb : in bit;
	maiorQue, menorQue, igual : out bit);
end component;

signal sig_igual, sig_maior, sig_menor : bit_vector(3 downto 0);

begin
	
	u1 : comparador port map(a(3), b(3), '1', sig_maior(3), sig_menor(3), sig_igual(3));
	u2 : comparador port map(a(2), b(2), sig_igual(3), sig_maior(2), sig_menor(2), sig_igual(2));
	u3 : comparador port map(a(1), b(1), sig_igual(2), sig_maior(1), sig_menor(1), sig_igual(1));
	u4 : comparador port map(a(0), b(0), sig_igual(1), sig_maior(0), sig_menor(0), sig_igual(0));
	
	maiorQue <= sig_maior(3) or sig_maior(2) or sig_maior(1) or sig_maior(0);
	menorQue <= sig_menor(3) or sig_menor(2) or sig_menor(1) or sig_menor(0);
	igual <= sig_igual(0);
end comportamento;
	