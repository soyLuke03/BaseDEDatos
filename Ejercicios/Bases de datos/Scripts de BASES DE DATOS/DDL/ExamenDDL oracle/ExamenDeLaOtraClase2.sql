CREATE TABLE departamento
(
id number(10),
nombre varchar2(50) NOT NULL,

CONSTRAINT PK_departamento PRIMARY KEY (id)
);

CREATE TABLE grado
(
id number(10),
nombre varchar2(100) NOT NULL,

CONSTRAINT PK_grado PRIMARY KEY (id)
);

CREATE TABLE persona
(
id number(10),
nif varchar2(9),
nombre varchar2(25) NOT NULL,
apellido1 varchar2 (50) NOT NULL,
apellido2 varchar2 (50) ,
ciudad varchar2 (25) NOT NULL,
direccion varchar2 (50) NOT NULL,
telefono varchar2 (9),
fecha_nacimiento DATE,
sexo varchar2(1) NOT NULL,
tipo varchar2(1) NOT NULL,

CONSTRAINT CHK_persona CHECK (sexo IN ('H','M')),
CONSTRAINT CHK_persona1 CHECK (tipo IN('1','2','3','4','5','6')),
CONSTRAINT PK_persona PRIMARY KEY (id)
);

CREATE TABLE curso_escolar
(
id NUMBER(10),
anyo_inicio DATE NOT NULL ,
anyo_fin DATE NOT NULL ,

CONSTRAINT PK_curso_escolar PRIMARY KEY (id)
);

CREATE TABLE profesor
(
id_profesor number(10),
id_departamento number(10),

CONSTRAINT FK_profesor2 FOREIGN KEY (id_profesor) REFERENCES persona (id),
CONSTRAINT PK_profesor PRIMARY KEY (id_departamento, id_profesor),
CONSTRAINT FK_profesor FOREIGN KEY (id_departamento) REFERENCES departamento (id)
);

CREATE TABLE asignatura
(
id NUMBER(10),
nombre varchar2(100),
creditos number(10,2) NOT NULL,
tipo varchar2(10) NOT NULL,
curso NUMBER(3) NOT NULL,
cuatrimestre number(3) NOT NULL,
id_profesor number(10),
id_grado NUMBER(10) NOT NULL,

CONSTRAINT PK_asignatura PRIMARY KEY (id),
CONSTRAINT FK_asignatura FOREIGN KEY (id_profesor) REFERENCES persona (id),
CONSTRAINT FK_asignatura2 FOREIGN KEY (id_grado) REFERENCES grado (id)
);

CREATE TABLE alumno_se_matricula_asignatura
(
id_alumno number(10),
id_asignatura number(10),
id_curso_escolar number(10),

CONSTRAINT FK_al FOREIGN KEY (id_alumno) REFERENCES persona (id),
CONSTRAINT FK_as FOREIGN KEY (id_asignatura) REFERENCES asignatura (id),
CONSTRAINT FK_cs FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar (id)
);

ALTER TABLE persona ADD CONSTRAINT CHK_nombre CHECK (nombre = upper(nombre));
ALTER TABLE persona ADD edad number(3);
ALTER TABLE persona ADD CONSTRAINT CHK_edad CHECK (edad BETWEEN 7 AND 25);
ALTER TABLE curso_escolar ADD CONSTRAINT CHK_fecha CHECK (anyo_inicio < anyo_fin);
ALTER TABLE asignatura ADD CONSTRAINT CHK_cuatrimestre CHECK (cuatrimestre BETWEEN 1 AND 4);
ALTER TABLE asignatura ADD CONSTRAINT CHK_tipo CHECK (tipo LIKE ('%T'));
ALTER TABLE persona ADD CONSTRAINT CHK_anyo1 CHECK (EXTRACT (YEAR from fecha_nacimiento) > 1981 );
ALTER TABLE asignatura DROP COLUMN creditos;

