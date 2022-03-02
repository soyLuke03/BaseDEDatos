CREATE TABLE gama_producto
(
gama varchar(50),
descripcion_texto varchar(200),
descripcion_html varchar(200),
imagen varchar(256),

CONSTRAINT PK_gama PRIMARY KEY (gama)
);

CREATE TABLE producto
(
codigo_producto varchar (15),
nombre varchar (70) NOT NULL ,
gama varchar (50),
dimensiones varchar (25),
preoveedor varchar (50),
descripcion varchar (200),
cantidad_en_stock int (6) NOT NULL,
precio_venta decimal (15,2) NOT NULL,
precio_proveedor decimal (15,2),

CONSTRAINT PK_codigo_producto PRIMARY KEY (codigo_producto),
CONSTRAINT FK_gama FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE pago
(
codigo_cliente int (11),
forma_pago varchar(40) NOT NULL ,
id_transaccion varchar (50),
fecha_pago DATE,
total decimal (15,2),

CONSTRAINT PK_id_transaccion PRIMARY KEY (id_transaccion, codigo_cliente)
);
 
CREATE TABLE oficina
(
codigo_oficina varchar(10),
ciudad varchar(30) NOT NULL ,
pais varchar(50) NOT NULL,
region varchar(50),
codigo_postal varchar(10) NOT NULL,
telefono varchar(20) NOT NULL,
linea_direccion1 varchar(50) NOT NULL,
linea_direccion2 varchar(50),

CONSTRAINT PK_codigo_oficina PRIMARY KEY (codigo_oficina) 
);

CREATE TABLE empleado
(
codigo_empleado int (11),
nombre varchar(50) NOT NULL ,
apellido1 varchar(50) NOT NULL,
apellido2 varchar(50),
extension varchar(10) NOT NULL,
email varchar(100) NOT NULL,
codigo_oficina varchar(10),
codigo_jefe int(11),
puesto varchar(50),

CONSTRAINT PK_codigo_empleado PRIMARY KEY (codigo_empleado),
CONSTRAINT FK_codigo_oficina FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina)
);

CREATE TABLE cliente
(
codigo_cliente int (11),
nombre_cliente varchar (50) NOT NULL,
nombre_contacto varchar (30),
apellido_contacto varchar (30),
telefono varchar(15) NOT NULL ,
fax varchar (15) NOT NULL ,
linea_direccion1 varchar(50) NOT NULL,
linea_direccion2 varchar (50),
ciudad varchar(50) NOT NULL,
region varchar (50),
pais varchar(50),
codigo_postal varchar(10),
codigo_empleado_rep_ventas int (11),
limite_credito decimal (15,2),

CONSTRAINT PK_codigo_cliente PRIMARY KEY (codigo_cliente),
CONSTRAINT FK_codigo_empleado_rep_ventas FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido
(
codigo_pedido int (11),
fecha_pedido DATE NOT NULL ,
decha_esperada DATE NOT NULL ,
fecha_entrega DATE ,
estado varchar (15) ,
comentarios varchar(200),
codigo_cliente int(11),

CONSTRAINT PK_codigo_pedido PRIMARY KEY (codigo_pedido),
CONSTRAINT FK_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE detalle_pedido
(
codigo_pedido int (11),
codigo_producto varchar (15),
cantidad int (11) NOT NULL ,
precio_unidad decimal (15,2) NOT NULL ,
numero_linea int (6) NOT NULL ,

CONSTRAINT PK_detalle_pedido PRIMARY KEY (codigo_pedido , codigo_producto),
CONSTRAINT FK_codigo_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
CONSTRAINT FK_codigo_producto FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);


