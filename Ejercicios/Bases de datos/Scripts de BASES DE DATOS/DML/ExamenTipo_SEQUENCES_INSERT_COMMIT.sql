CREATE TABLE profesor
(
idProfesor NUMBER (4),
nif_P varchar2 (10),
nombre varchar2 (30),
especialidad varchar2 (30),
telefono varchar2 (9),

CONSTRAINT PK_idProfesor PRIMARY KEY (idProfesor)
);

CREATE TABLE asignatura
(
codAsignatura varchar2 (4),
nombre varchar2 (30),
idProfesor NUMBER (4),

CONSTRAINT PK_codAsignatura PRIMARY KEY (codAsignatura),
CONSTRAINT FK_idProfesor FOREIGN KEY (idProfesor) REFERENCES profesor (idProfesor)
);

CREATE TABLE alumno
(
numMatricula NUMBER (8),
nombre varchar2 (30),
fechaNacimiento DATE,
telefono varchar2 (9),

CONSTRAINT PK_numMatricula PRIMARY KEY (numMatricula)
);

CREATE TABLE recibe
(
numMatricula NUMBER (8),
codAsignatura varchar2 (4),
cursoEscolar varchar2 (10),

CONSTRAINT PK_cursoEscolar PRIMARY KEY (cursoEscolar,numMatricula,codAsignatura),
CONSTRAINT FK_codAsignatura FOREIGN KEY (codAsignatura) REFERENCES asignatura (codAsignatura),
CONSTRAINT FK_numMatricula FOREIGN KEY (numMatricula) REFERENCES alumno (numMatricula)
);



INSERT INTO profesor (idProfesor) VALUES (1);
INSERT INTO profesor (idProfesor) VALUES (2);

INSERT INTO asignatura (codAsignatura) VALUES ('0001');
INSERT INTO asignatura (codAsignatura) VALUES ('0002');
INSERT INTO asignatura (codAsignatura) VALUES ('0003');
INSERT INTO asignatura (codAsignatura) VALUES ('0004');

INSERT INTO alumno (numMatricula) VALUES (0001);
INSERT INTO alumno (numMatricula) VALUES (0002);
INSERT INTO alumno (numMatricula) VALUES (0003);
INSERT INTO alumno (numMatricula) VALUES (0004);
INSERT INTO alumno (numMatricula) VALUES (0005);
INSERT INTO alumno (numMatricula) VALUES (0006);
INSERT INTO alumno (numMatricula) VALUES (0007);
INSERT INTO alumno (numMatricula) VALUES (0008);
INSERT INTO alumno (numMatricula) VALUES (0009);
INSERT INTO alumno (numMatricula) VALUES (0010);

INSERT INTO recibe VALUES (1,'0001',0001);
INSERT INTO recibe VALUES (1,'0003',0001);


INSERT INTO recibe VALUES (2,'0001',0002);
INSERT INTO recibe VALUES (2,'0002',0002);


INSERT INTO recibe VALUES (3,'0001',0003);
INSERT INTO recibe VALUES (3,'0004',0003);


INSERT INTO recibe VALUES (4,'0001',0004);
INSERT INTO recibe VALUES (4,'0002',0004);


INSERT INTO recibe VALUES (5,'0001',0005);
INSERT INTO recibe VALUES (5,'0003',0005);


INSERT INTO recibe VALUES (6,'0001',0006);
INSERT INTO recibe VALUES (6,'0004',0006);


INSERT INTO recibe VALUES (7,'0001',0007);
INSERT INTO recibe VALUES (7,'0004',0007);

INSERT INTO recibe VALUES (8,'0001',0008);
INSERT INTO recibe VALUES (8,'0002',0008);

INSERT INTO recibe VALUES (9,'0001',0009);
INSERT INTO recibe VALUES (9,'0002',0009);

INSERT INTO recibe VALUES (10,'0001',0010);
INSERT INTO recibe VALUES (10,'0003',0010);




--N3
--No  se puede ya que el NumMatricula es id Único.

--N4
INSERT INTO alumno (numMatricula,nombre,fechaNacimiento) VALUES (0011,'Luke',to_date('21/01/2003','DD/MM/YYYY'));
INSERT INTO alumno (numMatricula,nombre,fechaNacimiento) VALUES (0012,'JajaSebas',to_date('01/06/2002','DD/MM/YYYY'));
INSERT INTO alumno (numMatricula,nombre,fechaNacimiento) VALUES (0013,'LaMamáDeLaMamá',to_date('30/11/1994','DD/MM/YYYY'));

--N5

UPDATE alumno SET telefono='911620429' WHERE telefono IS NULL;


--N6
UPDATE alumno SET fechaNacimiento=to_date('22/07/1981','DD/MM/YYYY') WHERE 2000 < extract(YEAR FROM fechaNacimiento);

--N7
INSERT INTO profesor (idProfesor,telefono) VALUES (3,'92232');
INSERT INTO profesor (idProfesor,telefono,nif_P) VALUES (4,'92234','944');
INSERT INTO profesor (idProfesor,telefono,nif_P) VALUES (5,'92211','444');

UPDATE profesor SET especialidad='Informática' WHERE telefono IS NOT NULL AND nif_P NOT LIKE '9%';

--N8
DELETE FROM recibe WHERE codAsignatura='0001';

--N9
DELETE FROM asignatura WHERE codasignatura='0001';

--N10
DELETE FROM recibe WHERE codAsignatura='0002';
DELETE FROM recibe WHERE codAsignatura='0003';
DELETE FROM recibe WHERE codAsignatura='0004';

DELETE FROM asignatura WHERE codasignatura='0004';
DELETE FROM asignatura WHERE codasignatura='0002';
DELETE FROM asignatura WHERE codasignatura='0003';

--N11
DELETE FROM profesor;

--N12
UPDATE alumno SET nombre=upper(nombre);

--N13
CREATE TABLE alumno_backup
(
numMatricula NUMBER (8),
nombre varchar2 (30),
fechaNacimiento DATE,
telefono varchar2 (9),

CONSTRAINT PK_numMatricula2 PRIMARY KEY (numMatricula)
); 

INSERT INTO alumno_backup SELECT * FROM alumno;



--Extra

ALTER TABLE alumno_backup ADD especialidad varchar2(30);

UPDATE alumno_backup SET especialidad='informática' WHERE EXTRACT (YEAR FROM fechaNacimiento) >= 1987;

UPDATE alumno_backup SET especialidad='Sin especialidad' WHERE especialidad IS NULL;




--SECUENCIAS

--El campo numMatricula de alumno se auto incrementa

COMMIT;

SELECT SQ_numMtricula.currval FROM alumno;
SELECT SQ_numMtricula.nextval FROM alumno;


CREATE SEQUENCE SQ_numMtricula
START WITH 16
INCREMENT BY 1;

INSERT INTO alumno VALUES ('15','Joseluis',NULL,NULL);

INSERT INTO alumno VALUES (SQ_numMtricula.nextval,'Joseluis',NULL,NULL);



--Esto en MySQL

CREATE TABLE libros
(
codigo NUMBER(5) auto_increment,
nombre varchar(10),

CONSTRAINT PK_libro PRIMARY KEY (codigo)
);

INSERT INTO libros (nombre) VALUES ('Josepe');
