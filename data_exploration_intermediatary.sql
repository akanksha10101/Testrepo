--1) Identify the customer with the highest total sales across all orders

SELECT top 1 customername,sum(sales) as totalsales
from orderlist OL
join eachorderbreakdown OB
on ol.orderid=ob.orderid
group by customername
order by totalsales desc

--2) FInd the month with the highestaverage sales in the orderlist table.

select month(orderdate) as monthorder, avg(sales) as averagesales
from orderlist OL
join eachorderbreakdown OB
on ol.orderid=ob.orderid
group by month(orderdate)
order by averagesales desc;

--3) find out the average quantity ordered by customers whosr first name starts with an alphabet 's'

SELECT avg(quantity) as avgquantity
from orderlist OL
join eachorderbreakdown OB
on ol.orderid=ob.orderid
where left(customername,1)='S'