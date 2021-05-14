use classicmodels;
describe employees;
#1 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con A.
select employeeNumber,lastName, firstName
from employees
where firstName like 'A%';
#2 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con on.
select employeeNumber,lastName, firstName
from employees
where lastName like '%on';

#3 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.

select employeeNumber,lastName, firstName
from employees
where firstName like '%on%';

#4Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
select employeeNumber,lastName, firstName
from employees
where firstName like 'G_____';

#5 Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
select employeeNumber,lastName, firstName
from employees
where firstName NOT like 'B%';

#6 *****Dentro de la tabla products, obtén el código de producto y nombre de los productos cuyo código incluye la cadena _20.
describe products;
select productCode, productName
from products
where productCode like '%_20%';

describe orderdetails;
#7 Dentro de la tabla orderdetails, obtén el total de cada orden.
select sum(priceEach) total, orderNumber
from orderdetails
group by orderNumber;

#8 Dentro de la tabla orders obtén el número de órdenes por año.
describe orders;
select  year(orderDate) Año, count(*) TotOrders
from orders
group by YEAR(orderDate);

describe employees;
describe offices;
#9 Obtén el apellido y nombre de los empleados cuya oficina está ubicada en USA.
select lastName, firstName
from employees 
where officeCode in  (select officeCode
					  from offices
					  where country = 'USA');

#10 Obtén el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.

describe payments;
select customerNumber, checkNumber, amount
from payments
where amount in (select max(amount) maximo
      from payments);


#11 Obtén el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
select customerNumber, checkNumber, amount 
from payments 
where amount > (select avg(amount)
                from payments);
                
#12 Obtén el nombre de aquellos clientes que no han hecho ninguna orden.
describe customers;
describe orders;
select customerName 
from customers
where customerNumber not in (select customerNumber 
                             from orders);


#13 Obtén el máximo, mínimo y promedio del número de productos en las órdenes de venta.
select orderNumber, max(quantityOrdered), min(quantityOrdered), avg(quantityOrdered)
	  from orderdetails
      group by orderNumber;
describe orderdetails;
select * 
from orderdetails;

describe orders;
#14 Dentro de la tabla orders, Obtén el número de órdenes que hay por cada estado.
select total, status
from (select status, count(orderNumber) total
	from orders
    group by status) as sq;


