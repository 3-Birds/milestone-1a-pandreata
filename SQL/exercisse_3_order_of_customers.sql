/*
Question 1: Total Orders Per Customer

Write a query to display the total number of orders placed by each customer, 
along with their name and the date they joined. Sort the results by the total number of orders in descending order.
*/



/*
Question 2: Rank Customers by Spending

For each customer, calculate their total spending (sum of the total amounts from the `Orders` table) 
and rank them by total spending within their respective country. 
Use a **window function** to rank the customers.
*/

SELECT CustomersNew.customer_name, customersnew.join_date, COUNT(OrdersNew.Order_ID) as Number_of_orders
FROM customersnew
JOIN ordersnew
ON customersnew.customer_id=ordersnew.customer_id
GROUP BY customersnew.customer_name, customersnew.join_date
ORDER BY Number_of_orders DESC
;

SELECT 
CustomersNew.customer_name, 
customersnew.country, 
SUM(ordersitemnew.quantity*ordersitemnew.price) as Total_Spending
RANK () OVER (PARTITION BY customersnew.country ORDER BY SUM(ordersitemnew.quantity*ordersitemnew.price)) AS SpendingRank
FROM customersnew
JOIN ordersnew
ON customersnew.customer_id=ordersnew.customer_id
JOIN orderitemsnew
ON ordersnew.order_id=orderitemsnew.order_id
GROUP BY CustomersNew.customer_name, customersnew.country, SpendingRank
;


