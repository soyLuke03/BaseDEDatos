CREATE TABLE departamento
(
codigo number (10),
nombre varchar2(100),
presupuesto NUMBER (10,2),

CONSTRAINT PK_cod PRIMARY KEY (codigo)
);

CREATE TABLE empleado
(
codigo number(10),
nif varchar2 (9),
nombre varchar2 (100),
apellido1 varchar2 (100),
apellido2 varchar2 (100),
codigo_depa number (10),

CONSTRAINT PK_codigo PRIMARY KEY (codigo),
CONSTRAINT FK_codigodepa FOREIGN KEY (codigo_depa) REFERENCES departamento (codigo)
);