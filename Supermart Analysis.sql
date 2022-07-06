create database project2;
use project2;
drop table supermart;
create table supermart
(Order_id  integer,
Customer_Name varchar(90),	
Category varchar(90),	
Sub_Category varchar(90),	
City varchar(90),
Order_Date varchar(90),
Region varchar(90),	
Sales integer,	
Discount float,	
Profit integer,	
State varchar(90));
select * from supermart ;

/*Q1 want city = ooty and yellore, perambalur and their sales? */
select city, sales from supermart where city in ("ooty", "vellore", "Perambalur") order by city;

/*Q2 find out all customer_name letter sart with H and their sales? */
select distinct Customer_name, sales from supermart where customer_name like "H%" ;

/*Q3 who the person whose sales is max and min?*/
select customer_name, max(sales) as Highest_sale, min(sales) as Minimum_sale from supermart;

use project2;
/*Q4 Change column name from customer_name to customer_first_name ?*/
alter table supermart change column customer_name customer_first_name varchar(90);

/*Q5 Change the name of state as Kerela ? */
update supermart set state = "Kerela" ;

/*Q6 Calculate sum(profit), Avg(sales) from the table? */
select sum(profit), avg(sales) from supermart;

/*Q7 Use upper case for category and lower case for city?*/
select upper(Category), lower(city ) from supermart;

/*Q8 Get the 2nd higest sales ?*/
select max(Sales) from supermart 
where sales < (select max(Sales) from supermart);

/*other way  
select sales from 
(select sales from supermart order by sales desc limit 2) as
sup order by sales limit 1;   

/* other way
select Top 1 sales from 
(select Top 2 sales from supermart ORDER BY sales desc) 
as sup ORDER BY sales asc;

/*Q9 Get the top 3 city sales is maximum from the data? */
select city, sales from supermart order by sales desc limit 3;

/*Q10 Which region has max profit and min profit?*/
select distinct(region), max(profit) as Highest_profit from supermart; 

 /*Q11 Calculate the percentage of discount ?*/
select discount, (discount*100) as percent from retail_store ;


/*Q12 Get the maximum profit gained by products in which city */
select category , profit , city from supermart
group by city 
order by profit desc;


/*Q13 Get the names of that customer whose sales is between 1500 to 2000/
select customer_name , sales  from supermart 
where sales between 1500 and 2000 
order by sales desc ;



/*Q14 Get the Total sales of region east */
select sum(sales) as total  from supermart 
where region ="east" ;



/*Q15 Which are the top 5 city  whose profit is least ? */
select city , profit from supermart 
order by profit limit 5 ;


/*Q16 get the second order profit which is lowest ?*/
select min(profit) from supermart where profit > (select min(profit) from supermart);




/*Q17 Get the 4th maximum Sales from the data ?*/
select distinct(sales) from supermart as s1 where 4-1 = 
(select count(distinct sales) from supermart as s2 
where s2.sales > s1.sales);




/*Q18 Find the 6th maximum sales from the given data? */
select distinct(sales) from supermart s1 where 6-1 = 
(select count(distinct sales) from supermart s2 
where s2.sales > s1.sales );














