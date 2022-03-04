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
SELECT count(costebasico)
FROM asignatura;

-- 2 --
SELECT count(asignatura.idasignatura), titulacion.nombre
FROM titulacion,asignatura
WHERE titulacion.idtitulacion = asignatura.idtitulacion 
GROUP BY titulacion.nombre;

-- 3 --
SELECT titulacion.nombre, sum(costebasico) total
FROM titulacion,asignatura
WHERE titulacion.idtitulacion = asignatura.idtitulacion 
GROUP BY titulacion.nombre;

-- 4 --
SELECT costebasico + (costebasico*0.07) 
FROM asignatura,titulacion
WHERE titulacion.idtitulacion = asignatura.idtitulacion 
AND titulacion.nombre LIKE 'Mate%'
GROUP BY costebasico;

-- 5 --
SELECT count(alumno.idalumno) alumnos, asignatura.idasignatura 
FROM alumno, asignatura, alumno_asignatura
WHERE alumno.idalumno = alumno_asignatura.idalumno 
AND alumno_asignatura.idasignatura = asignatura.idasignatura 
GROUP BY asignatura.idasignatura;

-- 6 --
SELECT count(alumno.idalumno) alumnos, asignatura.nombre 
FROM alumno, asignatura, alumno_asignatura
WHERE alumno.idalumno = alumno_asignatura.idalumno 
AND alumno_asignatura.idasignatura = asignatura.idasignatura 
GROUP BY asignatura.nombre;

-- 7 --
SELECT persona.nombre, sum(costebasico*(0.1 * alumno_asignatura.numeromatricula) + costebasico)
FROM persona,alumno,alumno_asignatura,asignatura
WHERE persona.dni=alumno.dni
AND alumno.idalumno = alumno_asignatura.idalumno 
AND alumno_asignatura.idasignatura = asignatura.idasignatura 
GROUP BY persona.nombre;

-- 8 --
SELECT avg(costebasico)
FROM asignatura,titulacion,alumno_asignatura
WHERE asignatura.idtitulacion = titulacion.idtitulacion 
AND costebasico > 60
AND numeromatricula = 1;

-- 9 --
SELECT titulacion.nombre
FROM titulacion,alumno,asignatura,alumno_asignatura
WHERE titulacion.idtitulacion = asignatura.idtitulacion 
AND asignatura.idasignatura = alumno_asignatura.idasignatura 
AND alumno_asignatura.idalumno = alumno.idalumno 
GROUP BY titulacion.nombre
HAVING count(alumno.idalumno)>3;

-- 10 -- 
SELECT persona.ciudad, count(persona.dni)
FROM persona
GROUP BY persona.ciudad;

-- 11 --
SELECT persona.nombre, count(asignatura.idasignatura)
FROM persona,profesor,asignatura
WHERE persona.dni = profesor.dni 
AND profesor.idprofesor = asignatura.idprofesor 
GROUP BY persona.nombre;

-- 12 --
SELECT persona.nombre, count(alumno.idalumno) alumnos
FROM persona,profesor,asignatura,alumno,alumno_asignatura
WHERE persona.dni = profesor.dni 
AND profesor.idprofesor = asignatura.idprofesor 
GROUP BY persona.nombre
HAVING count(alumno.idalumno)>=2;

-- 13 --
SELECT max(sum(costebasico)/cuatrimestre)
FROM asignatura
GROUP BY asignatura.cuatrimestre;

-- 14 --
SELECT sum(costebasico)
FROM asignatura;

-- 15 --
SELECT count(nombre)
FROM asignatura;

-- 16 --
SELECT max(costebasico), min(costebasico)
FROM asignatura;

-- 17 -- 
SELECT count(creditos),creditos
FROM asignatura
GROUP BY creditos;

-- 18 --
SELECT count(curso)
FROM asignatura;

-- 19 --
SELECT count(ciudad)
FROM persona;

-- 20 -- 
SELECT nombre,creditos*10 horas
FROM asignatura;

-- 21 --
SELECT asignatura.nombre, titulacion.nombre
FROM asignatura,titulacion
WHERE asignatura.idtitulacion IS NULL;

-- 22 --
SELECT nombre + apellido nombreCompleto , telefono , direccioncalle + direccionnum direccion
FROM persona;

-- 23 --
SELECT EXTRACT (DAY FROM fecha_nacimiento) + 1, nombre
FROM persona;

-- 24 --
SELECT EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM fecha_nacimiento),nombre
FROM persona;

-- 25 --
SELECT apellido,nombre
FROM persona
WHERE (EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM fecha_nacimiento))>25
ORDER BY apellido;

-- 26 --
SELECT persona.nombre,persona.apellido
FROM persona,alumno,profesor
WHERE persona.dni = alumno.dni
AND persona.dni = profesor.dni;

-- 27 -- 
SELECT sum(creditos)
FROM asignatura,titulacion
WHERE titulacion.nombre LIKE 'Mate%';

--28--
SELECT COUNT(asignatura.idasignatura)
FROM asignatura, titulacion
WHERE titulacion.nombre ='Matematicas';

--29--
SELECT asignatura.costebasico, persona.nombre 
FROM asignatura, alumno, alumno_asignatura, persona
WHERE asignatura.idasignatura = alumno_asignatura.idasignatura 
AND alumno_asignatura.idalumno =alumno.idalumno 
AND persona.dni =alumno.dni ;

--30--
SELECT COUNT (alumno_asignatura.idalumno)
FROM asignatura, alumno_asignatura 
WHERE alumno_asignatura.idasignatura = asignatura.idasignatura 
GROUP BY asignatura.idasignatura ;