-- Pesca Variadas 1--

-- 1
SELECT a.nombre, a.apellidos, a.telf 
FROM afiliados a 
WHERE a.sexo like 'H'
AND a.nacimiento < to_date('01/01/1970','DD/MM/YYYY');

-- 2
SELECT DISTINCT c.pez,c.peso,c.talla 
FROM capturaseventos c, capturaseventos c2, peces p 
WHERE c.pez = p.pez 
AND p.pez = c2.pez 
AND c.talla <= 45
ORDER BY c.pez,c.peso DESC,c.talla DESC;

-- 3
SELECT a.nombre, a.apellidos 
FROM afiliados a, licencias l, permisos p 
WHERE a.ficha = p.ficha 
AND p.licencia = l.licencia 
AND (upper(l.licencia) LIKE 'A%' 
OR (a.telf LIKE '9%' AND a.direccion LIKE 'Avnd%'));

-- 4
SELECT DISTINCT l.lugar 
FROM lugares l 
WHERE l.cauce LIKE 'Rio Genil'
AND l.observaciones IS NULL;

-- 5
SELECT a.nombre, a.apellidos, c.aval1 
FROM afiliados a, capturassolos c
WHERE a.ficha = c.aval1;

-- 6
SELECT DISTINCT l.cauce,l.lugar,l.comunidad 
FROM lugares l , peces p, afiliados a , capturassolos c 
WHERE l.lugar = c.lugar 
AND c.ficha = a.ficha 
AND c.pez = p.pez
AND upper(p.pez) LIKE 'TENCA';

-- 7
SELECT a.nombre, a.apellidos
FROM afiliados a, eventos e, participaciones p 
WHERE a.ficha = p.ficha 
AND p.evento = e.evento 
AND p.trofeo IS NOT NULL
ORDER BY e.fecha_evento asc ;

-- 8
SELECT a.ficha, a.nombre, a.apellidos, p.posicion,p.trofeo 
FROM participaciones p join afiliados a 
on p.ficha = a.ficha 
where p.evento LIKE 'Super Barbo'
ORDER BY p.posicion;

-- 9
SELECT distinct a.nombre ||' '||a.apellidos,a2.nombre||' '|| a2.apellidos 
FROM afiliados a, afiliados a2, capturassolos c 
WHERE a.ficha = c.ficha 
AND c.aval2 = a2.ficha;

-- 10
SELECT e.evento
FROM participaciones p, afiliados a, eventos e 
WHERE a.ficha = p.ficha 
AND p.evento = e.evento 
AND EXTRACT (YEAR FROM e.fecha_evento) = 1995
AND p.trofeo IS NULL
AND a.ficha LIKE '3796'
ORDER BY e.fecha_evento DESC; 

-- Pesca variadas 2

-- 1
SELECT a.ficha, p.licencia 
FROM afiliados a, permisos p 
WHERE a.ficha = p.ficha 
AND p.licencia LIKE 'A%';

-- 2
SELECT c.pez ,l.comunidad ,a.nombre ||' '|| a.apellidos
FROM eventos e,capturaseventos c,lugares l, afiliados a 
WHERE c.evento = e.evento 
AND e.lugar = l.lugar 
AND c.ficha = a.ficha 
AND extract(YEAR FROM e.fecha_evento) = 1998
ORDER BY l.comunidad,c.pez,a.apellidos;

-- 3
SELECT e.evento ,l.lugar ,l.cauce 
FROM eventos e, lugares l
WHERE e.lugar = l.lugar 
AND upper(e.evento) LIKE '%INTERNACIONAL%';

-- 4
SELECT c.pez ,c.talla ,c.fecha_pesca ,c.hora_pesca 
FROM afiliados a, capturassolos c 
WHERE a.ficha = c.ficha 

ORDER BY c.pez DESC;

-- 5
SELECT DISTINCT l.cauce 
FROM lugares l,afiliados a,capturassolos c 
WHERE a.ficha = c.ficha
AND c.lugar = l.lugar 
AND c.talla/c.peso > 3;

-- 6
SELECT DISTINCT a.nombre, a.apellidos 
FROM afiliados a, capturaseventos c, peces p 
WHERE a.ficha = c.ficha
AND c.pez = p.pez 
AND p.observaciones LIKE '%rios%';

-- 7
SELECT a.nombre, a.apellidos
FROM afiliados a, (SELECT ficha, aval1
					FROM capturassolos 
					WHERE ficha = 1000
					ORDER BY hora_pesca asc) b
WHERE  a.ficha = b.aval1
AND rownum = 1;
;

-- 8
SELECT e.evento 
FROM eventos e, lugares l 
WHERE e.lugar = l.lugar (+)
AND l.observaciones IS NULL;

SELECT distinct e.evento
FROM eventos e 
WHERE e.observaciones IS NULL;

-- 9
SELECT distinct aval1.nombre, aval1.apellidos, aval2.nombre, aval2.apellidos
FROM (SELECT a.nombre, a.apellidos
	  FROM afiliados a, capturassolos c
	  WHERE a.ficha = c.aval1) aval1,
	  (SELECT a.nombre, a.apellidos
	  FROM afiliados a, capturassolos c
	  WHERE a.ficha = c.aval2) aval2;
	  
-- 10
SELECT distinct a.nombre, a.apellidos 
FROM afiliados a,
	  (SELECT p.posicion 
	   FROM participaciones p
	   WHERE p.posicion IN (1,2,3,4)) pos,
	   (SELECT e.lugar 
		FROM eventos e , lugares l 
		WHERE e.lugar = l.lugar) evelug
WHERE pos.posicion <= 4
AND evelug.lugar IN ('Coto De Dilar','Coto De Fardes')
;