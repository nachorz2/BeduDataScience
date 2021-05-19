use tienda;
show keys from venta;

#Reto 1
#1. Nombre de los empleados que realizaron cada venta
describe venta;
select clave, nombre, apellido_paterno
from venta as v
join empleado as e
On v.id_empleado = e.id_empleado
order by clave; 
#2. ¿Cuál es el nombre de los artículos que se han vendido?

Select clave, nombre
FROM venta as v 
join articulo as a
On v.id_articulo = a.id_articulo
order by clave;

#3 ¿Cuál es el total de cada venta?
SELECT clave, round(sum(precio),2) AS total
FROM venta AS v
JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
GROUP BY clave
ORDER BY clave;


#Reto 2
#Obtener el puesto de un empleado.
Create View reto2_1_988 as (
select p.nombre as Puesto , concat(e.nombre," ", e.apellido_paterno) Empleado
from empleado e
join puesto p
On e.id_puesto = p.id_puesto);

#Saber qué artículos ha vendido cada empleado.
CREATE VIEW reto2_2_988 AS
(SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo
ORDER BY v.clave);
#Saber qué puesto ha tenido más ventas.
Create view reto2_3_988 as(
Select p.nombre , count(v.clave) Ventas
from venta v
join empleado e
on v.id_empleado = e.id_empleado
join puesto p 
On e.id_puesto = p.id_puesto
group by p.nombre
order by p.nombre);
SELECT *
FROM reto2_3_988
ORDER BY Ventas DESC
LIMIT 1;