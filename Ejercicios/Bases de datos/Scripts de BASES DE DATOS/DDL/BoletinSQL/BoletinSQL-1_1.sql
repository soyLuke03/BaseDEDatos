CREATE TABLE departamento
(
codigo int (10),
nombre varchar(100),
presupuesto double,

CONSTRAINT PK_cod PRIMARY KEY (codigo)
);

CREATE TABLE empleado
(
codigo int(10),
nif varchar (9),
nombre varchar (100),
apellido1 varchar (100),
apellido2 varchar (100),
codigo_depa int (10),

CONSTRAINT PK_codigo PRIMARY KEY (codigo),
CONSTRAINT FK_codigodepa FOREIGN KEY (codigo_depa) REFERENCES departamento (codigo)
);