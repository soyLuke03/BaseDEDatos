-- 1

CREATE OR REPLACE 
PROCEDURE ESCRIBE
AS 
BEGIN 
	dbms_output.put_line ('Hola mundo');
END;
----
BEGIN 
	escribe;
END;

-- 2
CREATE OR REPLACE 
PROCEDURE ESCRIBE_MENSAJE(texto varchar2)
AS
BEGIN 
	dbms_output.put_line (texto);
END;
----
BEGIN 
	escribe_mensaje('texto');
END;

-- 3
CREATE OR REPLACE 
PROCEDURE SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER)
AS 
	i number(10):=minimo;
BEGIN 
	WHILE (i<=maximo) LOOP
		dbms_output.put_line(i);
		i:=i+paso;
	END LOOP;
END;
----
BEGIN 
	serie(10,100,5);
END;

-- 4
CREATE OR REPLACE FUNCTION DUMMY2.AZAR (minimo NUMBER ,maximo NUMBER)
RETURN NUMBER 
IS 
BEGIN
	RETURN dbms_random.value(minimo,maximo);
END AZAR;
----
SELECT round(azar(1,20)) FROM dual;

-- 5
CREATE OR REPLACE FUNCTION DUMMY2.NOTA (nota NUMBER)
RETURN varchar2
IS
BEGIN 
	IF (nota>10 OR nota<0) THEN
		RETURN ('Valores no válidos');
	ELSIF (nota < 5) THEN
		RETURN ('Insuficiente');
	ELSIF (nota = 5) THEN
		RETURN ('Suficiente');
	ELSIF (nota > 5 AND nota <=7) THEN
		RETURN ('Bien');
	ELSIF (nota > 7 AND nota <=8) THEN
		RETURN ('Notable');
	ELSIF (nota > 8 AND nota <=10) THEN
		RETURN ('Sobresaliente');
	END IF;
END;
----
SELECT nota(10) FROM dual;
