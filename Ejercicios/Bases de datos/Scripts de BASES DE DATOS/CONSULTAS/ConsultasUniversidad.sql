Create table titulacion (
Idtitulacion varchar2(6) primary key,
Nombre varchar2(30)
);


Create table persona (
dni varchar2(11) primary key,
Nombre varchar2(30),
Apellido varchar2(30),
Ciudad varchar2(15),
Direccioncalle varchar2(30),
Direccionnum number,
Telefono varchar2(9),
Fecha_nacimiento date,
Varon number
);



create table alumno (
idalumno varchar2(7) primary key,
dni varchar2(11),
foreign key (dni) references persona(dni)
);

Create table profesor (
Idprofesor varchar2(4) primary key,
Dni varchar2(11),
Foreign key(dni) references persona(dni)
);

Create table asignatura (
Idasignatura varchar2(6) primary key,
Nombre varchar2(20),
Creditos number,
Cuatrimestre number,
Costebasico number,
Idprofesor varchar2(4),
Idtitulacion varchar2(6),
Curso number,
Foreign key(idprofesor) references profesor(idprofesor),
Foreign key (idtitulacion) references titulacion(idtitulacion)
);

Create table  alumno_asignatura (
Idalumno varchar2(7),
Idasignatura varchar2(6),
Numeromatricula number,
  PRIMARY KEY(idalumno,idasignatura,numeromatricula),
Foreign key(idalumno) references alumno(idalumno),
Foreign key(idasignatura) references asignatura(idasignatura)
);


insert into persona values ('16161616A','Luis','Ramirez','Haro','Pez','34','941111111',to_date('1/1/1969','dd/mm/yyyy'),'1');
insert into persona values ('17171717A','Laura','Beltran','Madrid','Gran Va','23','912121212',to_date('8/8/1974','dd/mm/yyyy'),'0');
insert into persona values ('18181818A','Pepe','Perez','Madrid','Percebe','13','913131313',to_date('2/2/1980','dd/mm/yyyy'),'1');
insert into persona values ('19191919A','Juan','Sanchez','Bilbao','Melancola','7','944141414',to_date('3/2/1966','dd/mm/yyyy'),'1');
insert into persona values ('20202020A','Luis','Jimenez','Najera','Cigea','15','941151515',to_date('3/3/1979','dd/mm/yyyy'),'1');
insert into persona values ('21212121A','Rosa','Garcia','Haro','Alegra','16','941161616',to_date('4/4/1978','dd/mm/yyyy'),'0');
insert into persona values ('23232323A','Jorge','Saenz','Sevilla','Luis Ulloa','17','941171717',to_date('9/9/1978','dd/mm/yyyy'),'1');
insert into persona values ('24242424A','Mara','Gutierrez','Sevilla','Avda. de la Paz','18','941181818',to_date('10/10/1964','dd/mm/yyyy'),'0');
insert into persona values ('25252525A','Rosario','Diaz','Sevilla','Percebe','19','941191919',to_date('11/11/1971','dd/mm/yyyy'),'0');
insert into persona values ('26262626A','Elena','Gonzalez','Sevilla','Percebe','20','941202020',to_date('5/5/1975','dd/mm/yyyy'),'0');


insert into alumno values ('A010101','21212121A');
insert into alumno values ('A020202','18181818A');
insert into alumno values ('A030303','20202020A');
insert into alumno values ('A040404','26262626A');
insert into alumno values ('A121212','16161616A');
insert into alumno values ('A131313','17171717A');


insert into profesor values ('P101','19191919A');
insert into profesor values ('P117','25252525A');
insert into profesor values ('P203','23232323A');
insert into profesor values ('P204','26262626A');
insert into profesor values ('P304','24242424A');


insert into titulacion values ('130110','Matematicas');
insert into titulacion values ('150210','Quimicas');
insert into titulacion values ('160000','Empresariales');


insert into asignatura values ('000115','Seguridad Vial','4','1','30 ','P204',null,null);
insert into asignatura values ('130113','Programacion I', '9','1','60 ','P101','130110','1');
insert into asignatura values ('130122','Analisis II',    '9','2','60 ','P203','130110','2');
insert into asignatura values ('150212','Quimica Fisica','4','2','70','P304','150210','1');
insert into asignatura values ('160002','Contabilidad','6','1','70','P117','160000','1');


insert into alumno_asignatura values('A010101','150212','1');
insert into alumno_asignatura values('A020202','130113','1');
insert into alumno_asignatura values('A020202','150212','2');
insert into alumno_asignatura values('A030303','130113','3');
insert into alumno_asignatura values('A030303','150212','1');
insert into alumno_asignatura values('A030303','130122','2');
insert into alumno_asignatura values('A040404','130122','1');
insert into alumno_asignatura values('A121212','000115','1');
insert into alumno_asignatura values('A131313','160002','4');




-- EJERCICIOS -- 

-- 1 --
SELECT nombre,creditos FROM asignatura;

-- 2 --
SELECT DISTINCT creditos FROM asignatura;

-- 3 --
SELECT * FROM persona;

-- 4 --
SELECT nombre,creditos FROM asignatura WHERE cuatrimestre=1;

-- 5 --
SELECT nombre,apellido FROM persona WHERE fecha_nacimiento < to_date('1975-01-01','YYYY-MM-DD');

-- 6 --
SELECT nombre, costebasico FROM asignatura WHERE creditos > 4.5;

-- 7 --
SELECT nombre FROM asignatura WHERE costebasico BETWEEN 25 AND 35;

-- 8 --
SELECT idalumno FROM alumno,asignatura WHERE asignatura.idasignatura in ('150212','130113');

-- 9 --
SELECT nombre FROM asignatura WHERE cuatrimestre = 2 AND creditos != 6;

-- 10 --
SELECT nombre,apellido FROM persona WHERE apellido LIKE 'G%';

-- 11 --
SELECT nombre FROM asignatura WHERE idtitulacion IS NULL;

-- 12 --
SELECT nombre FROM asignatura WHERE idtitulacion IS NOT NULL;

-- 13 --
SELECT nombre FROM asignatura WHERE costebasico > 8;

-- 14 -- 
SELECT nombre,creditos*10 numeroDeHoras FROM asignatura;

-- 15 --
SELECT * FROM asignatura WHERE cuatrimestre = 2;

-- 16 --
SELECT nombre FROM persona WHERE varon = 0 AND ciudad LIKE 'Madrid';

-- 17 --
SELECT nombre,telefono FROM persona WHERE telefono LIKE '91%';

-- 18 -- 
SELECT nombre FROM asignatura WHERE nombre LIKE '%pro%';
--Si la p es mayúscula si sale programación

-- 19 -- 
SELECT nombre FROM asignatura WHERE curso = 1 AND idprofesor = 'P101';

-- 20 --  
SELECT idalumno,idasignatura FROM alumno_asignatura WHERE numeromatricula >= 3;

-- 21 -- 
SELECT nombre,costebasico,costebasico*0.1+costebasico primeraRepeticion,costebasico*0.3+costebasico segundaRepeticion, costebasico*0.6+costebasico terceraRepeticion FROM asignatura;

-- 22 --
SELECT * FROM persona WHERE extract(YEAR FROM fecha_nacimiento) < 1970;

-- 23 --
SELECT DISTINCT persona.dni FROM persona,profesor WHERE persona.dni like profesor.dni; 

-- 24 --
SELECT idalumno FROM alumno_asignatura WHERE idasignatura = 130122;

-- 25 --
SELECT DISTINCT asignatura.idasignatura FROM asignatura,alumno_asignatura WHERE alumno_asignatura.idalumno IS NOT NULL AND alumno_asignatura.idasignatura IS NOT NULL;

-- 26 --
SELECT nombre FROM asignatura 
WHERE creditos > 4 
OR cuatrimestre = 1 
OR curso = 1;

-- 27 --
SELECT DISTINCT idtitulacion 
FROM asignatura  
WHERE idtitulacion IS NOT null; 

-- 28 --
SELECT dni 
FROM persona 
WHERE apellido LIKE '%g%' 
OR apellido LIKE '%G%';

SELECT DISTINCT dni
FROM persona
WHERE upper(apellido) LIKE '%G%';

-- 29 --
SELECT nombre 
FROM persona 
WHERE varon = 1 
AND EXTRACT(YEAR FROM fecha_nacimiento) > 1970 
AND ciudad LIKE 'M%'; 