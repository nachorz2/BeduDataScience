#1
USE classicmodels;
describe employees;
#2
select lastName
from employees;
#3
select lastName, firstName, jobTitle
from employees;
#4
select *
from employees;
#5
select  lastName, firstName, jobTitle
from employees
where  jobTitle = 'Sales Rep';
#6
select  lastName, firstName, jobTitle, officeCode
from employees
where  jobTitle = 'Sales Rep'
and officeCode = 1;
#7
select  lastName, firstName, jobTitle, officeCode
from employees
where  jobTitle = 'Sales Rep'
OR officeCode = 1;
#8
select  lastName, firstName, officeCode
from employees
where  officeCode in(1,2,3);

#9
select  lastName, firstName, jobTitle
from employees
where  jobTitle <> 'Sales Rep';

#10
select  lastName, firstName, officeCode
from employees
where officeCode > 5;

#11
select  lastName, firstName, officeCode
from employees
where officeCode <= 4;

describe customers ;
#12
select country, state, customerName
from customers 
where country = 'USA'
and state = 'CA';

#13

select country, state, customerName, creditLimit
from customers 
where country = 'USA'
and state = 'CA'
and creditLimit > 100000;

#14
select country, customerName
from customers 
where country = 'USA'
or country = 'France';

#15
select country, customerName, creditLimit
from customers 
where country = 'USA'
or country = 'France'
and creditLimit > 100000;

describe offices;
#16
select officeCode, city, phone, country
from offices 
where country = 'USA'
or country = 'France';
#17
select officeCode, city, phone, country
from offices 
where country NOT in('USA', 'France');
#18
describe orders;
select orderNumber, customerNumber, status, shippedDate
from orders
where orderNumber in (10165, 10287, 10310);


#19
select contactLastName, customerName
from customers
order by contactLastName;

#20
select contactLastName, customerName
from customers
order by contactLastName DESC;

#21
select contactLastName, customerName
from customers
order by  contactLastName DESC, customerName ASC;

#22
select customerNumber, customerName, creditLimit
from customers
order by creditLimit DESC
limit 5;

#23
select customerNumber, customerName, creditLimit
from customers
where creditLimit <> 0
order by creditLimit
limit 5 ;








