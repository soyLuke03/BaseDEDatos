CREATE TABLE Equipos
(
CodEquipo varchar2 (4),
Nombre varchar2 (30) NOT null,
Localidad varchar2 (15),


CONSTRAINT pk_codequipo PRIMARY KEY (CodEquipo)
);

CREATE TABLE Jugadores
(
CodJugador varchar2 (4),
Nombre varchar2 (30) NOT null,
FechaNacimiento DATE,
Demarcacion varchar2 (10),
CodEquipo varchar2 (4),

CONSTRAINT pk_codjugador PRIMARY KEY (CodJugador),
CONSTRAINT fk_codequipo FOREIGN KEY (CodEquipo) REFERENCES Equipos(CodEquipo)
);

CREATE TABLE Partidos
(
CodPartido varchar2 (4),
CodEquipoLocal varchar2 (4), 
CodEquipoVisitante varchar2 (4),
Fecha DATE,
Competicion varchar2 (4),
Jornada varchar2 (20),

CONSTRAINT pk_partido PRIMARY KEY (CodPartido),
CONSTRAINT fk_partidoLocal FOREIGN KEY (CodEquipoLocal) REFERENCES Equipos(CodEquipo),
CONSTRAINT fk_partidoVisitante FOREIGN KEY (CodEquipoVisitante) REFERENCES Equipos(CodEquipo),
CONSTRAINT chk_fecha CHECK ((EXTRACT (MONTH FROM fecha) NOT IN (7,8))),
CONSTRAINT chk_competicion CHECK (competicion IN ('Liga','Copa'))
);

CREATE TABLE Incidencias
(
NumIncidencia varchar2 (6),
CodPartido varchar2 (4),
CodJugador varchar2 (4),
Minuto number(2) CHECK (Minuto >= 1 AND Minuto <= 99),
Tipo varchar2 (20),

CONSTRAINT pk_NumIncidencia PRIMARY KEY (NumIncidencia),
CONSTRAINT fk_Codpartido FOREIGN KEY (CodPartido) REFERENCES Partidos (CodPartido),
CONSTRAINT fk_Codjugador FOREIGN KEY (CodJugador) REFERENCES Jugadores (CodJugador)
);

ALTER TABLE Jugadores ADD CONSTRAINT chk_demarcacion CHECK (Demarcacion IN ('Portero','Defensa','Medio','Delantero'));
ALTER TABLE Incidencias MODIFY Tipo NOT NULL; 
ALTER TABLE Equipos ADD GolesMarcados NUMBER (3);
ALTER TABLE Jugadores ADD CONSTRAINT chk_jugadores_nombre CHECK (nombre= initcap (nombre));
ALTER TABLE Equipos ADD CONSTRAINT chk_equipo_nombre CHECK (regexp_like (nombre, '^[0-9]{1}')); 
