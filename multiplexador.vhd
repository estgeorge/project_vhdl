entity multiplexador is
   port (a, b, c, d, e, s0, s1, s2  : in bit;
         y : out bit);
end multiplexador;

architecture comportamento of multiplexador is
signal ca, cb, cc, cd, ce : bit;
begin 
      ca <= a and not s0 and not s1 and not s2;
		cb <= b and not s0 and not s1 and s2;
		cc <= c and not s0 and s1 and not s2;
		cd <= d and not s0 and s1 and s2;
		ce <= e and s0 and not s1 and not s2;
		y <= ca or cb or cc or cd or ce;
end comportamento;


