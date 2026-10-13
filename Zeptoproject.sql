create database if not exists zepto_analytics;
use zepto_analytics;

''' Database inspecton'''

show tables;

# Row Count for each table
SELECT 'customerID'AS table_name, COUNT(*) AS row_count
FROM customers_information
UNION ALL
SELECT 'paymentID', COUNT(*) FROM payments_information
UNION ALL
SELECT 'productID', COUNT(*) FROM products_information
UNION ALL
SELECT 'promotionID', COUNT(*) FROM promotions_information
UNION ALL
SELECT 'orderID', COUNT(*) FROM sales_data
UNION ALL
SELECT 'storeID', COUNT(*) FROM stores_information;


'''Data Quality Checks'''

#  NULL checks
SELECT
    COUNT(*) AS total_rows,
    SUM(orderID IS NULL) AS null_order_id,
    SUM(orderdatetime IS NULL) AS null_order_date,
    SUM(CustomerID IS NULL) AS null_customer_id,
    SUM(ProductID IS NULL) AS null_product_id,
    SUM(StoreID IS NULL) AS null_store_id,
    SUM(Quantity IS NULL) AS null_quantity,
    SUM(NetAmount IS NULL) AS null_net_amount,
    SUM(OrderStatus IS NULL) AS null_status
FROM sales_data;

# Duplicate Checks
SELECT customerid, COUNT(*) AS duplicate_count
FROM customers_information
GROUP BY customerid
HAVING COUNT(*) > 1;

SELECT ProductID, COUNT(*) AS cnt
FROM products_information
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT StoreID, COUNT(*) AS cnt
FROM stores_information
GROUP BY StoreID
HAVING COUNT(*) > 1;

SELECT promotionid, COUNT(*) AS duplicate_count
FROM promotions_information
GROUP BY promotionid
HAVING COUNT(*) > 1;

SELECT PaymentID, COUNT(*) AS cnt
FROM payments_information
GROUP BY PaymentID
HAVING COUNT(*) > 1;

SELECT OrderID, COUNT(*) AS cnt
FROM sales_data
GROUP BY OrderID
HAVING COUNT(*) > 1;

# Negative values 
SELECT *
FROM sales_data
WHERE quantity < 0
   OR netamount < 0;

# Date Range
SELECT
    MIN(orderdatetime) AS first_date,
    MAX(orderdatetime) AS last_date
FROM sales_data;

# Customers who have not placed order
Select count(*) from sales_data
left join customers_information on sales_data.customerid=customers_information.customerID
where customers_information.customerID is null;

'''Basic Analysis'''

#Total revenue
select Round(sum(netamount),2) as Total_revenue
from sales_data
where orderstatus='Delivered';

#Total Orders
select Count(orderID) as Total_orders
from sales_data
where orderstatus='Delivered';

#Total Customers
select Count(CustomerID) as Total_customers
from customers_information
;

#Total products
select Count(ProductID) as Total_Products
from products_information;

#Total Revenue by category
select category, Round(sum(netamount),2) as Total_Revenue
from sales_data
join products_information using (productID)
group by category
order by Total_Revenue;

#Total Revenue by city
select city, Round(sum(netamount),2) as Total_Revenue
from sales_data
join customers_information using (customerID)
group by city
order by Total_Revenue;

#Total Revenue by store
select StoreID, Round(sum(netamount),2) as Total_Revenue
from sales_data
join stores_information using (storeID)
group by storeID
order by Total_Revenue;

#Average order Value
select round(sum(netamount)/count(orderID),2) as AOV 
from sales_data;

'''Intermediate Analysis'''

#Monthly Sales
select date_format(orderdatetime,'%Y-%m') as month, 
count(orderID) as total_orders, sum(quantity) as unit_sold, Round(sum(netamount),2) as Total_revenue
from sales_data
group by date_format(orderdatetime,'%Y-%m')
order by month asc;

#Top Products - (Top 10)
select ProductID,Productname,brand, Category, Round(sum(netamount),2) as Total_revenue
from sales_data
join products_information using(ProductID)
group by ProductID,productname, brand
order by Total_revenue Desc
limit 10;

#Repeat Customers
SELECT
    CustomerID,
    COUNT(DISTINCT OrderID) AS order_count
FROM sales_data
GROUP BY CustomerID
HAVING COUNT(DISTINCT OrderID) > 1
ORDER BY order_count DESC;


#Promotion vs no-promotion performance
select case 
when PromotionID is null then 'No Promotion'
else 'Promotion Used'
end as promotion_status,
count(orderID) as cn,
round(sum(netamount),2) as revenue,
round(sum(grossamount),2) as sales,
round(sum(discountamount),2) as discount
from sales_data
group by promotion_status;

#Performance by promotion type
select promotiontype, discountpercent, round(sum(netamount),0) as revenue
from promotions_information
join sales_data using (promotionID)
group by promotiontype, discountpercent
order by promotiontype asc, discountpercent; 

#Payment Method Analysis - most frequently used method and revenue generated 
select paymentmethod, count(orderID) as cn, round(sum(netamount),2) as revenue
from payments_information
join sales_data using (paymentID)
group by paymentmethod

'''Advanced Analysis'''

# rank product according to revenue
Select productID, productname,brand, category rank() over (order by sum(netamount) desc) as rn
from sales_Data
group by productID; 

#highest-revenue order for every customer
with cte as(select customerID, orderID, netamount, row_number() over (partition by customerID order by netamount desc) as rn
from sales_data)
select customerID, orderID, netamount from cte where rn = 1 ; 

#customers segmented based on their order frequency
With cte as (select customerID, count(distinct orderID) as cn, round(sum(netamount),2) as revenue 
from sales_data
group by customerID)
select *, case 
when cn = 1 then 'one-time'
when cn between 2 and 10 then 'repeat'
else 'frequent'
end customer_status
from cte;

#month-over-month growth
with cte as(select date_format(orderdatetime, '%Y-%m') as month, round(sum(netamount),2) as revenue
from sales_data
group by month
order by month), cte2 as (select *, lag(revenue) over (order by month) as pre_month
from cte)
select *, Round((revenue-pre_month)*100/pre_month,2) as growth
from cte2;

#Percentage of total revenue each category contribute
select category, round(sum(netamount),2) as revenue, (select round(sum(netamount),2) from sales_data) as total_revenue,
round(sum(netamount)*100/(select sum(netamount) from sales_data),2) as percent
from products_information
join sales_data using (productID)
group by category;

#Top Product Within Each Category
with cte as(select category, productID, productname, round(sum(netamount),2) as revenue
from products_information
join sales_data using (productID)
group by productID, productname,category),
cte2 as(select*, rank() over (partition by category order by revenue desc) as ranks
from cte) select * from cte2 where ranks=1;
