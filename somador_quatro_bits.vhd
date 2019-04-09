entity somador_quatro_bits is
   port ( a : in bit_vector (3 downto 0);
          b : in bit_vector (3 downto 0);
          cin : in bit;
          s : out bit_vector (3 downto 0);
          cout : out bit);
end somador_quatro_bits;

architecture comportamento of somador_quatro_bits is

component somador is
    port (a, b, cin : in bit;
          s, cout : out bit);
end component;

signal c: bit_vector(4 downto 0);

begin
	gen: for i in 0 to 3 generate
		uut: somador port map (a(i), b(i), c(i), s(i), c(i+1));
	end generate;
	c(0) <= cin;
	cout <= c(4);
end comportamento;
