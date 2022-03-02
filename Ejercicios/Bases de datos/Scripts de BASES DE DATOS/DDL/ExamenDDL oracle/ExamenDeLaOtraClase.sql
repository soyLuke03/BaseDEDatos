

CREATE TABLE t_estracto
(
estrato number(10) CHECK (estrato > 39),
descripcion varchar2 (50),
totalusuarios NUMBER (10) DEFAULT 0 NOT NULL,

CONSTRAINT PK_estrato PRIMARY KEY (estrato)
);

CREATE TABLE t_cargos
(
idcargo varchar2 (2) CHECK (idcargo = upper(idcargo)) CHECK (idcargo IN ('FC','RC','RF','CO')),
descripcioncargo varchar2 (50),

CONSTRAINT PK_idcargo PRIMARY KEY (idcargo)
);

CREATE TABLE t_servicios
(
servicio varchar2 (3),
nservicio NUMBER (4),
descripcionservicio varchar2 (200) NOT NULL,
cupousuarios NUMBER (6),
nunusuarios NUMBER (10) DEFAULT 0 CHECK (nunusuarios >= 0) ,
testrato NUMBER (10),
importefijo NUMBER (8,2),
valorconsumo NUMBER (10,2),

CONSTRAINT PK_servicio_nservicio PRIMARY KEY (servicio, nservicio),
CONSTRAINT FK_testrao FOREIGN KEY (testrato) REFERENCES t_estracto (estrato)
);

CREATE TABLE t_movimientos
(
id_cliente NUMBER (5) UNIQUE NOT NULL,
fechaimporte DATE DEFAULT sysdate,
fechamovimiento DATE,
cargo_aplicado varchar2 (2) NOT NULL,
servicio varchar2 (3) NOT NULL,
nservicio NUMBER (4)NOT NULL,
consumo NUMBER (10,2) NOT NULL,
importefac NUMBER (10,2) NOT NULL,
importerec NUMBER (10,2) NOT NULL,
impmorterefa NUMBER (10,2) NOT NULL,
importeconv NUMBER (10,2) NOT NULL,

CONSTRAINT PK_t_movimientos PRIMARY KEY (id_cliente,cargo_aplicado,servicio,nservicio),
CONSTRAINT FK_servicio_nservicio FOREIGN KEY (servicio,nservicio) REFERENCES t_servicios (servicio,nservicio),
CONSTRAINT FK_cargo_aplicado FOREIGN KEY (cargo_aplicado) REFERENCES t_cargos (idcargo)
);

CREATE TABLE t_maestro
(
suscripcion NUMBER (5) CHECK (suscripcion > 0),
alta DATE,
nombre varchar2(20) NOT NULL,
direccion varchar2(30),
barrio varchar2(16),
saldoactual number(10,2),
estrato number(5),
mail varchar2(80) UNIQUE,
fechaalta DATE DEFAULT sysdate CHECK (fechaalta > to_date('01/01/1990','DD/MM/YYYY')),

CONSTRAINT PK_suscripcion PRIMARY KEY (suscripcion),
CONSTRAINT FK_suscripcion FOREIGN KEY (suscripcion) REFERENCES t_movimientos (id_cliente)
);

ALTER TABLE t_maestro ADD dni varchar2 (9) UNIQUE;
ALTER TABLE t_maestro DROP (barrio);
ALTER TABLE t_estracto MODIFY descripcion varchar2(60);


DROP TABLE t_estracto CASCADE CONSTRAINT ;
DROP TABLE t_maestro CASCADE CONSTRAINT ;
DROP TABLE t_movimientos CASCADE CONSTRAINT ;
DROP TABLE t_servicios CASCADE CONSTRAINT ;
DROP TABLE t_cargos CASCADE CONSTRAINT ;