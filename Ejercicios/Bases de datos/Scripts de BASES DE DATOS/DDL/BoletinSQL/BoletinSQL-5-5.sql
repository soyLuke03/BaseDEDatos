CREATE TABLE departamento
(
id int (10),
nombre varchar (50) NOT NULL,

CONSTRAINT PK_id_depa PRIMARY KEY (id)
);

CREATE TABLE profesor
(
id int (10),
nif varchar (9),
nombre1 varchar (50) NOT NULL ,
apellido1 varchar (50) NOT NULL ,
apellido2 varchar (50),
ciudad varchar (25)NOT NULL,
direccion varchar (50) NOT NULL,
telefono varchar (9),
fecha_nacimiento DATE NOT NULL ,
sexo enum ('H','M') NOT NULL ,
id_departamento int (10) NOT NULL,

CONSTRAINT PK_idprof PRIMARY KEY (id),
CONSTRAINT FK_id_departamento FOREIGN KEY (id_departamento) REFERENCES departamento (id)
);

CREATE TABLE curso
(
id int (10),
año_inicio year NOT NULL ,
año_fin year NOT NULL ,

CONSTRAINT PK_idcurso PRIMARY KEY (id) 
);

CREATE TABLE grado
(
id int (10),
nombre varchar(100) NOT NULL ,

CONSTRAINT PK_idgrado PRIMARY KEY (id)
);

CREATE TABLE alumno
(
id int (10),
nif varchar (9),
nombre1 varchar (50) NOT NULL ,
apellido1 varchar (50) NOT NULL ,
apellido2 varchar (50),
ciudad varchar (25)NOT NULL,
direccion varchar (50) NOT NULL,
telefono varchar (9),
fecha_nacimiento DATE NOT NULL ,
sexo enum ('H','M') NOT NULL ,

CONSTRAINT PK_idAlumno PRIMARY KEY (id)
);

CREATE TABLE asignatura
(
id int (10),
nombre varchar (100) NOT NULL,
creditos float (10,2) NOT NULL,
tipo int (10) NOT NULL,
curso int (3) NOT NULL,
cuatrimestre int (3) NOT NULL,
id_profesor int (10),
id_grado int (10) NOT NULL,

CONSTRAINT PK_idAsign PRIMARY KEY (id),
CONSTRAINT FK_idprof FOREIGN KEY (id_profesor) REFERENCES profesor (id),
CONSTRAINT FK_idgrado FOREIGN KEY (id_grado) REFERENCES grado (id)
);

CREATE TABLE alumnomatricula
(
id_alumno int (10),
id_asignatura int (10),
id_curso_escolar int (10),

CONSTRAINT FK_idalum FOREIGN KEY (id_alumno) REFERENCES alumno (id),
CONSTRAINT FK_idasign FOREIGN KEY (id_asignatura) REFERENCES asignatura (id),
CONSTRAINT FK_idcurso FOREIGN KEY (id_curso_escolar) REFERENCES curso (id)
);