CREATE TABLE comercial
(
id number(10),
nombre varchar2(100),
apellido1 varchar2(100),
apellido2 varchar2(100),
ciudad varchar2(100),
comision number(10,2),

CONSTRAINT PK_id PRIMARY KEY (id)
);

CREATE TABLE cliente
(
id number(10),
nombre varchar2(100),
apellido1 varchar2(100),
apellido2 varchar2(100),
ciudad varchar2(100),
categoria number(10),

CONSTRAINT PK_id2 PRIMARY KEY (id)
);

CREATE TABLE pedido
(
id number(10),
cantidad number(10),
id_cliente number(10),
id_comercial number(10),

CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id),
CONSTRAINT FK_comercial FOREIGN KEY (id_comercial) REFERENCES comercial (id)
);