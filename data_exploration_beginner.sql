--1)List the top 10 orders with the highest sales from the eachorderbreakdown table

select top 10 *
from eachorderbreakdown 
order by sales desc;

--2) show the number of order for each product category in the eachorderbreakdown table

select category,count(*)
from eachorderbreakdown
group by category;

--3) find the total profit for each subcategory  in the eachorderbreakdown table

select subcategory,sum(profit) as totalprofit
from eachorderbreakdown
group by subcategory;