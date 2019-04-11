entity multiplexador2 is
   port (a, b, c, s0, s1 : in bit;
         y : out bit);
end multiplexador2;

architecture comportamento of multiplexador2 is
signal ca, cb, cc, cd, ce : bit;
begin 
      ca <= a and not s0 and not s1;
		cb <= b and s0 and not s1;
		cc <= c and not s0 and s1;
		y <= ca or cb or cc;
end comportamento;
