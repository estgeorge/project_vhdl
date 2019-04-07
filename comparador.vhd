entity comparador is
	port(a, b : in bit;
	maiorQue, menorQue, igual : out bit);
end comparador;

architecture comportamento of comparador is
begin 
		maiorQue <= (a and (not(b)));
		menorQue <= ((not(a)) and b);
		igual <= not((a xor b));
end comportamento;