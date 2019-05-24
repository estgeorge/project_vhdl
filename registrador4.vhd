LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registrador4 IS
   PORT (R : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
         ld, clk: IN STD_LOGIC ;
         Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ) ;
END registrador4;

ARCHITECTURE Behavior OF registrador4 IS
BEGIN
  PROCESS
  BEGIN
    WAIT UNTIL clk'EVENT AND clk = '1' ;
    IF ld = '1' THEN Q <= R ;
    END IF ;
  END PROCESS ;
END Behavior ;

