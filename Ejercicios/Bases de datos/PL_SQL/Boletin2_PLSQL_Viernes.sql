--1.	Realizar un procedure que muestre los números múltiplos de 5 de 0 a 100.
CREATE OR REPLACE PROCEDURE Multiplos
AS
paso NUMBER :=0;
BEGIN
	WHILE (paso!=105) LOOP
		dbms_output.put_line(paso);
		paso:= paso + 5;
	END LOOP;
END;

BEGIN
	Multiplos;
END;
--2.	Procedure que muestre por pantalla todos los números comprendidos entre 1 y 100 que son múltiplos de 7 o de 13.
CREATE OR REPLACE PROCEDURE sieteYtrece
AS
numero NUMBER :=0;
BEGIN 
	FOR i IN 1..100 LOOP
		IF (i - 7 * floor(i/7)=0) THEN
			dbms_output.put_line(i);
		elsIF (i - 13 * floor(i/13)=0) THEN
			dbms_output.put_line(i);
		END IF;
	END LOOP;
END;

BEGIN 
	sieteYtrece;
END;
--3.	Realizar un procedure que muestre los número múltiplos del primer parámetro que van desde el segundo parámetro hasta el tercero.
CREATE OR REPLACE PROCEDURE multiplosParametros (p1 number, p2 number, p3 number)
AS
BEGIN 
	FOR i IN p2..p3 LOOP
		IF (i - p1 * floor(i/p1)=0) THEN
			dbms_output.put_line(i);
		END IF;
	END LOOP;
END;

BEGIN 
	multiplosParametros(4,10,20);
END;
--4.	Procedure que muestre por pantalla todos los números comprendidos entre 1 y 100 que son múltiplos de 7 y de 13.
CREATE OR REPLACE PROCEDURE sieteYtreceJuntos
AS
numero NUMBER :=0;
BEGIN 
	FOR i IN 1..100 LOOP
		IF (i - 7 * floor(i/7)=0 AND i - 13 * floor(i/13)=0) THEN
			dbms_output.put_line(i);
		END IF;
	END LOOP;
END;

BEGIN 
	sieteYtreceJuntos;
END;
--5.	Procedure que reciba un número entero por parámetro y visualice su tabla de multiplicar
CREATE OR REPLACE PROCEDURE tablaDeMultiplicar (numero number)
AS
BEGIN 
	FOR i IN 1..10 LOOP
		dbms_output.put_line(i*numero);
	END LOOP;
END;

BEGIN 
	tablaDeMultiplicar(6);
END;
--6.	Realizar un procedure que muestre los número comprendidos desde el primer parámetro hasta el segundo.
CREATE OR REPLACE PROCEDURE numeroComprendidos (numero NUMBER, numero2 NUMBER)
AS
BEGIN 
	FOR i IN numero..numero2 LOOP
		dbms_output.put_line(i);
	END LOOP;
END;

BEGIN 
	numeroComprendidos(6,190);
END;
--7.	Realizar un procedure que cuente de 20 en 20, desde el primer parámetro hasta el segundo.
CREATE OR REPLACE PROCEDURE numeroComprendidosEn20 (numero NUMBER, numero2 NUMBER)
AS
paso NUMBER := numero;
BEGIN
	WHILE (paso<numero2) LOOP
		dbms_output.put_line(paso);
		paso:= paso + 20;
	END LOOP;
END;

BEGIN 
	numeroComprendidosEn20(6,190);
END;
--8.	Realizar un procedure que muestre por pantalla el cuadrado y el cubo de los cinco número consecutivos a partir del que se le pasa por parámetro.
CREATE OR REPLACE PROCEDURE cuadradoYcubo (n1 number)
AS
BEGIN 
	FOR i IN n1..n1+5 LOOP
	dbms_output.put_line(i);
	dbms_output.put_line('Elevado a 2');
		dbms_output.put_line(POWER( i, 2 ));
	dbms_output.put_line('Elevado a 3');
		dbms_output.put_line(POWER( i, 3 ));
	END LOOP;
END;

BEGIN 
	cuadradoYcubo(1);
END;
--9.	Realizar un procedure que reciba dos números como parámetro, y muestre el resultado de elevar el primero parámetro al segundo.
CREATE OR REPLACE PROCEDURE potencia (n1 NUMBER, n2 number)
AS
BEGIN 
	dbms_output.put_line(POWER( n1, n2 ));
END;

BEGIN 
	potencia(2,5);
END;
--10.	Realizar un procedure que reciba dos números como parámetro y muestre el resultado de elevar el primero número a 1, a 2... hasta el segundo número.
CREATE OR REPLACE PROCEDURE potenciaContinua (n1 NUMBER, n2 number)
AS
BEGIN 
	FOR i IN 1..n2 LOOP
		dbms_output.put_line(POWER( n1, i ));
	END LOOP;
END;

BEGIN 
	potencia(2,5);
END;
--11.	Procedure que tome un número N que se le pasa por parámetro y muestre la suma de los N primeros números.
CREATE OR REPLACE PROCEDURE sumaConstante (n1 NUMBER)
AS
n NUMBER := 0;
BEGIN 
	FOR i IN 0..n1 LOOP
		n := i + i;		
	END LOOP;
dbms_output.put_line(n);
END;

BEGIN 
	sumaConstante(1);
END;
--12.	Procedure que tome como parámetros dos números enteros A y B, y calcule el producto de A y B mediante sumas, mostrando el resultado.
CREATE OR REPLACE PROCEDURE productoPorSuma (n1 NUMBER, n2 NUMBER)
AS
BEGIN 

END;

BEGIN 
	productoPorSuma(5,10);
END;
--13.	Procedure que tome como parámetros dos números B y E enteros positivos, y calcule la potencia (B elevado a E) a través de productos.
CREATE OR REPLACE PROCEDURE potenciaPorMultiplicacion (n1 NUMBER, n2 NUMBER)
AS
BEGIN 

END;

BEGIN 
	potenciaPorMultiplicacion(5,10);
END;
--14.	Realizar un procedure que reciba un número entero positivo y muestre el número de cifras que tiene dicho número.
CREATE OR REPLACE PROCEDURE cifrasDeUnNumero (n1 NUMBER, n2 NUMBER)
AS
BEGIN 

END;

BEGIN 
	cifrasDeUnNumero(5,10);
END;
--15.	Realizar un procedure que solicite dos números enteros y  calcule el máximo común divisor de los dos números. (producto de los divisores de ambos números)
CREATE OR REPLACE PROCEDURE mcd(n1 NUMBER, n2 NUMBER)
AS
BEGIN 

END;

BEGIN 
	mcd(5,10);
END;
--16.	Realizar un procedure que reciba como parámetro un número entero positivo N y calcule el factorial.
--Factorial (0)= 1
--Factorial (1)= 1
--Factorial (N) = N * Factorial(N – 1)
CREATE OR REPLACE PROCEDURE factorial(n1 NUMBER, n2 NUMBER)
AS
BEGIN 

END;

BEGIN 
	factorial(5,10);
END;
--17.	Realizar un procedure que reciba como parámetros número N entero positivo y calcule la suma de los inversos de N es decir
--1/1 + 1/2 + 1/3 + 1/4 + ...... 1/N
CREATE OR REPLACE PROCEDURE sumaDeInversos(n1 NUMBER)
AS
BEGIN 
	FOR i IN 0..n1 LOOP;
		
	END LOOP;
END;

BEGIN 
	sumaDeInversos(5);
END;
--18.	Realizar un programa lea dos números enteros mayores que 0 y calcule el máximo común divisor (m.c.d.) mediante el algoritmo de Euclides e imprima el resultado
--120 : 54 = 2 y resto 12
--54 : 12 = 4 y resto 6
--12: 6 = 2 y resto 0 -El m.c.d. de 120 y 54 es 6
CREATE OR REPLACE PROCEDURE mcdEuclides(n1 NUMBER)
AS
BEGIN 

	
	
END;

BEGIN 
	mcdEuclides(5);
END;