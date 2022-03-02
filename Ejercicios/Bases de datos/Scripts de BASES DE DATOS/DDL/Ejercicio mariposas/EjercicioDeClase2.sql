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

INSERT INTO empleado VALUES (1, '32481596F', 'Aar?n', 'Rivero', 'G?mez', 1);
INSERT INTO empleado VALUES (2, 'Y5575632D', 'Adela', 'Salas', 'D?az', 2);
INSERT INTO empleado VALUES (3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES (4, '77705545E', 'Adri?n', 'Su?rez', NULL, 4);
INSERT INTO empleado VALUES (5, '17087203C', 'Marcos', 'Loyola', 'M?ndez', 5);
INSERT INTO empleado VALUES (6, '38382980M', 'Mar?a', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES (7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES (8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES (9, '56399183D', 'Juan', 'G?mez', 'L?pez', 2);
INSERT INTO empleado VALUES (10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES (11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES (12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES (13, '82635162B', 'Juan Antonio','S?ez', 'Guerrero', NULL);

--1--
INSERT INTO departamento (codigo,nombre,presupuesto) VALUES (8,'Esto no es un nombre',420120);

--2--
--INSERT INTO departamento (nombre,presupuesto) VALUES (9,'Estocolmo',9090); No funciona porque no hacemos referencia a la PK

--3--
INSERT INTO departamento (codigo,nombre,presupuesto,gastos) VALUES (9,'Robos',10000,5);

--4--
INSERT INTO empleado (codigo,nif,nombre,apellido1,apellido2,codigo_departamento) VALUES (14, '41232345R', 'Joseju','S?ez', 'Guerrero', 8);

--5--
--INSERT INTO empleado (nif,apellido1,apellido2,codigo_departamento) VALUES ('12321232A','Joseju','El','Yutuber',8); No funciona porque no hacemos referencia a la PK

--6--
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

--7--
DELETE FROM departamento WHERE nombre='Proyecto';

--8--
ALTER TABLE empleado disable CONSTRAINT FK_departamento;
DELETE FROM departamento WHERE nombre='Desarrollo';
ALTER TABLE empleado enable CONSTRAINT FK_departamento;
--De la forma que lo tengo planteado no sirve, 
--pero podría servir. 
--Lo que ocurriría es que se requiere de eliminar las referencias 
--de ambas tablas, eso incluye a los empleados de ese departamento. 
--Si se presupone que se cambian de departamento no hay problema 
--y lo mismo si son despedidos.

--9--
--UPDATE departamento SET codigo=30 WHERE nombre='Recursos Humanos';

--10--
--UPDATE departamento SET codigo=40 WHERE nombre='Publicidad';
--Se deber?a modificar las FK de empleado para que el c?digo no d? problemas.

--11--
UPDATE departamento SET presupuesto=presupuesto+50000 WHERE presupuesto<20000;

--12--
DELETE FROM empleado WHERE codigo_departamento IS null;