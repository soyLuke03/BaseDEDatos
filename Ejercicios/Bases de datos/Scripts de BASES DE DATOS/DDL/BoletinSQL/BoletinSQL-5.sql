CREATE TABLE departamento
(
id NUMBER (10),
nombre varchar2 (50) NOT NULL,

CONSTRAINT PK_id_depa PRIMARY KEY (id)
);

CREATE TABLE profesor
(
id NUMBER (10),
nif varchar2 (9),
nombre1 varchar2 (50) NOT NULL ,
apellido1 varchar2 (50) NOT NULL ,
apellido2 varchar2 (50),
ciudad varchar2 (25)NOT NULL,
direccion varchar2 (50) NOT NULL,
telefono varchar2 (9),
fecha_nacimiento DATE NOT NULL ,
sexo varchar2(1) CHECK (sexo IN ('H','M')) NOT NULL ,
id_departamento NUMBER (10) NOT NULL,

CONSTRAINT PK_idprof PRIMARY KEY (id),
CONSTRAINT FK_id_departamento FOREIGN KEY (id_departamento) REFERENCES departamento (id)
);

CREATE TABLE curso
(
id NUMBER (10),
año_inicio DATE NOT NULL ,
año_fin DATE NOT NULL ,

CONSTRAINT PK_idcurso PRIMARY KEY (id) 
);

CREATE TABLE grado
(
id NUMBER (10),
nombre varchar2(100) NOT NULL ,

CONSTRAINT PK_idgrado PRIMARY KEY (id)
);

CREATE TABLE alumno
(
id NUMBER (10),
nif varchar2 (9),
nombre1 varchar2 (50) NOT NULL ,
apellido1 varchar2 (50) NOT NULL ,
apellido2 varchar2 (50),
ciudad varchar2 (25)NOT NULL,
direccion varchar2 (50) NOT NULL,
telefono varchar2 (9),
fecha_nacimiento DATE NOT NULL ,
sexo varchar2(1) CHECK (sexo IN ('H','M')) NOT NULL ,

CONSTRAINT PK_idAlumno PRIMARY KEY (id)
);

CREATE TABLE asignatura
(
id NUMBER (10),
nombre varchar2 (100) NOT NULL,
creditos NUMBER (10,2) NOT NULL,
tipo NUMBER (10) NOT NULL,
curso NUMBER (3) NOT NULL,
cuatrimestre NUMBER (3) NOT NULL,
id_profesor NUMBER (10),
id_grado NUMBER (10) NOT NULL,

CONSTRAINT PK_idAsign PRIMARY KEY (id),
CONSTRAINT FK_idprof FOREIGN KEY (id_profesor) REFERENCES profesor (id),
CONSTRAINT FK_idgrado FOREIGN KEY (id_grado) REFERENCES grado (id)
);

CREATE TABLE alumnomatricula
(
id_alumno NUMBER (10),
id_asignatura NUMBER (10),
id_curso_escolar NUMBER (10),

CONSTRAINT FK_idalum FOREIGN KEY (id_alumno) REFERENCES alumno (id),
CONSTRAINT FK_idasign FOREIGN KEY (id_asignatura) REFERENCES asignatura (id),
CONSTRAINT FK_idcurso FOREIGN KEY (id_curso_escolar) REFERENCES curso (id)
);