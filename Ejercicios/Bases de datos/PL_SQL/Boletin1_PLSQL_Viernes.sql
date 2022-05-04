--1 Sabiendo que una persona ha trabajado 38 horas en una semana dada y gana a razón de 60 euros la hora. 
--La tasa de impuestos del estado es del 15,5% de su paga bruta. Se desea saber cuál es la paga bruta, el descuento por impuesto y la paga neta del trabajador.--
CREATE OR REPLACE PROCEDURE TRABAJADOR (NUMERO_HORAS NUMBER , SUELDO_POR_HORA NUMBER)
AS 
IMPUESTO DECIMAL(3) := 15.5;
PAGABRUTA NUMBER(8):=0;
DESCUENTO_IMPUESTO NUMBER(8):=0;
PAGA_NETA NUMBER(8):=0;
BEGIN 
	PAGABRUTA:=(NUMERO_HORAS*SUELDO_POR_HORA)*4;
	DESCUENTO_IMPUESTO:=(PAGABRUTA*IMPUESTO)/100;
	PAGA_NETA:=PAGABRUTA-DESCUENTO_IMPUESTO;

	DBMS_OUTPUT.PUT_LINE(PAGABRUTA);
	DBMS_OUTPUT.PUT_LINE(DESCUENTO_IMPUESTO);
	DBMS_OUTPUT.PUT_LINE(PAGA_NETA);
END;
------------
BEGIN
	TRABAJADOR(38, 60);
END;
------------
--2 Realizar un procedure que calcule el salario neto de un trabajador recibiendo como parámetro las horas trabajadas, 
--el precio de la hora y el tanto por ciento de impuestos que se aplicará sobre el salario bruto.

CREATE OR REPLACE PROCEDURE TRABAJADOR_PARAMETROS ( NUMERO_HORAS NUMBER , SUELDO_POR_HORA NUMBER, IMPUESTO NUMBER)
AS 
PAGABRUTA NUMBER(8):=0;
DESCUENTO_IMPUESTO NUMBER(8):=0;
PAGA_NETA NUMBER(8):=0;
BEGIN 
	PAGABRUTA:=(NUMERO_HORAS*SUELDO_POR_HORA)*4;
	DESCUENTO_IMPUESTO:=(PAGABRUTA*IMPUESTO)/100;
	PAGA_NETA:=PAGABRUTA-DESCUENTO_IMPUESTO;

	DBMS_OUTPUT.PUT_LINE(PAGA_NETA);
END;
-----
BEGIN
	TRABAJADOR_PARAMETROS(20, 100, 25);
END;
----
-- 3 Realizar un procedure para halla la media ponderada de tres puntuaciones de exámenes que se pasarán como parámetros. 
--Los pesos asociados a cada uno de los exámenes serán fijos y son 50%, 20% y 30% para cada puntuación

CREATE OR REPLACE PROCEDURE MEDIA (PUNTUACION1 NUMBER, PUNTUACION2 NUMBER, PUNTUACION3 NUMBER)
AS 
PESO_EXAMEN_1 CONSTANT NUMBER(3) := 50;
PESO_EXAMEN_2 CONSTANT NUMBER(3) := 20;
PESO_EXAMEN_3 CONSTANT NUMBER(3):= 30;
MEDIA NUMBER(5):=0;
EXAMEN_1 NUMBER(5):= ((PUNTUACION1*PESO_EXAMEN_1)/100);
EXAMEN_2 NUMBER(5):= ((PUNTUACION2*PESO_EXAMEN_2)/100);
EXAMEN_3 NUMBER(5):= ((PUNTUACION3*PESO_EXAMEN_3)/100);
BEGIN

	MEDIA:= (EXAMEN_1+EXAMEN_2+EXAMEN_3);
	DBMS_OUTPUT.PUT_LINE(MEDIA);
END;
----------
BEGIN
	MEDIA(0,10,10);
END;
---------
--4 Escribe un procedure para calcular el cuadrado y el cubo de un número introducido por parámetros y mostrar el resultado.

CREATE OR REPLACE PROCEDURE CUADRADO_Y_CUBO (NUMERO NUMBER)
AS
CUADRADO NUMBER(5):=NUMERO*NUMERO;
CUBO NUMBER (5):= NUMERO*NUMERO*NUMERO;
BEGIN
	DBMS_OUTPUT.PUT_LINE(CUADRADO);
	DBMS_OUTPUT.PUT_LINE(CUBO);
END;

--------
BEGIN
	CUADRADO_Y_CUBO(5);
END;
--5 Escribe un procedure para calcular la longitud de la circunferencia y el área del círculo cuyo radio se pasa por parámetro.
-- (longitud=2*pi*r y área pi*r*r)

CREATE OR REPLACE PROCEDURE LONGITUD_Y_AREA_CIRCULO (RADIO NUMBER)
AS 
LONGITUD NUMBER:=2*3.14159*RADIO;
AREA NUMBER:=3.14159*RADIO*RADIO;
BEGIN
	DBMS_OUTPUT.PUT_LINE(LONGITUD);
	DBMS_OUTPUT.PUT_LINE(AREA);
END;
----
BEGIN
	LONGITUD_Y_AREA_CIRCULO(3);
END;

--6 Realizar un procedure que reciba tres números  y diga si la suma de de los dos primeros número es igual al tercero. 
--Si se cumple esta condición escribir “Iguales”, y en caso contrario escribir “Distintos”

CREATE OR REPLACE PROCEDURE SUMA_TRES_NUMEROS (numero1 NUMBER, numero2 NUMBER, numero3 NUMBER)
AS 
BEGIN
	IF(numero1+numero2=numero3)THEN
	DBMS_OUTPUT.PUT_LINE('Iguales');
	ELSE 
	DBMS_OUTPUT.PUT_LINE('Distintos');
	END IF;
END;

--------
BEGIN
	SUMA_TRES_NUMEROS(2,3,8);
END;
--------

--7 Realizar un procedure que reciba un número y muestre “Positivo” 
--si el número es mayor o igual que cero, y “negativo” en caso contrario.
CREATE OR REPLACE PROCEDURE POSITIVO_O_NEGATIVO (numero NUMBER)
AS 
BEGIN
IF(numero>=0)THEN 
DBMS_OUTPUT.PUT_LINE('Positivo');
ELSE 
DBMS_OUTPUT.PUT_LINE('Negativo');
END IF;
END;


------
BEGIN
	POSITIVO_O_NEGATIVO(0);
END;
------
--8 Realizar un procedure que reciba un número y diga si el número es 
--“Par” si el número es par, e impar en caso contrario.
CREATE OR REPLACE PROCEDURE PAR_IMPAR (numero NUMBER)
AS 
BEGIN
	IF MOD(numero,2)=0 THEN 
	DBMS_OUTPUT.PUT_LINE('Par');
	ELSE
	DBMS_OUTPUT.PUT_LINE('Impar');
	END IF;
END;

-----
BEGIN
	PAR_IMPAR(7);
END;
----
--9 Realizar un procedure que reciba un número y diga si el número es 
--“Par positivo”, “Par negativo”, “Impar positivo”, “Impar negativo” o “cero”, según sea el número.
CREATE OR REPLACE PROCEDURE IMPAR_O_PAR_POSITIVO_NEGATIVO(NUMERO NUMBER)
AS 
BEGIN
	IF(NUMERO>0) AND MOD(NUMERO,2)=0 THEN 
	DBMS_OUTPUT.PUT_LINE('Par Positivo');
	ELSIF (NUMERO<0) AND MOD(NUMERO,2)=0 THEN 
	DBMS_OUTPUT.PUT_LINE('Par Negativo');
	ELSIF (NUMERO>0) AND MOD(NUMERO,2)!=0 THEN 
	DBMS_OUTPUT.PUT_LINE('Impar positivo');
	ELSIF (NUMERO<0) AND MOD(NUMERO,2)!=0 THEN
	DBMS_OUTPUT.PUT_LINE('Impar Negativo');
	ELSE
	DBMS_OUTPUT.PUT_LINE('Cero');
	END IF;
END;

----
BEGIN
	IMPAR_O_PAR_POSITIVO_NEGATIVO(4);
END;
-----

--10 Realizar un procedure que reciba dos números como parámetro, y muestre la suma de los dos números.

CREATE OR REPLACE PROCEDURE SUMA (NUMERO1 NUMBER, NUMERO2 NUMBER)
AS RESULTADO NUMBER (8):=0;
BEGIN 
	RESULTADO:=(NUMERO1+NUMERO2);
	DBMS_OUTPUT.PUT_LINE(RESULTADO);
END;

-----
BEGIN
	SUMA (20,20);
END;
--11 Realizar un procedure que reciba dos números como parámetros y muestre la resta de los dos números.

CREATE OR REPLACE PROCEDURE RESTA (NUMERO1 NUMBER, NUMERO2 NUMBER)
AS RESULTADO NUMBER (8):=0;
BEGIN 
	RESULTADO:=(NUMERO1-NUMERO2);
	DBMS_OUTPUT.PUT_LINE(RESULTADO);
END;

-----
BEGIN
	RESTA (20,20);
END;
--12 Realizar un procedure que reciba dos número como parámetros y muestre la suma de los dos números si los dos números son mayor que cero, y
-- la resta de los dos números si alguno de los números es menor que cero.

CREATE OR REPLACE PROCEDURE SUMA_O_RESTA (NUMERO1 NUMBER, NUMERO2 NUMBER)
AS RESULTADO NUMBER (8):=0;
BEGIN
	IF(NUMERO1>0) AND (NUMERO2>0) THEN
		RESULTADO:=(NUMERO1+NUMERO2);
	ELSIF(NUMERO1<0 AND NUMERO2>0) THEN 
		RESULTADO:=(NUMERO2+NUMERO1);
	ELSIF(NUMERO1>0 AND NUMERO2<0) THEN 
		RESULTADO:=(NUMERO1+NUMERO2);
	END IF;
	DBMS_OUTPUT.PUT_LINE(RESULTADO);
END;
----
BEGIN
	SUMA_O_RESTA(-10,-10);
END;
---13 Realizar un procedure que reciba dos número como parámetros y muestre la suma de los dos números 
--si los dos números son mayor que cero o si los dos números son menor que cero. 
--Si un número es positivo y el otro negativo, muestre la resta del número positivo menos el número negativo.

CREATE OR REPLACE PROCEDURE SUMA_O_RESTA2 (NUMERO1 NUMBER, NUMERO2 NUMBER)
AS 
RESULTADO NUMBER (8):=0;
BEGIN
	IF(NUMERO1<0) AND (NUMERO2<0) THEN 
		RESULTADO:= NUMERO1+NUMERO2;
	ELSIF(NUMERO1>0) AND (NUMERO2>0) THEN
		RESULTADO:=(NUMERO1+NUMERO2);
	ELSIF(NUMERO1<0 AND NUMERO2>0) THEN 
		RESULTADO:=(NUMERO2+NUMERO1);
	ELSIF(NUMERO1>0 AND NUMERO2<0) THEN 
		RESULTADO:=(NUMERO1+NUMERO2);
	END IF;
	DBMS_OUTPUT.PUT_LINE(RESULTADO);
END;

--
BEGIN
	SUMA_O_RESTA2(5,-15);
END;


/*
14.	Realizar un procedure que calcule el salario neto semanal de un trabajador. 
El procedure recibirá como parámetro el numero de horas trabajadas y el precio por hora, y hay que tener en cuenta los siguientes aspectos:
•	Las primeras 35 horas se pagan a tarifa normal
•	Las horas que pasen de 35 se pagan a 1,5 veces la tarifa normal.
•	Las tasa de impuesto son:
•	Las primeros 600 euros son libres de impuestos.
•	Los siguientes 300 euros tienen un 25% de impuestos.
•	Los restantes euros un 45 % de impuestos
*/

CREATE OR REPLACE PROCEDURE salarioNetoSemanal (numeroHoras NUMBER, precioHora NUMBER)
AS
	dinero NUMBER := 0;
	i NUMBER := 0;	
	RESTOHORAS NUMBER := NUMEROHORAS-35;
	DINEROTOTAL NUMBER := 0;
	dineroDTC35 NUMBER := 0;
	dineroDTC45 NUMBER := 0;
BEGIN
	IF (NUMEROHORAS<=35) THEN
		DINERO := NUMEROHORAS*PRECIOHORA;
	ELSIF (NUMEROHORAS>35) THEN
		DINERO := (35*PRECIOHORA)+(PRECIOHORA*1.5)*RESTOHORAS;
	END IF;
	dbms_output.put_line(DINERO);
	IF (DINERO<=600) THEN 
	DINEROTOTAL := DINERO;
	ELSIF (DINERO<=900) THEN
	DINERO := DINERO - 600;
	DINERO := DINERO * 45 / 100;
	DINEROTOTAL := DINERO + 600;
	ELSIF (DINERO>900) THEN
	DINERODTC35 := 300 * 25 / 100; -- 105
	DINERODTC35 := (DINERO - 900) * (45 / 100); -- 168.75
	DINEROTOTAL := DINERO - DINERODTC35 - DINERODTC45;
	END IF;	

dbms_output.put_line(dineroTotal);
END;

BEGIN 
	salarioNetoSemanal(40,30);
END;

