use classicmodels;

#Ejercicio 1**
select o.orderNumber , sum(quantityOrdered)
from orders o
join orderdetails od
On o.orderNumber = od.orderNumber
group by orderNumber;

#Ejercicio 2
select o.orderNumber, status, sum(priceEach*quantityOrdered) totalcost
from orders o
join orderdetails od
On o.orderNumber = od.orderNumber
group by orderNumber;

#Ejercicio 3 
#número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
Select o.orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach
from orders o
join orderdetails od
on o.orderNumber = od.orderNumber
join products p
on p.productCode = od.productCode;

#Ejercicio 4
#Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
Select o.orderNumber, productName, MSRP, priceEach
from orders o
join orderdetails od
on o.orderNumber = od.orderNumber
join products p
on od.productCode = p.productCode;

#Ejercicio 5
#Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden hecha por cada cliente.
select c.customerNumber, customerName, orderNumber, status
from customers c
left join orders o
on c.customerNumber = o.customerNumber;

### Ejercicio 6
SELECT c.customerNumber, customerName
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;

##Ejercicio 7
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
LEFT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

## Ejercicio 8
SELECT c.customerNumber, customerName, orderNumber, status
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber;
  
SELECT c.customerNumber, customerName
FROM customers c
RIGHT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;
  
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
RIGHT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

#Ejercicio 9 
Create view ejercicio9_1_988 as(
SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees e
RIGHT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber);

Select *
from ejercicio9_1_988
Where amount > 50000;
Create VIEW ejercio9_2_988 as(
select c.customerNumber, customerName, orderNumber, status
from customers c
left join orders o
on c.customerNumber = o.customerNumber);
Select *
from ejercio9_2_988
WHERE status = "Cancelled";

Create VIEW ejercicio9_3_988 as(
select o.orderNumber , sum(quantityOrdered) 
from orders o
join orderdetails od
On o.orderNumber = od.orderNumber
group by orderNumber);

Select *
from ejercicio9_3_988
where 'sum(quantityOrdered)' >600;
