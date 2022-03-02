CREATE TABLE articulos
(
articulo varchar2(20) NOT NULL,
cod_fabricante number(3) NOT NULL,
peso number(3) NOT NULL,
categoria varchar2(10) NOT NULL,
precio_venta number(4,2),
precio_costo number(4,2),
existencias number(5),

CONSTRAINT PK_articulos PRIMARY KEY (articulo,cod_fabricante,peso,categoria),
CONSTRAINT CH_precio_venta CHECK (precio_venta > 0),
CONSTRAINT CH_precio_costo CHECK (precio_costo > 0),
CONSTRAINT CH_peso CHECK (peso > 0),
CONSTRAINT CH_categoria CHECK (categoria IN ('PRIMERA','SEGUNDA','TERCERA'))
);

CREATE TABLE tiendas
(
nif varchar2 (10) NOT NULL,
nombre varchar2 (20),
direccion varchar2 (20),
poblacion varchar2 (20),
provincia varchar2 (20),
codpostal number (5),

CONSTRAINT PK_nif PRIMARY KEY (nif),
CONSTRAINT CH_provincia CHECK (provincia = upper(provincia))
);

CREATE TABLE fabricantes 
(
cod_fabricante NUMBER (3) NOT NULL,
nombre varchar2 (15),
pais varchar2 (15),

CONSTRAINT PK_tiendas PRIMARY KEY (cod_fabricante),
CONSTRAINT CH_nombre CHECK (nombre = upper(nombre)),
CONSTRAINT CH_pais CHECK (pais = upper(pais))
);

CREATE TABLE pedidos
(
nif varchar2 (10) NOT NULL ,
articulo varchar2 (20) NOT NULL,
cod_fabricante NUMBER (3) NOT NULL,
peso NUMBER (3) NOT NULL,
categoria varchar2 (10) NOT NULL,
fecha_pedido DATE DEFAULT sysdate NOT NULL,
unidades_pedidas NUMBER (4),

CONSTRAINT PK_pedidos PRIMARY KEY (nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT CH_unidades_pedidas CHECK (unidades_pedidas > 0)
);

CREATE TABLE ventas
(
nif varchar2 (10) NOT NULL,
articulo varchar2 (20) NOT NULL,
cod_fabricante NUMBER (3) NOT NULL,
peso NUMBER (3) NOT NULL,
categoria varchar2 (10) NOT NULL,
fecha_venta DATE DEFAULT sysdate NOT NULL ,
unidades_vendidas NUMBER (4),

CONSTRAINT PK_ventas PRIMARY KEY (nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT FK_cod_fabricante FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante),
CONSTRAINT CH_unidade CHECK (unidades_vendidas > 0),
CONSTRAINT FK_nif FOREIGN KEY (nif) REFERENCES tiendas (nif)
);

ALTER TABLE articulos ADD CONSTRAINT FK_cod_fabricante1 FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante);

ALTER TABLE pedidos ADD CONSTRAINT FK_cod_fabricante2 FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante);

ALTER TABLE pedidos ADD CONSTRAINT FK_nif1 FOREIGN KEY (nif) REFERENCES tiendas (nif);


ALTER TABLE pedidos ADD CONSTRAINT FK_peso1 FOREIGN KEY (articulo,peso,categoria,cod_fabricante) REFERENCES articulos (articulo,peso,categoria,cod_fabricante) ON DELETE CASCADE ;
ALTER TABLE ventas ADD CONSTRAINT FK_categoria2 FOREIGN KEY (articulo,peso,categoria,cod_fabricante) REFERENCES articulos (articulo,peso,categoria,cod_fabricante) ON DELETE CASCADE;

/**/

ALTER TABLE pedidos MODIFY unidades_pedidas NUMBER (6);
ALTER TABLE ventas MODIFY unidades_vendidas NUMBER (6);

ALTER TABLE pedidos ADD pvp NUMBER (5);
ALTER TABLE ventas ADD pvp NUMBER (5);

ALTER TABLE fabricantes DROP (pais);

ALTER TABLE ventas ADD CONSTRAINT CH_xfi CHECK (unidades_vendidas > 100);
ALTER TABLE ventas DROP CONSTRAINT CH_xfi;


DROP TABLE articulos CASCADE CONSTRAINT ;
DROP TABLE fabricantes CASCADE CONSTRAINT ;
DROP TABLE pedidos CASCADE CONSTRAINT ;
DROP TABLE tiendas CASCADE CONSTRAINT ;
DROP TABLE ventas CASCADE CONSTRAINT ;
