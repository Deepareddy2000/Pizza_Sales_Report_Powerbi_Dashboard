Create database pizza

select * from [dbo].[pizza_sales ]

--A. KPI’s

--1.Total Revenue:

select sum(total_price) as Total_Revenue
from [dbo].[pizza_sales ]

--2. Average Order Value

select sum(total_price)/ Count(distinct order_id) as avg_order_value
from [dbo].[pizza_sales]

--3.Total Pizzas Sold

select sum(quantity) as Total_pizza_sold
from [dbo].[pizza_sales] 

--4.Total Orders

select Count(distinct order_id) as Total_orders
from [dbo].[pizza_sales] 

--5.Average Pizzas Per Order

select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal(10,2) ) as decimal (10,2))
as Average_pizzas_per_order
from  [dbo].[pizza_sales]

--B.Daily Trend for Total Orders

select datename(weekday,order_date) as order_day, count(distinct order_id) as Total_orders
from  [dbo].[pizza_sales]
group by datename(WEEKDAY,order_date)

--C.Monthly Trend for Orders

select datename(Month,order_date) as order_day,count(distinct order_id) as Total_orders
from [dbo].[pizza_sales]
group by datename(Month,order_date)

--D. % of Sales by Pizza Category

select pizza_category,cast(sum(total_price)as decimal(10,2)) as Total_revenue,cast(sum(total_price)*100/(select sum
(total_price)  from [dbo].[pizza_sales]) as decimal(10,2))  as PCT
from  [dbo].[pizza_sales]
group by pizza_category


--E. % of Sales by Pizza Size

select pizza_size,cast(sum(total_price)as decimal(10,2)) as Total_revenue,cast(sum(total_price)*100/(select sum
(total_price)  from [dbo].[pizza_sales]) as decimal(10,2))  as PCT
from [dbo].[pizza_sales]
group by pizza_size
order by pizza_size

--F. Total Pizzas Sold by Pizza Category

select pizza_category,sum(quantity) as Total_Quantity_sold
from [dbo].[pizza_sales]
group by pizza_category

--G. Top 5 Pizzas by Revenue

select top 5 pizza_name,sum(total_price) as Total_revenue
from [dbo].[pizza_sales]
group by pizza_name
order by Total_Revenue Desc

--H. Bottom 5 Pizzas by Revenue

select top 5 pizza_name,sum(total_price) as Total_revenue
from [dbo].[pizza_sales]
group by pizza_name
order by Total_Revenue asc

--I.Top 5 Pizzas by Quantity

select top 5 pizza_name, sum(Quantity) as pizza_sold
from [dbo].[pizza_sales]
group by pizza_name
order by pizza_sold desc

--J. Bottom 5 Pizzas by Quantity

select top 5 pizza_name, sum(Quantity) as pizza_sold
from [dbo].[pizza_sales]
group by pizza_name
order by pizza_sold asc

--K. Top 5 Pizzas by Total Orders

select top 5 pizza_name, count(distinct order_id) as Total_order
from [dbo].[pizza_sales]
group by pizza_name
order by Total_order desc

--L. Borrom 5 Pizzas by Total Orders

select top 5 pizza_name, count(distinct order_id) as Total_order
from [dbo].[pizza_sales]
group by pizza_name
order by Total_order asc

