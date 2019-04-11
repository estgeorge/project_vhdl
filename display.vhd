entity display is
	port(
		y: in bit_vector (3 downto 0);
		ctrl: in bit_vector (1 downto 0);
		d: out bit_vector (6 downto 0)
	);
end display;

architecture comportamento of display is

component conversor_display is
	port(
		s1,s2,s3,s4 : IN bit;
		a,b,c,d,e,f,g : OUT bit
	);
end component;

component multiplexador2 is
   port (a, b, c, s0, s1 : in bit;
         y : out bit);
end component;

signal d_aux, off, erro: bit_vector (6 downto 0);
	
begin

conv:conversor_display port map (y(3),y(2),y(1),y(0),d_aux(0),d_aux(1),d_aux(2),d_aux(3),d_aux(4),d_aux(5),d_aux(6));

off  <= "1111111";
erro <= "0110110"; 

-- multiplexação de acordo com o código de controle		 
u: for i in 0 to 6 generate
    mul2:multiplexador2 port map (not(d_aux(i)), erro(i), off(i), ctrl(0), ctrl(1), d(i));	
end generate;

end comportamento;

