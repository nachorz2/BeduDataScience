use tienda ;
describe articulo;
#Reto 1
#1
select *
from articulo
where nombre like '%Pasta%';
#2
select *
from articulo
where nombre like '%Cannelloni%';

#3
select *
from articulo
where nombre like '%-%';

#Reto2

describe puesto;
select round(avg(salario),2)
from puesto;
Select min(salario)
From puesto ;
Select max(salario)
from puesto;

select count(*)
from articulo
where nombre like '%Pasta%';

select sum(salario)
from puesto 
where  id_puesto >= 996;


#Reto 3
#1
Select nombre , count(*) suma
from puesto
group by nombre;
#2
Select nombre , round(sum(salario),2) as "total pagado"
from puesto
group by nombre;

describe venta;
#3
select id_empleado, count(*) Ventas
from venta
group by id_empleado;
#4
select id_articulo, count(*) Ventas
from venta
group by id_articulo;

describe empleado;

#Reto 4
#1
select nombre
from empleado
where id_puesto IN ( Select id_puesto 
from puesto 
where salario < 12000);

#2
select id_empleado, max(total_ventas) as Maximo, min(total_ventas) as min
from(select clave, id_empleado, count(*) total_ventas
from venta
group by clave, id_empleado) as subconsulta
group by id_empleado;

Select* 
from venta;

#3
select id_puesto, nombre, (Select nombre from puesto where id_puesto = e.id_puesto) as puesto
from empleado as e;

