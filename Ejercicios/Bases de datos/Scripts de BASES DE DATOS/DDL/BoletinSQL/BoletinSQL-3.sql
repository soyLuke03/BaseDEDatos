create table departamento
(
id int(10),
nombre varchar(50),

constraint PK_id primary key (id)
);

create table grado
(
id int(10),
nombre varchar(100),

constraint PK_idgrado primary key (id)
);

create table curso
(
id int(10),
añoinicio year(4),
añofin year(4),

constraint PK_idaño primary key (id)
);

create table persona
(
id int(10),
nif varchar(9),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum ('H','M'),
tipo varchar(50),

constraint PK_idper primary key (id)
);

create table profesor
(
id_profesor int(10),
id_departamento int(10),

constraint PK_idprof primary key (id_profesor),
constraint FK_id_departamento foreign key (id_departamento) references departamento (id),
constraint FK_idpro foreign key (id_profesor) references persona (id)
);

create table asignatura
(
id int(10),
nombre varchar(100),
creditos float,
tipo varchar(50),
curso tinyint(3),
cuatrimestre tinyint(3),
id_profesor int(10),
id_grado int(10),

constraint PK_idasig primary key (id),
constraint FK_idprof2 foreign key (id_profesor) references profesor (id_profesor),
constraint FK_id_grd foreign key (id_grado) references grado (id)
);

create table alumatri
(
id_alumno int(10),
id_asig int(10),
id_curso int(10),

constraint FK_ida foreign key (id_alumno) references persona (id),
constraint FK_adas foreign key (id_asig) references asignatura (id),
constraint FK_idc foreign key (id_curso) references curso (id)
);