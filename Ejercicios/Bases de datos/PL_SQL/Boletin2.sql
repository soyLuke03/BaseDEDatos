ALTER SESSION set  NLS_DATE_FORMAT = 'MM/DD/YYYY';


-- CENTROS
CREATE TABLE CENTROS (
    NUMCE   NUMBER(4)   PRIMARY KEY,
    NOMCE   VARCHAR2(30),
    DIRCE   VARCHAR2(30)
);


-- DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
    NUMDE   NUMBER(3)   PRIMARY KEY,
    NUMCE   NUMBER(4) REFERENCES CENTROS(NUMCE),
    DIREC   NUMBER(3),
    TIDIR   CHAR(1),
    PRESU   NUMBER(3,1),
    DEPDE   NUMBER(3) REFERENCES DEPARTAMENTOS(NUMDE),
    NOMDE   VARCHAR2(30)
);


-- EMPLEADOS
CREATE TABLE EMPLEADOS (
    NUMEM   NUMBER(3)   PRIMARY KEY,
    EXTEL   NUMBER(3),
    FECNA   DATE,
    FECIN   DATE,
    SALAR   NUMBER(5),
    COMIS   NUMBER(3),
    NUMHI   NUMBER(1),
    NOMEM   VARCHAR2(30),
    NUMDE   NUMBER(3) REFERENCES DEPARTAMENTOS (NUMDE)
);

-- EMPLEADOS
-- Fechas modificadas. Formato: MM/DD/YYYY
INSERT INTO EMPLEADOS VALUES(110,350,'11/10/1970','02/15/1985',1800,NULL,3,'CESAR',121); 
INSERT INTO EMPLEADOS VALUES(120,840,'06/09/1968','10/01/1988',1900,110,1,'MARIO',112); 
INSERT INTO EMPLEADOS VALUES(130,810,'09/09/1965','02/01/1981',1500,110,2,'LUCIANO',112); 
INSERT INTO EMPLEADOS VALUES(150,340,'08/10/1972','01/15/1997',2600,NULL,0,'JULIO',121); 
INSERT INTO EMPLEADOS VALUES(160,740,'07/09/1980','11/11/2005',1800,110,2,'AUREO',111); 
INSERT INTO EMPLEADOS VALUES(180,508,'10/18/1974','03/18/1996',2800,50,2,'MARCOS',110); 
INSERT INTO EMPLEADOS VALUES(190,350,'05/12/1972','02/11/1992',1750,NULL,4,'JULIANA',121); 
INSERT INTO EMPLEADOS VALUES(210,200,'09/28/1970','01/22/1999',1910,NULL,2,'PILAR',100); 
INSERT INTO EMPLEADOS VALUES(240,760,'02/26/1967','02/24/1989',1700,100,3,'LAVINIA',111); 
INSERT INTO EMPLEADOS VALUES(250,250,'10/27/1976','03/01/1997',2700,NULL,0,'ADRIANA',100); 
INSERT INTO EMPLEADOS VALUES(260,220,'12/03/1973','07/12/2001',720,NULL,6,'ANTONIO',100); 
INSERT INTO EMPLEADOS VALUES(270,800,'05/21/1975','09/10/2003',1910,80,3,'OCTAVIO',112); 
INSERT INTO EMPLEADOS VALUES(280,410,'01/10/1978','10/08/2010',1500,NULL,5,'DOROTEA',130); 
INSERT INTO EMPLEADOS VALUES(285,620,'10/25/1979','02/15/2011',1910,NULL,0,'OTILIA',122); 
INSERT INTO EMPLEADOS VALUES(290,910,'11/30/1967','02/14/1988',1790,NULL,3,'GLORIA',120); 
INSERT INTO EMPLEADOS VALUES(310,480,'11/21/1976','01/15/2001',1950,NULL,0,'AUGUSTO',130); 
INSERT INTO EMPLEADOS VALUES(320,620,'12/25/1977','02/05/2003',2400,NULL,2,'CORNELIO',122); 
INSERT INTO EMPLEADOS VALUES(330,850,'08/19/1958','03/01/1980',1700,90,0,'AMELIA',112); 
INSERT INTO EMPLEADOS VALUES(350,610,'04/13/1979','09/10/1999',2700,NULL,1,'AURELIO',122); 
INSERT INTO EMPLEADOS VALUES(360,750,'10/29/1978','10/10/1998',1800,100,2,'DORINDA',111); 
INSERT INTO EMPLEADOS VALUES(370,360,'06/22/1977','01/20/2000',1860,NULL,1,'FABIOLA',121); 
INSERT INTO EMPLEADOS VALUES(380,880,'03/30/1978','01/01/1999',1100,NULL,0,'MICAELA',112); 
INSERT INTO EMPLEADOS VALUES(390,500,'02/19/1976','10/08/2010',1290,NULL,1,'CARMEN',110); 
INSERT INTO EMPLEADOS VALUES(400,780,'08/18/1979','11/01/2011',1150,NULL,0,'LUCRECIA',111); 
INSERT INTO EMPLEADOS VALUES(410,660,'07/14/1968','10/13/1989',1010,NULL,0,'AZUCENA',122); 
INSERT INTO EMPLEADOS VALUES(420,450,'10/22/1966','11/19/1988',2400,NULL,0,'CLAUDIA',130); 
INSERT INTO EMPLEADOS VALUES(430,650,'10/26/1967','11/19/1988',1260,NULL,1,'VALERIANA',122); 
INSERT INTO EMPLEADOS VALUES(440,760,'09/26/1966','02/28/1986',1260,100,0,'LIVIA',111); 
INSERT INTO EMPLEADOS VALUES(450,880,'10/21/1966','02/28/1986',1260,100,0,'SABINA',112); 
INSERT INTO EMPLEADOS VALUES(480,760,'04/04/1965','02/28/1986',1260,100,1,'DIANA',111); 
INSERT INTO EMPLEADOS VALUES(490,880,'06/06/1964','01/01/1988',1090,100,0,'HORACIO',112); 
INSERT INTO EMPLEADOS VALUES(500,750,'10/08/1965','01/01/1987',1200,100,0,'HONORIA',111); 
INSERT INTO EMPLEADOS VALUES(510,550,'05/04/1966','11/01/1986',1200,NULL,1,'ROMULO',110); 
INSERT INTO EMPLEADOS VALUES(550,780,'01/10/1970','01/21/1998',600,120,0,'SANCHO',111); 
---------------------------------------------------------------------

--Crea un procedimiento que se llame listadoempleados 
--que muestre por consola el listado de los empleados 
--cuyo nombre contenga la A tanto mayúscula como minúscula. 
--El formato a mostrar sera:
--Nombre: Marta   Salarario: 3000

CREATE OR REPLACE PROCEDURE listadoempleado
AS
	CURSOR Empleado IS
	SELECT * FROM empleados;
BEGIN 
	FOR registro IN Empleado
		LOOP
			DBMS_OUTPUT.PUT_LINE ('Nombre: ' || registro.nomem || '    Salario: ' || registro.salar);
		END LOOP;
END;

CREATE OR REPLACE PROCEDURE listadoempleadoExplicito
AS
	CURSOR Empleado IS
	SELECT * FROM empleados;
	registro empleados%rowtype;
BEGIN 
	OPEN Empleado;
	LOOP
		FETCH Empleado INTO registro;
		EXIT WHEN Empleado%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE ('Nombre: ' || registro.nomem || '    Salario: ' || registro.salar);
	END LOOP;
	CLOSE Empleado;
END;


BEGIN 
	listadoempleado;
END;

BEGIN 
	listadoempleadoExplicito;
END;

----------------------------------------
-- Ejercicio 1
-- Escribe un procedimiento que muestre el número de empleados y el salario
-- mínimo, máximo y medio del departamento de FINANZAS. Debe hacerse
-- uso de cursores implícitos, es decir utilizar SELECT ... INTO

CREATE OR REPLACE PROCEDURE listadoempleado
AS 
NEmpleado empleados%rowtype;
MAXsalar empleados%rowtype;
MINsalar empleados%rowtype;
AVGsalar empleados%rowtype;
BEGIN 
	SELECT count(e.salar) NEmpleado ,max(e.salar) MAXsalar,min(e.salar) MINsalar,avg(e.salar) AVGsalar INTO NEmpleado,MAXsalar,MINsalar,AVGsalar
	FROM departamentos d, empleados e
	WHERE d.numde = e.numde 
	AND lower(d.nomde) LIKE 'finanzas';
	
	DBMS_OUTPUT.PUT_LINE('Numero de empleados: ' || NEmpleado 
						|| ' Salario maximo: ' || MAXsalar
						|| ' Salario minimo: ' || MINsalar 
						|| ' Salario medio: ' || AVGsalar);
END;

BEGIN
	listadoempleado;
END;


-- Ejercicio 2
-- Escribe un procedimiento que suba un 10% el salario a los EMPLEADOS
-- con más de 2 hijos y que ganen menos de 2000 €. Para cada empleado se
-- mostrar por pantalla el código de empleado, nombre, salario anterior y final.
-- Utiliza un cursor explícito. La transacción no puede quedarse a medias. Si
-- por cualquier razón no es posible actualizar todos estos salarios, debe
-- deshacerse el trabajo a la situación inicial
CREATE OR REPLACE PROCEDURE subirsalario
AS
	CURSOR c_subirsalario IS
	SELECT *
	FROM empleados
	WHERE numhi > 2
	AND salar < 2000;

	regist empleados%ROWTYPE;
	error_al_actualizar EXCEPTION;	
BEGIN 
	OPEN c_subirsalario;
	LOOP 
		FETCH c_subirsalario INTO regist;
		EXIT WHEN c_subirsalario%notfound;
			
		dbms_output.put_line('El nombre del empleado es: '||regist.nomem||
							' El codigo del empleado es: '||regist.numem||
							' El nuevo salario es: '||regist.salar*0.1||
							' El antiguo salario es: '||regist.salar);
		
		UPDATE empleados SET salar=salar*0.1+salar
		WHERE numem = regist.numem;
		IF (SQL%notfound) THEN
		 	raise error_al_actualizar;
		END IF;
	END LOOP;
	COMMIT;
	CLOSE c_subirsalario;
	
	EXCEPTION
	WHEN error_al_actualizar THEN	
		dbms_output.put_line('Se ha producido un error al actualizar');
	ROLLBACK;
END;

COMMIT;
BEGIN 
	subirsalario;
END;


-- Ejercicio 3
-- Escribe un procedimiento que reciba dos parámetros (número de
-- departamento, hijos). Deber. crearse un cursor explícito al que se le pasarán
-- estos parámetros y que mostrar. los datos de los empleados que pertenezcan
-- al departamento y con el número de hijos indicados. Al final se indicar. el
-- número de empleados obtenidos.

CREATE OR REPLACE PROCEDURE procedure3 (n_depa NUMBER, hijos NUMBER)
AS
	CURSOR Empleado IS
	SELECT numde, numhi, nomem, numem
	FROM empleados
	WHERE numde = n_depa
	AND numhi = hijos;
	error_al_actualizar EXCEPTION;
	contador NUMBER:=0;
BEGIN 
	FOR registro IN Empleado
	LOOP
	
		

	IF (Empleado%notfound) THEN
		raise error_al_actualizar;
	ELSE 
		
		dbms_output.put_line('Nombre: '|| registro.nomem || ' Numero: ' || registro.numem);
		contador:=contador+1;
		dbms_output.put_line('Numero de registros: '||contador);
	END IF;
	END LOOP;
	EXCEPTION 
		WHEN OTHERS THEN
			dbms_output.put_line('ERROR');
END;

BEGIN 
	procedure3(121,3);
END;

-- Ejercicio 4
-- 4. Escribe un procedimiento con un parámetro para el nombre de empleado,
-- que nos muestre la edad de dicho empleado en años, meses y días.


CREATE OR REPLACE PROCEDURE procedure4(nombreEmpleado varchar2)
AS
	CURSOR Empleado IS
	SELECT fecna FROM empleados
	WHERE nomem LIKE upper(nombreEmpleado);

	dia NUMBER:=0;
	mes NUMBER:=0;
 	anno NUMBER :=0;
 
 	diaA NUMBER:=0;
	mesA NUMBER:=0;
 	annoA NUMBER :=0;

 	diaFecha NUMBER:=0;
 	mesFecha NUMBER:=0;
 	annoFecha NUMBER:=0;
BEGIN 
	FOR registro IN empleado
	LOOP
		dia:=extract(DAY FROM registro.fecna);
		mes:=extract(MONTH FROM registro.fecna);
		anno:=extract(YEAR FROM registro.fecna);
	
		diaA:=extract(DAY FROM sysdate);
		mesA:=extract(MONTH FROM sysdate);
		annoA:=extract(YEAR FROM sysdate);
	
		--diaFecha :=diaA-dia;
 		--mesFecha :=mesA-mes;
 		annoFecha :=annoA-anno;
 	
 		dbms_output.put_line('Tiene '||annoFecha||' annos.');
		
	END LOOP;
	
END;


BEGIN
	procedure4('CESAR');
END;





