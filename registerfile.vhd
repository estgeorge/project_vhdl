LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registerfile IS
   PORT (W_data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         W_addr, R_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 
			R_data : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			W_en, R_en, clk : IN STD_LOGIC);
END registerfile;

ARCHITECTURE behavior OF registerfile IS

component registrador4 is
   port (R : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
         ld, clk: IN STD_LOGIC ;
         Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ) ;
end component;

signal Q0, Q1, Q2, Q3, U : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal ld0, ld1, ld2, ld3: STD_LOGIC; 

BEGIN

reg0:registrador4 port map (W_data,ld0,clk,Q0);
reg1:registrador4 port map (W_data,ld1,clk,Q1);
reg2:registrador4 port map (W_data,ld2,clk,Q2);
reg3:registrador4 port map (W_data,ld3,clk,Q3);

ld0 <= W_en WHEN W_addr="00" ELSE '0';
ld1 <= W_en WHEN W_addr="01" ELSE '0';
ld2 <= W_en WHEN W_addr="10" ELSE '0';
ld3 <= W_en WHEN W_addr="11" ELSE '0';

WITH R_addr SELECT
    U <= Q0 WHEN "00",
         Q1 WHEN "01",
         Q2 WHEN "10",
         Q3 WHEN "11";

R_data <= U WHEN R_en='1' ELSE "ZZZZ";
				  
END behavior ;


