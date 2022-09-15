ALTER SESSION set  NLS_DATE_FORMAT = 'MM/DD/YYYY';



----------------
-- DISE?O F?SICO
----------------

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





--------
-- DATOS
--------

-- CENTROS
INSERT INTO CENTROS VALUES(10,'SEDE CENTRAL','C/ ATOCHA, 820, MADRID');
INSERT INTO CENTROS VALUES(20,'RELACI?N CON CLIENTES','C/ ATOCHA, 405, MADRID');





-- DEPARTAMENTOS
INSERT INTO DEPARTAMENTOS VALUES(100,10,260,'P',72,NULL,'DIRECCI?N GENERAL');
INSERT INTO DEPARTAMENTOS VALUES(110,20,180,'P',90,100,'DIRECC.COMERCIAL');
INSERT INTO DEPARTAMENTOS VALUES(111,20,180,'F',66,110,'SECTOR INDUSTRIAL');
INSERT INTO DEPARTAMENTOS VALUES(112,20,270,'P',54,110,'SECTOR SERVICIOS');
INSERT INTO DEPARTAMENTOS VALUES(120,10,150,'F',18,100,'ORGANIZACI?N');
INSERT INTO DEPARTAMENTOS VALUES(121,10,150,'P',12,120,'PERSONAL');
INSERT INTO DEPARTAMENTOS VALUES(122,10,350,'P',36,120,'PROCESO DE DATOS');
INSERT INTO DEPARTAMENTOS VALUES(130,10,310,'P',12,100,'FINANZAS');




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

---------------------------------------------------------------------------



CREATE TABLE AUDITORIA_EMPLEADOS (descripcion VARCHAR2(400));



INSERT INTO DEPARTAMENTOS VALUES (0, 10, 260, 'F', 10, 100, 'TEMP');

/*
5.7.1. Crea un trigger que, cada vez que se inserte o elimine un empleado, registre
una entrada en la tabla AUDITORIA_EMPLEADOS con la fecha del suceso,
n?mero y nombre de empleado, as? como el tipo de operaci?n realizada
(INSERCI?N o ELIMINACI?N).
 */

CREATE OR REPLACE TRIGGER t_act1
BEFORE INSERT OR DELETE ON departamentos 
FOR EACH ROW 
BEGIN 
	IF inserting THEN 
		INSERT INTO auditoria_empleados VALUES ('Fecha de hoy: ' || :NEW.sysdate || '. Numero de empleado: ' || :NEW.empleados.numem || '. Nombre del empleado: ' || :NEW.empleados.nomem || '. Instrucci?n: INSERCI?N');
	ELSIF deleting THEN
		INSERT INTO auditoria_empleados VALUES ('Fecha de hoy: ' || :OLD.sysdate || '. Numero de empleado: ' || :OLD.empleados.numem || '. Nombre del empleado: ' || :OLD.empleados.nomem || '. Instrucci?n: ELIMINACI?N');
	END IF;
END;

INSERT INTO DEPARTAMENTOS VALUES (12, 10, 260, 'F', 10, 100, 'TEMP');
DELETE FROM departamentos WHERE nomde LIKE 'TEMP';

/*
Crea un trigger que, cada vez que se modi(quen datos de un empleado,
registre una entrada en la tabla AUDITORIA_EMPLEADOS con la fecha del
suceso, valor antiguo y valor nuevo de cada campo, as? como el tipo de operaci?n
realizada (en este caso MODIFICACI?N).
*/

CREATE OR REPLACE TRIGGER t_act2
BEFORE UPDATE ON departamentos
FOR EACH ROW
BEGIN 


	INSERT INTO auditoria_empleados VALUES ('Fecha de hoy: ' || sysdate || chr(13) ||
											'.(Antiguo) NUMEM: ' || :NEW.numde || chr(13) ||
											'.(Nuevo) NUMEM: ' || :OLD.numde || chr(13) ||
											'.(Antiguo) NUMCE: ' || :NEW.numce  || chr(13) ||
											'.(Nuevo) NUMCE: ' || :OLD.numce  || chr(13) ||
											'.(Antiguo) DIREC: ' || :NEW.direc  || chr(13) ||
											'.(Nuevo) DIREC: ' || :NEW.direc  || chr(13) ||
											'.(Antiguo) TIDIR: ' || :NEW.tidir  || chr(13) ||
											'.(Nuevo) TIDIR: ' || :NEW.tidir  || chr(13) ||
											'.(Antiguo) PRESU: ' || :NEW.presu  || chr(13) ||
											'.(Nuevo) PRESU: ' || :NEW.presu  || chr(13) ||
											'.(Antiguo) DEPDE: ' || :NEW.depde  || chr(13) ||
											'.(Nuevo) DEPDE: ' || :NEW.depde  || chr(13) ||
											'.(Antiguo) NOMDE: ' || :NEW.nomde  || chr(13) ||
											'.(Nuevo) NOMDE: ' || :NEW.nomde  || chr(13) ||
											'. Instrucci?n: INSERCI?N');
END;


	--ALTER TABLE departamentos disable CONSTRAINT SYS_C0014570;
	--ALTER TABLE empleados disable CONSTRAINT SYS_C0014572;
	--UPDATE empleados SET numde = 109 WHERE numde = 69;
	--ALTER TABLE departamentos enable CONSTRAINT SYS_C0014570;
	--ALTER TABLE empleados enable CONSTRAINT SYS_C0014572;

UPDATE departamentos SET numde = 109 WHERE numde = 69;

/*
5.7.3. Crea un trigger para que registre en la tabla AUDITORIA_EMPLEADOS las
subidas de salarios superiores al 5%.
 */
CREATE OR REPLACE TRIGGER act3
BEFORE update ON empleados
FOR EACH ROW WHEN (NEW.salar > OLD.salar*0.95)
BEGIN 
	INSERT INTO auditoria_empleados VALUES ('Subida de sueldo detectada');
END;

UPDATE empleados SET salar = 4000 WHERE numem = 110;



/*
Deseamos operar sobre los datos de los departamentos y los centros donde
se hallan. Para ello haremos uso de la vista SEDE_DEPARTAMENTOS creada
anteriormente. Al tratarse de una vista que involucra m�s de una tabla,
necesitaremos crear un trigger de sustituci�n para gestionar las operaciones de
actualizaci�n de la informaci�n. Crea el trigger necesario para realizar inserciones,
eliminaciones y modi(caciones en la vista anterior.
 * */
CREATE VIEW SEDE_DEPARTAMENTOS AS
SELECT C.NUMCE, C.NOMCE, C.DIRCE,
 D.NUMDE, D.NOMDE, D.PRESU, D.DIREC, D.TIDIR, D.DEPDE
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.NUMCE=D.NUMCE;

TRIGGER t_sede
instead OF INSERT OR DELETE OR UPDATE ON SEDE_DEPARTAMENTOS
BEGIN 
	 IF inserting THEN
	 	INSERT INTO centros (numce,nomce,dirce) VALUES (:NEW.numce, :NEW.nomce, :NEW.dirce);
	 	INSERT INTO departamentos (numde,nomde,presu,direc,tidir,depde) VALUES (:NEW.numde, :NEW.nomde, :NEW.presu, :NEW.direc, :NEW.tidir, :NEW.depde);
	 
	 ELSIF deleting THEN
	 	DELETE centros WHERE numce = :OLD.numce;
	 	DELETE departamentos WHERE numde = :OLD.numde AND numce = :OLD.numce;
	 
	 
	 ELSIF updating THEN
	 	UPDATE centros SET numce = :NEW.numce, nomce =  :NEW.nomce, dirce = :NEW.dirce WHERE :NEW.numce = :OLD.numce;
	 	UPDATE departamentos SET numde = :NEW.numde, nomde = :NEW.nomde, presu = :NEW.presu, direc = :NEW.direc, tidir = :NEW.tidir, depde = :NEW.depde WHERE :NEW.numde = :OLD.numde;
	 
	END IF;
END;

-- Inserci�n de datos
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE)
VALUES (31, 310, 'NUEVO1');
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE)
VALUES (32, 320, 'NUEVO2');
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE)
VALUES (33, 330, 'NUEVO3');
SELECT * FROM CENTROS;
SELECT * FROM DEPARTAMENTOS;
-- Borrado de datos
DELETE FROM SEDE_DEPARTAMENTOS WHERE NUMDE=310;
SELECT * FROM SEDE_DEPARTAMENTOS;
DELETE FROM SEDE_DEPARTAMENTOS WHERE NUMCE=30;
SELECT * FROM SEDE_DEPARTAMENTOS;
-- Modificaci�n de datos
UPDATE SEDE_DEPARTAMENTOS
SET NOMDE='CUENTAS', TIDIR='F', NUMCE=20 WHERE NOMDE='FINANZAS';
SELECT * FROM DEPARTAMENTOS;
UPDATE SEDE_DEPARTAMENTOS
SET NOMDE='FINANZAS', TIDIR='P', NUMCE=10 WHERE NOMDE='CUENTAS';
SELECT * FROM DEPARTAMENTOS;





