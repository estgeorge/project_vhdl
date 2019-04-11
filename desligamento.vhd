entity desligamento is
	port(co_aux : in bit;
	     ctrl_aux: in bit_vector (1 downto 0);
		  ligado : in bit;
	     co : out bit;
	     ctrl: out bit_vector (1 downto 0));
end desligamento;

architecture comportamento of desligamento is
begin 
    co <= co_aux and ligado;
    ctrl(0) <= (ctrl_aux(0) and not(ctrl_aux(1))) or  (not (ctrl_aux(0)) and not(ligado));
    ctrl(1) <= not(ctrl_aux(0)) and ctrl_aux(1) and ligado;
end comportamento;