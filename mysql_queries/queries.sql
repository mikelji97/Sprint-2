USE tienda;
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
SELECT p.nombre, f.precio, f.nombre FROM producto p
JOIN fabricante f ON p.
-- Consultas universidad --
/* USE universidad;
-- 1 --
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2 --
SELECT apellido1, apellido2, nombre, telefono FROM persona WHERE tipo = 'alumno' AND telefono = '' OR telefono is NULL;
-- 3 --
SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND (fecha_nacimiento >= '1999/01/01' AND fecha_nacimiento <= '1999/12/31');
-- 4 --
SELECT apellido1, apellido2, nombre, telefono, tipo, nif FROM persona WHERE tipo = 'profesor' AND (telefono = '' OR telefono is NULL)AND LOWER(nif) LIKE '%k';
-- 5 --
SELECT curso, cuatrimestre, id_grado FROM asignatura WHERE curso = 3 AND (cuatrimestre = 1) AND (id_grado  = 7); 
-- 6 --
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'nombre_asignatura' FROM profesor INNER JOIN persona ON persona.id = profesor.id_profesor INNER JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY persona.apellido1,persona.apellido2,persona.nombre ASC;
-- 7 --
SELECT p.nombre AS Nombre, a.nombre, ce.anyo_inicio,ce.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno JOIN persona p ON am.id_alumno = p.id JOIN curso_escolar ce ON p.id = ce.id WHERE p.nif= '26902806M';
-- 8 --
SELECT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Agrícola (Plan 2015)';  
-- 9 --

SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura ams ON p.id = ams.id_alumno JOIN curso_escolar ce ON ams.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018; 

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN --

-- 1 --
SELECT d.nombre, pr.apellido1, pr.apellido2, pr.nombre FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id JOIN persona pr ON p.id_profesor = pr.id ORDER BY d.nombre ASC, pr.apellido1 ASC, pr.apellido2 ASC, pr.nombre ASC;
-- 2 --
SELECT d.nombre, pr.apellido1, pr.apellido2, pr.nombre FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id JOIN persona pr ON p.id_profesor = pr.id WHERE d.id IS NULL ORDER BY d.nombre ASC, pr.apellido1 ASC, pr.apellido2 ASC, pr.nombre ASC;
-- 3 --
SELECT d.nombre FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id WHERE p.id_profesor IS NULL;
-- 4 --
SELECT a.nombre, pr.apellido1, pr.apellido2, pr.nombre FROM profesor p LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN persona pr ON p.id_profesor = pr.id WHERE a.id_profesor IS NULL;
-- 5 --
SELECT a.nombre FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE p.id_profesor IS NULL;
-- 6 --
SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- Consultas generales --

-- 1 --
SELECT COUNT(*) AS Total FROM persona WHERE tipo = 'alumno' ;
-- 2 --
SELECT COUNT(*) AS Total FROM persona WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '1999-12-31';
-- 3 --
SELECT d.nombre AS Departamento, COUNT(p.id_profesor) AS Total FROM profesor p  INNER JOIN departamento d ON p.id_departamento = d.id WHERE p.id_profesor IS NOT NULL ORDER BY COUNT(p.id_profesor) ASC;
-- 4 --
SELECT d.nombre, COUNT(p.id_profesor) AS profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento;
-- 5 --
SELECT g.nombre, COUNT(a.id) AS Total FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado ORDER BY Total DESC;
*/
