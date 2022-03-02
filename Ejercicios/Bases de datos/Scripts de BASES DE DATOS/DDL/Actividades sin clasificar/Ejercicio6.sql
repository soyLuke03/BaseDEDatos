CREATE TABLE profesor
(
dni varchar2 (9) NOT NULL,
nombre varchar2 (30),
direccion varchar2 (30),
sueldo NUMBER (5,2),
titulacion varchar2 (30),

CONSTRAINT PK_dni PRIMARY KEY (dni)
);

CREATE TABLE curso
(
codigo NUMBER (8) NOT NULL,
nombre varchar2(30) NOT NULL,
fechaInicio DATE,
fechaFinal DATE,
horasDeCurso NUMBER (8),
nMaximoAlumnos number(8) NOT NULL,
dni_Profesor varchar2 (9) NOT NULL,

CONSTRAINT PK_codigo PRIMARY KEY (codigo),
CONSTRAINT FK_DNI_Profesor FOREIGN KEY (dni_Profesor) REFERENCES profesor (dni)
);

CREATE TABLE alumno
(
dni varchar2 (9) NOT NULL,
nombre varchar2 (30) NOT NULL,
apellidos varchar2 (30) NOT NULL,
direccion varchar2 (30),
fechaNacimiento DATE,
sexo varchar2 (30) CHECK ( Sexo IN ('M','F')),
codigoCurso NUMBER (8) NOT NULL,

CONSTRAINT PK_dni_alumno PRIMARY KEY (dni),
CONSTRAINT FK_CodigoCurso FOREIGN KEY (codigoCurso) REFERENCES curso (codigo)
);

ALTER TABLE alumno ADD matricula varchar2 (30) NOT NULL;
ALTER TABLE curso MODIFY (horasDeCurso NOT NULL );
ALTER TABLE profesor ADD CONSTRAINT CH_sueldo CHECK (sueldo > 0) ;
ALTER TABLE curso ADD CONSTRAINT UN_curso UNIQUE (nombre);
ALTER TABLE profesor ADD CONSTRAINT UN_profesor UNIQUE (nombre);
ALTER TABLE curso ADD CONSTRAINT CH_fechas CHECK (fechaInicio < fechaFinal);
/*
DROP TABLE alumno CASCADE CONSTRAINT;
DROP TABLE profesor CASCADE CONSTRAINT;
DROP TABLE curso CASCADE CONSTRAINT;
