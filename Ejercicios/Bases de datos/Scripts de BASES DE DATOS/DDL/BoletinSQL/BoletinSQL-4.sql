CREATE TABLE gama_producto
(
gama varchar2(50),
descripcion_texto varchar2(200),
descripcion_html varchar2(200),
imagen varchar(256),

CONSTRAINT PK_gama PRIMARY KEY (gama)
);

CREATE TABLE producto
(
codigo_producto varchar2 (15),
nombre varchar2 (70) NOT NULL ,
gama varchar2 (50),
dimensiones varchar2 (25),
preoveedor varchar2 (50),
descripcion varchar2 (200),
cantidad_en_stock NUMBER (6) NOT NULL,
precio_venta decimal (15,2) NOT NULL,
precio_proveedor decimal (15,2),

CONSTRAINT PK_codigo_producto PRIMARY KEY (codigo_producto),
CONSTRAINT FK_gama FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE pago
(
codigo_cliente NUMBER (11),
forma_pago varchar2 (40) NOT NULL ,
id_transaccion varchar2 (50),
fecha_pago DATE,
total decimal (15,2),

CONSTRAINT PK_id_transaccion PRIMARY KEY (id_transaccion, codigo_cliente)
);
 
CREATE TABLE oficina
(
codigo_oficina varchar2(10),
ciudad varchar2(30) NOT NULL ,
pais varchar2(50) NOT NULL,
region varchar2(50),
codigo_postal varchar2(10) NOT NULL,
telefono varchar2(20) NOT NULL,
linea_direccion1 varchar2(50) NOT NULL,
linea_direccion2 varchar2(50),

CONSTRAINT PK_codigo_oficina PRIMARY KEY (codigo_oficina) 
);

CREATE TABLE empleado
(
codigo_empleado NUMBER (11),
nombre varchar2(50) NOT NULL ,
apellido1 varchar2(50) NOT NULL,
apellido2 varchar2(50),
extension varchar2(10) NOT NULL,
email varchar2(100) NOT NULL,
codigo_oficina varchar2(10),
codigo_jefe number(11),
puesto varchar2(50),

CONSTRAINT PK_codigo_empleado PRIMARY KEY (codigo_empleado),
CONSTRAINT FK_codigo_oficina FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina)
);

CREATE TABLE cliente
(
codigo_cliente NUMBER (11),
nombre_cliente varchar2 (50) NOT NULL,
nombre_contacto varchar2 (30),
apellido_contacto varchar2 (30),
telefono varchar2 (15) NOT NULL ,
fax varchar2 (15) NOT NULL ,
linea_direccion1 varchar2 (50) NOT NULL,
linea_direccion2 varchar2 (50),
ciudad varchar2(50) NOT NULL,
region varchar2 (50),
pais varchar2(50),
codigo_postal varchar2(10),
codigo_empleado_rep_ventas NUMBER (11),
limite_credito decimal (15,2),

CONSTRAINT PK_codigo_cliente PRIMARY KEY (codigo_cliente),
CONSTRAINT FK_codigo_empleado_rep_ventas FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido
(
codigo_pedido NUMBER (11),
fecha_pedido DATE NOT NULL ,
decha_esperada DATE NOT NULL ,
fecha_entrega DATE ,
estado varchar2 (15) ,
comentarios varchar2(200),
codigo_cliente number(11),

CONSTRAINT PK_codigo_pedido PRIMARY KEY (codigo_pedido),
CONSTRAINT FK_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente)
);

CREATE TABLE detalle_pedido
(
codigo_pedido NUMBER (11),
codigo_producto varchar2 (15),
cantidad NUMBER (11) NOT NULL ,
precio_unidad decimal (15,2) NOT NULL ,
numero_linea NUMBER (6) NOT NULL ,

CONSTRAINT PK_detalle_pedido PRIMARY KEY (codigo_pedido , codigo_producto),
CONSTRAINT FK_codigo_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
CONSTRAINT FK_codigo_producto FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);


ALTER TABLE pago ADD CONSTRAINT FK2_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente);
ALTER TABLE empleado ADD CONSTRAINT reflexiva FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)