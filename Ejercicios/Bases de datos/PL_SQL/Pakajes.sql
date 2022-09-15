CREATE OR REPLACE
PACKAGE aritmetica IS
  version NUMBER := 1.0;

  PROCEDURE mostrar_info;
  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER;
 
  FUNCTION resto 	  (a NUMBER, b NUMBER) RETURN NUMBER;
  PROCEDURE ayuda;
END aritmetica;



CREATE OR REPLACE
PACKAGE BODY aritmetica IS

  PROCEDURE mostrar_info IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE
      ('Paquete de operaciones aritméticas. Versión ' || version);
  END mostrar_info;
 
 PROCEDURE ayuda IS
 BEGIN
	DBMS_OUTPUT.PUT_LINE('Procedimientos y funciones disponibles: ' || chr(13)||
							'Mostrar_info: Señala la versión del paquete' || chr(13)||
							'Suma: Realiza una suma con los valores proporcionados' || chr(13)||
							'Resta: Realiza una resta con losvalores proporcionados' || chr(13)||
							'Multiplica: Realiza una multiplicación con los valores proporcionados' || chr(13)||
							'Divide: Realiza una división con los valores proporcionados' || chr(13)||
							'Resto: Devuelve el resto de la división de los valores proporcionados' || chr(13)||
							'Ayuda: Devuelve este mensaje de explicación de los métodos y funciones');
 END ayuda;

  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a+b);
  END suma;

  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a-b);
  END resta;

  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a*b);
  END multiplica;

  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a/b);
  END divide;
 
 FUNCTION resto (a NUMBER, b number) RETURN NUMBER IS
 BEGIN 
	RETURN (MOD(a,b));
 END resto;

END aritmetica;





------------------------------------------------------

CREATE TABLE Departamento
(
nombre varchar2(10) PRIMARY KEY,
numero number(2),
presupuesto number(4)
);

CREATE OR REPLACE PACKAGE DUMMY.gestion AS
	
	PROCEDURE crear_dep (nombre varchar2, presupuesto number);
	FUNCTION num_dep (nombre varchar2) RETURN NUMBER;
	PROCEDURE mostrar_dep (numero NUMBER);
	PROCEDURE borrar_dep (numero number);
 	PROCEDURE modificar_dep (numero NUMBER, presupuesto NUMBER);
END gestion;

CREATE SEQUENCE seq_1
START WITH 1
INCREMENT BY 1;
----------------------------------------
CREATE OR REPLACE PACKAGE BODY gestion AS

	PROCEDURE crear_dep(nomb varchar2, pres NUMBER) IS 
	BEGIN
		iNSERT INTO Departamento(nombre, numero, presupuesto) VALUES (nomb, seq_1.nextval , pres);
	END crear_dep;

	FUNCTION num_dep(nom varchar2) RETURN NUMBER IS
	miExcepcion EXCEPTION;

	c_Numero_dep NUMBER:=0;
	
	BEGIN
		SELECT count(d.numero_dep)
		INTO c_Numero_dep
		FROM departamento d
		WHERE d.nombre = nom
		IF (c_Numero_dep=0) THEN
			Raise miExcepcion;
		END IF;
	
		RETURN c_Numero_dep;
	
		EXCEPTION
			WHEN miExcepcion THEN
				RETURN -1;
			
	END num_dep;


	PROCEDURE mostrar_dep(num NUMBER) IS
		CURSOR c_nom IS
		SELECT nombre FROM departamento d 
		WHERE numero = num;
	
	BEGIN
		FOR registro IN c_nom LOOP
			dbms_output.put_line(registro);
		END LOOP;
	
	END mostrar_dep;



	PROCEDURE borrar_dep(num NUMBER) IS
	BEGIN
		DELETE FROM Departamento WHERE numero = num;
	END borrar_dep;


	PROCEDURE modificar_dep(num NUMBER, pres NUMBER) IS
	BEGIN
		UPDATE departamento SET presupuesto = pres WHERE numero = num;
	END modificar_dep;
END gestion;


BEGIN
	gestion.crear_dep('Alguno12',1200);
END;