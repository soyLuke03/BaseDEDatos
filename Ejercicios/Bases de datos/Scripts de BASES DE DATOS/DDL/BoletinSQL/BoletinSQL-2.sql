CREATE TABLE comercial
(
id int(10),
nombre varchar(100),
apellido1 varchar(100),
apellido2 varchar(100),
ciudad varchar(100),
comision float,

CONSTRAINT PK_id PRIMARY KEY (id)
);

CREATE TABLE cliente
(
id int(10),
nombre varchar(100),
apellido1 varchar(100),
apellido2 varchar(100),
ciudad varchar(100),
categoria int(10),

CONSTRAINT PK_id2 PRIMARY KEY (id)
);

CREATE TABLE pedido
(
id int(10),
cantidad int(10),
id_cliente int(10),
id_comercial int(10),

CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id),
CONSTRAINT FK_comercial FOREIGN KEY (id_comercial) REFERENCES comercial (id)
);