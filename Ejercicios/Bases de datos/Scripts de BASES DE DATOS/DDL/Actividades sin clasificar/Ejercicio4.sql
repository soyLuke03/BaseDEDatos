CREATE TABLE barcos 
(
matricula varchar2 (8),
nombre varchar2 (30),
clase varchar2 (50),
armador varchar2 (50),
capacidad NUMBER  (15),
nacionalidad varchar2 (30),

CONSTRAINT PK_matricula PRIMARY KEY (matricula)
);

CREATE TABLE lotes
(
codigo NUMBER (8),
matricula varchar2 (8),
numkilos NUMBER (12),
precioporkilosalida NUMBER (12),
precioporkiloadjudicado NUMBER (12),
fechaventa DATE NOT NULL  ,
cod_especie NUMBER (8) ,
 
CONSTRAINT PK_codigo_especie PRIMARY KEY (codigo),
CONSTRAINT FK_matricula FOREIGN KEY (matricula) REFERENCES barcos (matricula) ON DELETE CASCADE ,
CONSTRAINT FK_cod_especie_2 FOREIGN KEY (cod_especie) REFERENCES especie (codigo) ON DELETE CASCADE 
);

CREATE TABLE especie
(
codigo NUMBER (8),
nombre varchar2(30),
tipo varchar2 (50),
cupoporbarco NUMBER (30),
caladero_principal NUMBER (8),

CONSTRAINT PK_codigo PRIMARY KEY (codigo)
);

CREATE TABLE caladero
(
codigo NUMBER (8),
nombre varchar2 (30),
ubicacion varchar2 (50) ,
especie_principal NUMBER (8),

CONSTRAINT PK_codigo_caladero PRIMARY KEY (codigo),
CONSTRAINT FK_especie_principal FOREIGN KEY (especie_principal) REFERENCES especie (codigo) ON DELETE SET NULL 
);

CREATE TABLE fechas_capturas_permitidas
(
cod_especie NUMBER (8),
cod_caladero NUMBER (8),
fecha_inicial DATE ,
fecha_final DATE ,

CONSTRAINT PK_cod_especie PRIMARY KEY (cod_especie, cod_caladero),
CONSTRAINT FK_cod_especie FOREIGN KEY (cod_especie) REFERENCES especie (codigo),
CONSTRAINT FK_cod_caladero FOREIGN KEY (cod_caladero) REFERENCES caladero (codigo)
);

ALTER TABLE especie ADD CONSTRAINT FK_caladero_principal FOREIGN KEY (caladero_principal) REFERENCES caladero (codigo);
ALTER TABLE lotes MODIFY precioporkiloadjudicado NOT NULL;
ALTER TABLE lotes ADD CONSTRAINT chk_numkilos CHECK (numkilos > 0);
ALTER TABLE lotes ADD CONSTRAINT chk_precio CHECK (numkilos > 0);
ALTER TABLE barcos ADD CONSTRAINT chk_nombre CHECK (nombre = upper(nombre));
ALTER TABLE caladero ADD CONSTRAINT chk_ubicacion CHECK (ubicacion = upper(ubicacion));
ALTER TABLE caladero ADD nombre_cientifico varchar2(50);
ALTER TABLE barcos DROP (armador);
ALTER TABLE barcos ADD CONSTRAINT CHK_matricula CHECK (regexp_like ( matricula, '[A-Z]{2}{-}{1}[0-9]{4}]' ));



DROP TABLE barcos CASCADE CONSTRAINT;
DROP TABLE lotes CASCADE CONSTRAINT;
DROP TABLE caladero CASCADE CONSTRAINT;
DROP TABLE fechas_capturas_permitidas CASCADE CONSTRAINT;
DROP TABLE especie CASCADE CONSTRAINT;


/* INSERT INTO especie (nombre) VALUES ('pez espada');
   ALTER TABLE fechas_capturas_permitidas ADD CONSTRAINT chk_fecha CHECK (to_date(fecha_inicial)>=('02/02' , 'DD/MM') AND (to_date(fecha_final) <= ('28/03' , 'DD/MM') )));
*/
