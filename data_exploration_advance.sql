--1) Find out how many new customers were acquired in the year 2014?

select count(*) as numberofnewcustomers
from
(select customername,min(orderdate) as firstorderdate 
from orderlist
group by customername
having year(min(orderdate))='2014')
as customer2014

--2) calculate the percentage of total profit contribted by each sub-category to the overall profit

select subcategory, sum(profit) as totalprofit,sum(profit)/(select sum(profit) from eachorderbreakdown)*100 as PERCENTage
from eachorderbreakdown
group by subcategory

--3)Find the average sales per customer, considering only customers who have made more than one order.

with customeravgsales  as(
SELECT customername, count(distinct ol.orderid) as nooforders,avg(sales) as avgsales
from orderlist OL
join eachorderbreakdown OB
On ol.orderid=ob.orderid
group by customername
)
select customername,avgsales
from customeravgsales
where nooforders >1;

--4) Identify the top-performing subcategory in each category based on total sales.Include the sub-category name,total sales and a ranking of sub-category within each category.

with topperf AS
(
SELECT category,subcategory,sum(sales) as totalsales,rank() over (partition by category order by sum(sales) desc) as subcategoryrank
from eachorderbreakdown
group by category,subcategory
order by category
)
select *
from topperf
where subcategoryrank=1;