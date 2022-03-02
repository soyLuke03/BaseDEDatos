CREATE TABLE familia
(
nombre varchar2 (30),
caracteristicas varchar2(50),

CONSTRAINT PK_familia PRIMARY KEY (nombre)
);

CREATE TABLE genero
(
nombre varchar2 (30),
caracteristicas varchar2(50),
nombre_familia varchar2(30),

CONSTRAINT FK_genero FOREIGN KEY (nombre_familia) REFERENCES familia (nombre),
CONSTRAINT PK_genero PRIMARY KEY (nombre)
);

CREATE TABLE especie
(
nombre varchar2 (30),
caracteristicas varchar2 (50),
nombre_genero varchar2 (30),

CONSTRAINT FK_especie FOREIGN KEY (nombre_genero) REFERENCES genero (nombre),
CONSTRAINT PK_especie PRIMARY KEY (nombre)
);

CREATE TABLE zona
(
nombre varchar2 (30),
localidad varchar2 (50),
extension number(8),
protegida varchar2 (2),

CONSTRAINT CHK_zona CHECK (protegida IN('SI','NO')),
CONSTRAINT PK_zona PRIMARY KEY (nombre)
);

CREATE TABLE persona
(
dni varchar2 (9),
nombre varchar2 (30) UNIQUE ,
direccion varchar2 (50),
telefono varchar2 (12),
usuario varchar2 (30),

CONSTRAINT PK_persona PRIMARY KEY (dni)
);

CREATE TABLE coleccion
(
dni_persona varchar2 (9),
nejemplares NUMBER (10),
precio NUMBER (10),

CONSTRAINT CHK_coleccion CHECK (nejemplares BETWEEN 1 AND 150),
CONSTRAINT PK_coleccion PRIMARY KEY (dni_persona),
CONSTRAINT FK_coleccion FOREIGN KEY (dni_persona) REFERENCES persona (dni)
);

CREATE TABLE ejemplar_mariposa
(
horacaptura DATE,
fechacaptura DATE,
nombre varchar2 (30),
nombrecomun varchar2 (30),
precioejemplar number(10),
nombre_zona varchar2(30),
fecha_coleccion DATE,
dni_coleccion varchar2(9),
dni varchar2 (9),

CONSTRAINT CHK_ejemplar CHECK (precioejemplar >0),
CONSTRAINT PK_ejemplar PRIMARY KEY (horacaptura,fechacaptura),
CONSTRAINT FK_ejemplar FOREIGN KEY (nombre) REFERENCES especie (nombre),
CONSTRAINT FK_ejemplar2 FOREIGN KEY (nombre_zona) REFERENCES zona (nombre),
CONSTRAINT FK_ejemplar3 FOREIGN KEY (dni) REFERENCES  persona (dni),
CONSTRAINT FK_ejemplar4 FOREIGN KEY (dni_coleccion) REFERENCES coleccion (dni_persona)
);


ALTER TABLE persona ADD apellidos varchar2 (30);
ALTER TABLE zona ADD CONSTRAINT CHK_zona2 CHECK (extension BETWEEN 100 AND 1500);
ALTER TABLE ejemplar_mariposa disable CONSTRAINT CHK_ejemplar;


CREATE INDEX indice_nombre_apellidos ON persona (nombre,apellidos);
CREATE INDEX indice_fecha_captura ON ejemplar_mariposa (fechacaptura);

ALTER SESSION SET "_oracle_script"=TRUE;
create user usuario identified by usuario;
create role rol_usuario;
grant select on persona to rol_usuario;
grant select on ejemplar_mariposa to rol_usuario;
grant select on coleccion to rol_usuario;
grant rol_usuario to usuario;

create user empleado identified by empleado;
create role rol_empleado;
grant SELECT,INSERT,update on persona to rol_usuario;
grant SELECT,INSERT,update on ejemplar_mariposa to rol_usuario;
grant SELECT,INSERT,update on coleccion to rol_usuario;
grant SELECT,INSERT,update on zona to rol_usuario;
grant rol_empleado to empleado;

create user administrador identified by administrador;
create role rol_administrador;
grant connect, resource, dba to rol_empleado;
grant rol_empleado to administrador;



drop role rol_usuario;
drop role rol_empleado;
drop role rol_administrador;