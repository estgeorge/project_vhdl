entity comparador is
	port(a, b, aigualb : in bit;
	maiorQue, menorQue, igual : out bit);
end comparador;

architecture comportamento of comparador is
begin 
		maiorQue <= (a and (not(b))) and aigualb;
		menorQue <= ((not(a)) and b) and aigualb;
		igual <= (not((a xor b))) and aigualb;
end comportamento;