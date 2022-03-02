create table departamento
(
id number(10),
nombre varchar2(50),

constraint PK_id primary key (id)
);

create table grado
(
id number(10),
nombre varchar2(100),

constraint PK_idgrado primary key (id)
);

create table curso
(
id number(10),
añoinicio date,
añofin date,

constraint PK_idaño primary key (id)
);

create table persona
(
id number(10),
nif varchar2(9),
nombre varchar2(25),
apellido1 varchar2(50),
apellido2 varchar2(50),
ciudad varchar2(25),
direccion varchar2(50),
telefono varchar2(9),
fecha_nacimiento date,
sexo varchar2(1),
tipo varchar2(50),

constraint PK_idper primary key (id)
);

create table profesor
(
id_profesor number(10),
id_departamento number(10),

constraint PK_idprof primary key (id_profesor),
constraint FK_id_departamento foreign key (id_departamento) references departamento (id),
constraint FK_idpro foreign key (id_profesor) references persona (id)
);

create table asignatura
(
id number(10),
nombre varchar2(100),
creditos NUMBER(10,5),
tipo varchar2(50),
curso number(3),
cuatrimestre number(3),
id_profesor number(10),
id_grado number(10),

constraint PK_idasig primary key (id),
constraint FK_idprof2 foreign key (id_profesor) references profesor (id_profesor),
constraint FK_id_grd foreign key (id_grado) references grado (id)
);

create table alumatri
(
id_alumno number(10),
id_asig number(10),
id_curso number(10),

constraint FK_ida foreign key (id_alumno) references persona (id),
constraint FK_adas foreign key (id_asig) references asignatura (id),
constraint FK_idc foreign key (id_curso) references curso (id)
);