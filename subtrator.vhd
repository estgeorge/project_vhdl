entity subtrator is
	port(a, b, t_in : in bit;
	     s, t_out : out bit);
end subtrator;

architecture comportamento of subtrator is
begin 
	s <= a xor b xor t_in;
	t_out <= (not(a) and b) or (not(a) and t_in) or (b and t_in);
end comportamento;
