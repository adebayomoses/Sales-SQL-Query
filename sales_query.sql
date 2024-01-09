select * from customer

select * from product

select * from sales

select * 
from customer 
where city in ('Philadelphia', 'Seattle')

select *
from customer
where city ='Seattle' or city ='Philadelphia'

select *
from sales
where ship_date between '2015-04-01' and '2016-04-01'



select * 
from customer
where age >= 50 and age <= 67

select *
from customer
where age not between 30 and 50


/* creating pattern in sql with like and % */

select *
from customer
where customer_name like 'J%'

select *
from customer
where customer_name like '%Nelson%'

select *
from customer
where customer_name like '____ %'

select * 
from customer
where customer_name not like 'S%'

---order by feature

select * 
from customer
where state = 'California' order by  customer_name

select * 
from customer
order by customer_name desc

select *
from customer
where age > 25
order by city asc, customer_name desc

select *
from customer
order by age

---limit feature

select *
from customer
where age > 40
limit 5

---AS feature

select customer_name as we_name
from customer
where age > 60
limit 4

--- for COUNT : you can count the whole table or each columns

select count(*) from sales
---
 
select count(order_line) as "Total_Order", count(order_id) as "Number_of_order"
from sales
where customer_id = 'CG-12520'

--SUM

select sum(profit) as "Total_Profit" 
from sales

---sum for a specific product id

select sum(quantity) as "Total_Quantity"
from sales
where product_id = 'FUR-TA-10000577'

---for AVERAGE 

select avg(age) as "Age_Average"
from customer

select avg(sales * 0.1) as "Avg_Average"
from sales

---MAX AND MIN

select min(sales) as "Minimum sales Value"
from sales
where order_date between '2015-06-01' and '2015-06-30'

select sales as "Minimum sales Value"
from sales
where order_date between '2015-06-01' and '2015-06-30' 
ORDER BY sales ASC

select max(sales) as "Minimum sales value"
from sales
where order_date between '2015-06-01' and '2015-06-30'

---GROUP BY
select region, count(customer_id) as "customer_count"
from customer
group by region

select product_id, sum(quantity) as "quantity_sold"
from sales
group by product_id 
order by quantity_sold desc

---implementing all what we have learnt

select customer_id,
min(sales) as "Lowest_Sales",
max(sales) as "Highest_Sales",
avg(sales) as "Average_Sales",
sum(sales) as "Total_Sales"
from sales
group by customer_id
order by 'Total_Sales' desc
limit 5;

---HAVING is use to specify condition in the aggregate columns and where is used in the non aggregate columns
---WHERE is used before group by and HAVING is used after group by
select region, count(customer_id) as "custmer count"
from customer
group by region
having count(customer_id) > 200

select region, count(customer_id) as "custmer count"
from customer
where customer_name like 'A%' 
group by region

---CASE WHEN

select *, case 
            when age < 30 then 'small age'
            when age > 60 then 'high age'
            else 'middle age'
            end as age_group
from customer


select region, count(customer_id) as "custmer count"
from customer
where customer_name like 'A%' 
group by region
having count(customer_id) > 15






