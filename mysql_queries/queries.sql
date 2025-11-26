/*USE tienda;
-- Consultas tienda --
-- 1 --
SELECT nombre FROM producto;
-- 2 --
SELECT nombre, precio FROM producto;
-- 3 --
SELECT * FROM producto;
-- 4 --
SELECT nombre, precio AS euros, ROUND(precio * 1.17,2) AS USD FROM producto;
-- 5 --
SELECT nombre AS 'nombre de "producto"', precio AS Euros, ROUND(precio * 1.16, 2) AS 'dòlares estadounidenses' FROM producto;
-- 6 --
SELECT UPPER(nombre) AS nombre, precio FROM producto;
-- 7 --
SELECT LOWER(nombre) AS nombre, precio FROM producto;
-- 8 --
SELECT nombre, UPPER(LEFT(nombre,2)) AS iniciales FROM fabricante;
-- 9 --
SELECT nombre, ROUND(precio) AS Redondeo FROM producto;
-- 10 --
SELECT nombre, TRUNCATE(precio,0) AS Truncado FROM producto;
-- 11 --
SELECT codigo_fabricante FROM producto;
-- 12 --
SELECT DISTINCT codigo_fabricante FROM producto;
-- 13 --
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14 --
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15 --
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
-- 16 --
SELECT * FROM fabricante LIMIT 5;
-- 17 --
SELECT * FROM fabricante LIMIT 3,2;
-- 18 --
SELECT nombre,precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19 --
SELECT nombre,precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20 --
SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2 ;
-- 21 --
SELECT pr.nombre AS Nombre, f.nombre AS Fabricante, pr.precio AS Precio FROM producto pr JOIN fabricante f ON f.codigo = pr.codigo_fabricante;
--22--
SELECT pr.nombre AS Nombre, f.nombre AS Fabricante, pr.precio AS Precio FROM producto pr JOIN fabricante f ON f.codigo = pr.codigo_fabricante ORDER BY f.nombre ASC;
--23--
SELECT pr.codigo AS Codigo, pr.nombre AS Nombre, f.codigo AS 'C.Fabricante', f.nombre AS 'Nombre Fabricante' FROM producto pr JOIN fabricante f ON f.codigo = pr.codigo_fabricante;
--24--
SELECT p.nombre AS 'Nombre producto',p.precio AS Precio, f.nombre AS Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY Precio ASC LIMIT 1;
--25--
SELECT p.nombre AS 'Nombre producto',p.precio AS Precio, f.nombre AS Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY Precio DESC LIMIT 1;
--26--
SELECT p.nombre AS 'Productos Lenovo' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
--27--
SELECT p.nombre AS 'Productos Crucial', p.precio AS Precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200 ORDER BY p.precio ASC;
--28--
SELECT p.nombre AS Producto, f.nombre AS Fabricante  FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' OR f.nombre = 'Asus' OR f.nombre = 'Seagate' 
--29--
SELECT p.nombre AS Producto, f.nombre AS Fabricante  FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN('Hewlett-Packard','Asus','Seagate');
--30--
SELECT p.nombre AS Producto, p.precio AS Precio  FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.nombre LIKE'%e';
--31--
SELECT p.nombre AS Producto, p.precio AS Precio  FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.nombre LIKE'%w%';
--32--
SELECT p.nombre AS Producto, p.precio AS Precio, f.nombre AS Fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE Precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;





-- Consultas universidad --
USE universidad;
-- 1 --
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2 --
SELECT nombre, apellido1,apellido2,tipo FROM persona WHERE tipo = 'alumno' AND telefono is NULL;
-- 3 --
SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1997;
-- 4 --
SELECT apellido1, apellido2, nombre, telefono, tipo, nif FROM persona WHERE tipo = 'profesor' AND (telefono = '' OR telefono is NULL)AND LOWER(nif) LIKE '%k';
-- 5 --
SELECT nombre AS `Asignatura`,curso AS `Tercer curso`,cuatrimestre AS `1er Cuatrimestre`,id_grado FROM asignatura WHERE curso = 3 AND cuatrimestre = 1 AND id_grado = 7; 
-- 6 --
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'nombre_asignatura' FROM profesor INNER JOIN persona ON persona.id = profesor.id_profesor INNER JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY persona.apellido1,persona.apellido2,persona.nombre ASC;
-- 7 --
SELECT p.nombre AS Nombre, p.nif AS DNI, a.nombre AS Asignatura, ce.anyo_inicio AS 'Año de inicio',ce.anyo_fin AS 'Año de fin'FROM asignatura a JOIN alumno_se_matricula_asignatura am ON a.id = am.id_asignatura JOIN persona p ON am.id_alumno = p.id JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE p.nif = '26902806M';
-- 8 --
SELECT DISTINCT d.nombre AS 'Nombre Dep.' FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON a.id_profesor = p.id_profesor JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9 --
SELECT DISTINCT p.id AS Numero, p.nombre AS Nombre, p.apellido1 AS 'Primer apellido', p.apellido2 AS 'Segundo apellido',ce.anyo_inicio AS 'Año de inicio', ce.anyo_fin AS 'Año fin' FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND CE.anyo_fin = 2019;

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN --

-- 1 --
SELECT d.nombre AS Departamento, pr.apellido1 AS 'Primer apellido', pr.apellido2 AS 'Segundo apellido', pr.nombre AS Nombre FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN persona pr ON p.id_profesor = pr.id ORDER BY d.nombre ASC, pr.apellido1 ASC, pr.apellido2 ASC, pr.nombre ASC;
-- 2 --
SELECT p.apellido1 AS 'Primer apellido', p.apellido2 AS 'Segundo apellido',p.nombre AS Nombre FROM persona p JOIN profesor pr ON pr.id_profesor = p.id LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE d.id IS NULL; 
-- 3 --
SELECT dp.nombre AS Departamento, pr.id_profesor AS 'Id Profesor' FROM departamento dp LEFT JOIN profesor pr ON dp.id = pr.id_departamento WHERE pr.id_profesor IS NULL;
-- 4 --
SELECT p.nombre AS Nombre, p.apellido1 AS 'Primer apellido', p.apellido2 AS 'Segundo apellido',a.nombre AS asignatura, p.tipo AS Tipo FROM persona p  JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id IS NULL;
-- 5 --
SELECT a.nombre FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE p.id_profesor IS NULL;


-- Consultas generales --

-- 1 --
SELECT COUNT(*) AS Total FROM persona WHERE tipo = 'alumno' ;
-- 2 --
SELECT COUNT(*) AS Total FROM persona WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '1999-12-31';
-- 3 --
SELECT dp.nombre AS Departamento, COUNT(pr.id_profesor) AS Total FROM departamento dp INNER JOIN profesor pr ON dp.id = pr.id_departamento GROUP BY dp.id, dp.nombre ORDER BY Total DESC;
-- 4 --
SELECT dp.nombre AS Departamentos, COUNT(pr.id_profesor) AS Profesores FROM departamento dp LEFT JOIN profesor pr ON pr.id_departamento = dp.id GROUP BY dp.id, dp.nombre;
-- 5 --
SELECT gr.nombre AS Grado, COUNT(a.id) AS Asignaturas FROM grado gr LEFT JOIN asignatura a ON a.id_grado = gr.id GROUP BY gr.nombre  ORDER BY Asignaturas DESC;
-- 6--
SELECT gr.nombre AS Grado, COUNT(a.id) AS asignatura FROM grado gr JOIN asignatura a ON gr.id = a.id_grado GROUP BY gr.nombre HAVING COUNT(a.id) >= 40;
-- 7 --
SELECT gr.nombre AS Grado, a.tipo AS 'Tipo asignatura', SUM(a.creditos) AS 'Total creditos' FROM grado gr JOIN asignatura a ON a.id_grado = gr.id GROUP BY gr.nombre, a.tipo;
-- 8 --
SELECT ce.anyo_inicio AS 'Año de inicio', COUNT(DISTINCT p.id) AS Alumnos FROM persona p JOIN alumno_se_matricula_asignatura am ON am.id_alumno = p.id JOIN curso_escolar ce ON ce.id = am.id_curso_escolar GROUP BY ce.anyo_inicio;
--9--

--10--

--11--

