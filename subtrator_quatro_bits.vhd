entity subtrator_quatro_bits is 
	port(a : in bit_vector(3 downto 0);
		  b : in bit_vector(3 downto 0);
		  t_in : in bit;
		  s : out bit_vector(3 downto 0);
		  t_out : out bit);
end subtrator_quatro_bits;

architecture comportamento of subtrator_quatro_bits is

component subtrator is 
	port(a, b, t_in : in bit;
	     s, t_out : out bit);
end component;

signal t : bit_vector(4 downto 0);

begin
	gen : for i in 0 to 3 generate
		ut : subtrator port map (a(i), b(i), t(i), s(i), t(i + 1));
	end generate;
   t(0) <= t_in;
	t_out <= t(4);
end comportamento;
