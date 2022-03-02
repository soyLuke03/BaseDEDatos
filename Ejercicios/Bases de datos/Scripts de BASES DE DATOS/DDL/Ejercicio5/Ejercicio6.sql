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
horasDeCurso NUMBER (8),
NMaximoAlumnos number(8) NOT NULL,
DNI_Profesor varchar2 (9) NOT NULL,

CONSTRAINT PK_codigo PRIMARY KEY (codigo),
CONSTRAINT FK_DNI_Profesor FOREIGN KEY (DNI_Profesor) REFERENCES profesor (dni)
);

CREATE TABLE alumno
(
DNI varchar2 (9) NOT NULL,
Nombre varchar2 (30) NOT NULL,
Apellidos varchar2 (30) NOT NULL,
Direccion varchar2 (30),
FechaNacimiento DATE,
Sexo varchar2 (30) CHECK ( Sexo IN ('Masculino','Femenino','Otro')),
CodigoCurso NUMBER (8) NOT NULL,

CONSTRAINT PK_DNI_alumno PRIMARY KEY (DNI),
CONSTRAINT FK_CodigoCurso FOREIGN KEY (CodigoCurso) REFERENCES curso (codigo)
);