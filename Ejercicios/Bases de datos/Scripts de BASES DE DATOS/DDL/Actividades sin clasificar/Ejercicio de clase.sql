-- SELECT * FROM XXXX WHERE XXXX;

CREATE TABLE fabricante
(
codigo int (10),
nombre varchar (100) NOT NULL,

CONSTRAINT PK_codigo PRIMARY KEY (codigo)
);

CREATE TABLE producto
(
codigo int (10),
nombre varchar (100) NOT NULL,
precio double NOT NULL,
codigo_fabricante int (10) NOT NULL,

CONSTRAINT Pk_codigo_producto PRIMARY KEY (codigo),
CONSTRAINT FK_codigo_fabricante FOREIGN KEY (codigo_fabricante) REFERENCES fabricante (codigo)
);

/*
 Insersiones, modificaciones y eliminaciones 
*/

INSERT INTO fabricante VALUES (1,'Asus');
INSERT INTO fabricante VALUES (2,'Lenovo');
INSERT INTO fabricante VALUES (3,'Hewlett-Packard');
INSERT INTO fabricante VALUES (4,'Samsung');
INSERT INTO fabricante VALUES (5,'Seagate');
INSERT INTO fabricante VALUES (6,'Crucial');
INSERT INTO fabricante VALUES (7,'Gigabyte');
INSERT INTO fabricante VALUES (8,'Huawey');
INSERT INTO fabricante VALUES (9,'Xiaomy');

INSERT INTO producto VALUES (1,'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES (3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES (4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES (6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES (8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES (9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


/*
 Modificaciones
*/

INSERT INTO fabricante VALUES (13,'Elpepe');

INSERT INTO fabricante (nombre, codigo) VALUES ('El Sech', 12);

INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES (16, 'ErLuke', 21, 12);

INSERT INTO producto (nombre, precio, codigo_fabricante, codigo) VALUES ('Se me olvidó', 2, 13, 15);

DELETE FROM producto WHERE codigo_fabricante=1; /*Este cambio es necesario para borrar a Asus, ya que es clave ajena de la otra tabla*/
DELETE FROM fabricante WHERE codigo=1;

DELETE FROM producto WHERE codigo_fabricante=9;
DELETE FROM fabricante WHERE codigo=9;



ALTER TABLE producto disable CONSTRAINT FK_codigo_fabricante;
UPDATE fabricante SET codigo=20 WHERE nombre='Lenovo';
UPDATE producto SET codigo_fabricante=20 WHERE codigo_fabricante=2;
ALTER TABLE producto enable CONSTRAINT FK_codigo_fabricante;



UPDATE fabricante SET codigo=30 WHERE nombre='Huawey';

UPDATE producto SET precio = precio+5;

DELETE FROM producto WHERE nombre like'Impresora%' AND precio<200.00;

/*================================================================*/
CREATE TABLE departamento
(
codigo NUMBER (10),
nombre varchar2 (100) NOT NULL,
presupuesto NUMBER (10,2) NOT NULL,
gastos NUMBER (10,2),

CONSTRAINT PK_departamento PRIMARY KEY (codigo)
);

CREATE TABLE empleado
(
codigo NUMBER (10),
nif varchar2(9) NOT NULL,
nombre varchar2(100) NOT NULL,
apellido1 varchar2(100) NOT NULL,
apellido2 varchar2(100),
codigo_departamento NUMBER (10),

CONSTRAINT PK_empleado PRIMARY KEY (codigo),
CONSTRAINT FK_departamento FOREIGN KEY (codigo_departamento) REFERENCES departamento (codigo)
);

/*Inserciones*/

INSERT INTO departamento VALUES (1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES (2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES (3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES (4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES (5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES (6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES (7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES (1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES (2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES (3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES (4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES (5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES (6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES (7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES (8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES (9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES (10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES (11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES (12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES (13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

INSERT INTO departamento (codigo,nombre,presupuesto) VALUES (8,'Esto no es un nombre',420120);
--INSERT INTO departamento (nombre,presupuesto) VALUES (9,'Estocolmo',9090); No funciona porque no hacemos referencia a la PK
INSERT INTO departamento (codigo,nombre,presupuesto,gastos) VALUES (9,'Robos',10000,5);
INSERT INTO empleado (codigo,nif,apellido1,apellido2,codigo_departamento) VALUES (14, '41232345R', 'Joseju','Sáez', 'Guerrero', 8);
--INSERT INTO empleado (nif,apellido1,apellido2,codigo_departamento) VALUES ('12321232A','Joseju','El','Yutuber',8); No funciona porque no hacemos referencia a la PK

CREATE TABLE departamento_backup
(
codigo NUMBER (10),
nombre varchar2 (100) NOT NULL,
presupuesto NUMBER (10,2) NOT NULL,
gastos NUMBER (10,2),

CONSTRAINT PK_departamento_backup PRIMARY KEY (codigo)
);
INSERT INTO departamento_backup VALUES (1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento_backup VALUES (2, 'Sistemas', 150000, 21000);
INSERT INTO departamento_backup VALUES (3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento_backup VALUES (4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento_backup VALUES (5, 'I+D', 375000, 380000);
INSERT INTO departamento_backup VALUES (6, 'Proyectos', 0, 0);
INSERT INTO departamento_backup VALUES (7, 'Publicidad', 0, 1000);

DELETE FROM departamento WHERE nombre='Proyecto';

ALTER TABLE empleado disable CONSTRAINT FK_departamento;
DELETE FROM departamento WHERE nombre='Desarrollo';
UPDATE empleado SET codigo_departamento=2 WHERE codigo_departamento=1; 
ALTER TABLE empleado enable CONSTRAINT FK_departamento;


--UPDATE departamento SET codigo=30 WHERE nombre='Recursos Humanos';
--UPDATE departamento SET codigo=40 WHERE nombre='Publicidad';
--Se debería modificar las FK de empleado para que el código no dé problemas.

UPDATE departamento SET presupuesto=presupuesto+50000 WHERE presupuesto<20000;

DELETE FROM empleado WHERE codigo_departamento=NULL;





