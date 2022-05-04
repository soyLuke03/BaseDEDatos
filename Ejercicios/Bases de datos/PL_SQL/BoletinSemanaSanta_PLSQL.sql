CREATE OR REPLACE 
PROCEDURE par (numero NUMBER)
AS 
	resultado NUMBER :=numero - 2 * floor(numero/2);
BEGIN 
	IF (resultado=0) THEN
		dbms_output.put_line('Es par');
	ELSE 
		dbms_output.put_line('Es impar');
	END IF;
END;

BEGIN
	par(202026);
END;




-------------------------------------------

CREATE OR REPLACE PROCEDURE DUMMY2.multiplicacion (numero NUMBER, multiplicador NUMBER)
AS 
	resultado NUMBER:= numero + numero;
	numeroFinal NUMBER :=0;
BEGIN
  FOR i IN 1..multiplicador LOOP
    numeroFinal:= resultado + numeroFinal;
  END LOOP;
  dbms_output.put_line(resultado);
END;

BEGIN 
	multiplicacion(2,5);
END;