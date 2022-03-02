CREATE TABLE editorial 
(
cod_editorial number(4) PRIMARY KEY,
denominacion varchar2(20)
);

CREATE TABLE tema
(
cod_tema NUMBER(4) PRIMARY KEY,
denominacion varchar2(20),
cod_tema_padre number(4),

CONSTRAINT FK_cod_tema_padre FOREIGN KEY (cod_tema_padre) REFERENCES tema (cod_tema) ON DELETE CASCADE 
);

CREATE TABLE libro 
(
cod_libro number(4) PRIMARY KEY,
titulo varchar2(20) NOT NULL,
f_creacion DATE,
cod_tema NUMBER(4) NOT NULL, 
autor_principal NUMBER (4),

CONSTRAINT FK_libro FOREIGN KEY (cod_tema) REFERENCES tema (cod_tema)
);

CREATE TABLE autor 
(
cod_autor number(4) PRIMARY KEY,
nombre varchar2(30),
f_nacimineto DATE,
cod_libro number(4)
);


ALTER TABLE libro ADD CONSTRAINT FK_autor_principal FOREIGN KEY (autor_principal) REFERENCES autor (cod_autor); 
ALTER TABLE autor ADD CONSTRAINT FK_libro_principal FOREIGN KEY (cod_libro) REFERENCES libro (cod_libro);


CREATE TABLE libro_autor
(
cod_libro number(4) NOT null,
cod_autor number(4),
orden NUMBER(1),

CONSTRAINT PK_libro_autor PRIMARY KEY (cod_libro, cod_autor),
CONSTRAINT FK_libro_autor FOREIGN KEY (cod_libro) REFERENCES libro (cod_libro),
CONSTRAINT FK_libro_autor2 FOREIGN KEY (cod_autor) REFERENCES autor (cod_autor)
);

CREATE TABLE publicaciones
(
cod_editorial number(4) PRIMARY KEY,
cod_libro number(4) NOT null,
precio NUMBER CHECK (precio > 0) NOT NULL,
f_publicacion DATE DEFAULT sysdate,
CONSTRAINT FK_publicaciones FOREIGN KEY (cod_libro) REFERENCES libro (cod_libro),
CONSTRAINT FK_publicaciones2 FOREIGN KEY (cod_editorial) REFERENCES editorial (cod_editorial)
);

ALTER TABLE autor MODIFY nombre NOT NULL;
ALTER TABLE autor MODIFY f_nacimineto NOT NULL;
ALTER TABLE autor MODIFY cod_libro NOT NULL;

ALTER TABLE libro MODIFY f_creacion NOT NULL;
ALTER TABLE libro MODIFY autor_principal NOT NULL;

ALTER TABLE libro_autor ADD CONSTRAINT limite_orden CHECK (orden>=1 AND orden<=5 );