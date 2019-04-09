entity inversor_quatro_bits is
   port ( a : in bit_vector (3 downto 0);
          s : out bit_vector (3 downto 0));
end inversor_quatro_bits;

architecture comportamento of inversor_quatro_bits is

begin
	gen: for i in 0 to 3 generate
		uut: s(i) <= not a(i);
	end generate;
end comportamento;