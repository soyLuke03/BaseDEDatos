CREATE TABLE PROFESORES(
nombre		VARCHAR2(20),
apellido1	VARCHAR2(20),
apellido2	VARCHAR2(20),
dni			NUMBER(20),
direccion	VARCHAR2(20),
titulo		VARCHAR2(20),
gana		VARCHAR2(20),

CONSTRAINT PK_dni PRIMARY KEY(dni)
);

CREATE TABLE CURSOS(
nombre_curso VARCHAR2(30),
cod_curso	 NUMBER(20),
dni_profesor NUMBER(20),
maximo_alumnos NUMBER(20),
fecha_inicio DATE,
fecha_fin DATE,
num_horas NUMBER(20),

CONSTRAINT PK_cod_curso PRIMARY KEY(cod_curso),
CONSTRAINT FK_dni_profesor FOREIGN KEY(dni_profesor) REFERENCES PROFESORES(dni)
);

CREATE TABLE ALUMNOS(
nombre	VARCHAR2(20),
apellido1	VARCHAR2(20),
apellido2	VARCHAR2(20),
dni		NUMBER(20),
direccion	VARCHAR2(20),
sexo	VARCHAR2(20),
fecha_nacimiento DATE,
curso NUMBER(5),

CONSTRAINT PK_dni_alumnos PRIMARY KEY(dni),
CONSTRAINT FK_curso FOREIGN KEY(curso) REFERENCES CURSOS(cod_curso),
CONSTRAINT CK_sexo CHECK(sexo IN('H','M'))
);


--2.

INSERT INTO PROFESORES(nombre, apellido1, apellido2, dni, direccion, titulo, gana)
VALUES('Juan','Arch','L�pez',32432455,'Puerta Negra,4','Ing. Informatica', 7500);

INSERT INTO PROFESORES(nombre, apellido1, apellido2, dni, direccion, titulo, gana)
VALUES('Maria','Oliva','Rubio',43215643,'Juan Alfonso 32','Lda. Fil. Inglesa', 5400);



INSERT INTO CURSOS(nombre_curso, cod_curso, dni_profesor, maximo_alumnos, fecha_inicio, fecha_fin, num_horas)
VALUES('Ingl�s B�sico', 1, 43215643, 15, TO_DATE('01/11/2000','DD/MM/YYYY'), TO_DATE('22/12/2000','DD/MM/YYYY'), 120);

INSERT INTO CURSOS(nombre_curso, cod_curso, dni_profesor, fecha_inicio, num_horas)
VALUES('Administraci�n Linux', 2, 32432455, TO_DATE('01/09/2000','DD/MM/YYYY'), 80);



INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, fecha_nacimiento, curso)
VALUES('Lucas', 'Manilva', 'L�pez', 123523, 'Alhamar,3', 'H', TO_DATE('01/11/1979','DD/MM/YYYY'), 1);

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, curso)
VALUES('Antonia', 'L�pez', 'Alcantara', 2567567, 'Maniqui,21', 'M', 2);

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, curso)
VALUES('Manuel', 'Alcantara', 'Pedr�s', 3123689, 'Julian,2', 'H', 1);

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, fecha_nacimiento, curso)
VALUES('Jos�', 'P�rez', 'Caballar', 4896765, 'Jarcha,5', 'H', TO_DATE('03/02/1977','DD/MM/YYYY'), 2);




--3.

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, sexo, curso)
VALUES('Sergio', 'Navas', 'Retal', 123524, 'H', 1);




--4.

INSERT INTO PROFESORES(nombre, apellido1, apellido2, dni, direccion, titulo, gana)
VALUES('Juan','Arch','L�pez',32432456,'Puerta Negra,4','Ing. Informatica', NULL);


--5.

INSERT INTO ALUMNOS(nombre, apellido1, apellido2, dni, direccion, sexo, curso)
VALUES('Maria', 'Ja�n', 'Sevilla', 789678, 'Martos,5', 'M', 1);


--6



UPDATE ALUMNOS 
SET fecha_nacimiento = TO_DATE('23/12/1976','DD/MM/YYYY')
WHERE dni = 2567567; --Ce�irse al enunciado y usar el nombre.


--7.

INSERT INTO CURSOS(nombre_curso, cod_curso, dni_profesor, maximo_alumnos, fecha_inicio, fecha_fin, num_horas)
VALUES('Administracion BBDD', 5, 43215643, 21, TO_DATE('01/11/2000','DD/MM/YYYY'), TO_DATE('22/12/2000','DD/MM/YYYY'), 120);

UPDATE ALUMNOS
SET curso = 5
WHERE dni = 2567567;



--8.


INSERT INTO PROFESORES(nombre, apellido1, dni)
VALUES('Laura','Jimenez', 32432457);

DELETE FROM PROFESORES
WHERE nombre = 'Laura';


--9.


UPDATE ALUMNOS
SET curso = 2
WHERE curso = 1;

ALTER TABLE ALUMNOS DROP CONSTRAINT FK_curso;
ALTER TABLE ALUMNOS ADD CONSTRAINT FK_curso FOREIGN KEY (curso) REFERENCES CURSOS(cod_curso) ON DELETE CASCADE;


DELETE FROM CURSOS
WHERE cod_curso = 1;


--10.

ALTER TABLE CURSOS ADD numero_alumnos NUMBER(10);



--11.

UPDATE ALUMNOS
SET fecha_nacimiento = TO_DATE('01/01/2012','DD/MM/YYYY')
WHERE fecha_nacimiento IS NULL;




--12.

ALTER TABLE ALUMNOS DROP COLUMN sexo;




--13.

UPDATE PROFESORES
SET gana = gana + ((gana*20)/100)
WHERE titulo = 'Ing. Informatica';




--14.

UPDATE PROFESORES
SET dni = 1234567
WHERE dni = 32432456;

--15.

ALTER TABLE ALUMNOS ADD sexo VARCHAR2(1);

UPDATE ALUMNOS
SET sexo = 'F'
WHERE nombre = 'Maria';

