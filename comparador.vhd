entity comparador is
	port(a, b : in bit;
	maiorQue, menorQue : out bit);
end comparador;

architecture comportamento of comparador is
begin 
		maiorQue <= (a and (not(b)));
		menorQue <= ((not(a)) and b);
end comportamento;