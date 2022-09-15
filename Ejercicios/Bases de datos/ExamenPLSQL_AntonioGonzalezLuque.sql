/*Creacion de la secuencia usada posteriormente como clave primaria*/
CREATE SEQUENCE SEQ1 
START WITH 17
INCREMENT BY 1 
MINVALUE 0;

/*Creacion del paquete donde se almacenan los ejercicios realizados*/
CREATE OR REPLACE PACKAGE AGLCiclismo IS

	
	PROCEDURE listado;
	
	FUNCTION victorias(nombreEquipo varchar2) RETURN NUMBER;

	FUNCTION agregarCiclista(nombre varchar2, nacionalidad varchar2, fechaNacimiento DATE, codigo_equipo NUMBER, nombreEquipo varchar2) RETURN NUMBER;

	FUNCTION ordenar RETURN NUMBER;

END AGLCiclismo;

CREATE OR REPLACE PACKAGE BODY AGLCiclismo
IS 

	/*ejercicio 1*/
	PROCEDURE listado
	IS
		--cursor explicito de los equipos
		CURSOR c_equipo IS
			SELECT *
			FROM equipos e;
		--cursor explicito de los ciclistas en función del equipo
		CURSOR c_ciclista(equipo number) IS
			SELECT c.nombre, c.fechanacimiento 
			FROM ciclistas c 
			WHERE c.codequipo = equipo;
		--contadores usados para las especificaciones finales
		contadorCiclistas NUMBER := 0;
		contadorEquipo NUMBER := 0;
		
	BEGIN 
		
		--primer bucle para recorrer cada equipo
		FOR registro1 IN c_equipo LOOP
			contadorCiclistas := 0;
			dbms_output.put_line(chr(13));
			dbms_output.put_line('Nombre: '||registro1.nombre ||' Nacionalidad: ' || registro1.nacionalidad || ' Nombre del director: ' || registro1.nombredirector);
			
			--segundo bucle para recorrer cada ciclista dentro de un equipo
			FOR registro2 IN c_ciclista(registro1.codequipo) LOOP
				dbms_output.put_line('Nombre ciclista: ' || registro2.nombre || ' Fecha nacimiento: ' || registro2.fechanacimiento);
				contadorCiclistas := contadorCiclistas +1;
			END LOOP;
			
			dbms_output.put_line(chr(13));
			dbms_output.put_line('Numero total de ciclistas en el equipo: ' || contadorCiclistas);
			contadorEquipo := contadorEquipo+1;
		
		END LOOP;
		
		dbms_output.put_line('Numero de equipos en el listado: ' || contadorEquipo);
		
	END listado;

	/*ejercicio 2*/
	FUNCTION victorias(nombreEquipo varchar2) RETURN NUMBER 
	IS
		--cursor explicito para la posicion de los ciclistas
		CURSOR c_carrera(ciclista number) IS
			SELECT cl.posicion 
			FROM clasificacionetapas cl
			WHERE cl.dorsal = ciclista;
		--cursor explicito para los ciclistas de un equipo
		CURSOR c_ciclista(equipo varchar2) IS
			SELECT c.nombre, c.fechanacimiento, c.dorsal 
			FROM ciclistas c, equipos e 
			WHERE c.codequipo = e.codequipo 
			AND e.nombre = equipo;
		
		--Variable retornada
		victorias NUMBER := 0;
	BEGIN 
		--bucle que recorre los ciclistas
		FOR registro1 IN c_ciclista(nombreEquipo) LOOP
			dbms_output.put_line(registro1.nombre);
			victorias := 0;
			--bucle que recorre las carreras de cada ciclista, almacenando cada posicion "1" en "victorias"
			FOR registro2 IN c_carrera(registro1.dorsal) LOOP
				IF registro2.posicion=1 THEN
					victorias := victorias +1;
				END IF;
			END LOOP;
			RETURN victorias;
		END LOOP;
		
	END victorias;
	
	/*ejercicio3*/
	FUNCTION agregarCiclista (nombre varchar2, nacionalidad varchar2, fechaNacimiento DATE, codigo_equipo NUMBER, nombreEquipo varchar2) RETURN number
	IS	
		existeEquipo EXCEPTION;
		existeCiclista EXCEPTION;
		crearCiclista EXCEPTION;
		n NUMBER := 0;
	BEGIN 
	
	--Comprobamos la existencia del ciclista pasado por parametros
	SELECT count(c.nombre) INTO n FROM ciclistas c WHERE nombre = c.nombre ;
	IF n=0 THEN 
		raise existeCiclista;
	END IF;
	
	--Comprobamos la existencia del equipo
	SELECT count(e.nombre) INTO n FROM equipos e WHERE e.codequipo = codigo_equipo AND e.nombre = nombreEquipo;
	IF n=0 THEN
		dbms_output.put_line('No existe el equipo, procedemos a crearlo...');
		raise existeEquipo;
	ELSE 
		--En caso de no existir el equipo, se crea junto a la adición del ciclista
		raise crearCiclista;
	END IF;
		
	EXCEPTION
		WHEN existeEquipo THEN
			INSERT INTO equipos(codequipo,nombre) VALUES (codigo_equipo, nombreEquipo);
			INSERT INTO ciclistas VALUES (seq1.nextval, nombre, nacionalidad, codigo_equipo, fechaNacimiento); 
			RETURN seq1.currval;
		
		WHEN existeCiclista THEN
			dbms_output.put_line('El ciclista ya existe');
		
		WHEN crearCiclista THEN
			INSERT INTO ciclistas VALUES (seq1.nextval, nombre, nacionalidad,codigo_equipo,fechaNacimiento);
			RETURN seq1.currval;
		
		WHEN OTHERS THEN
			dbms_output.put_line('Error inesperado');
	END agregarCiclista;
	
	
	/*ejercicio 4*/
	FUNCTION ordenar RETURN NUMBER
	IS
		--cursor explicito para recorrer los equipos
		CURSOR c_equipo IS
			SELECT e.codequipo 
			FROM equipos e;
		--cursor explicito para recorrer los ciclistass conforme a los requerimientos del ejercicio
		CURSOR c_ciclista(equipo number) IS
			SELECT *
			FROM (SELECT c.nombre 
				 FROM ciclistas c 
				 WHERE c.codequipo = equipo
				 ORDER BY nombre ASC)
			WHERE rownum <= 2;
	
		contadorAct NUMBER :=0; --contador de actualizaciones
		n NUMBER :=0;
	BEGIN 
		--bucle para recorrer los equipos
		FOR registro1 IN c_equipo LOOP
			--bucle para recorrer los ciclistas en funcion del codigo del quipo
		 	FOR registro2 IN c_ciclista(registro1.codequipo) LOOP
		 		
		 		--se comprueba si existen ciclistas en el equipo
		 		SELECT count(registro2.nombre) INTO n FROM ciclistas;
		 		IF n=0 THEN
		 			RETURN -1;
		 		ELSE 
		 			--se asigna 'ingles' por defecto y se suma al contador
			 		UPDATE ciclistas SET nacionalidad = 'Inglesa' WHERE registro2.nombre= nombre;
					contadorAct := contadorAct +1;
		 		END IF;
		 		
		 	END LOOP;
		END LOOP;
		RETURN contadorAct;
		
	END ordenar;

END AGLCiclismo;








SELECT victorias('KAS') FROM dual;
