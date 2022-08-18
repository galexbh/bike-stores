---TABLA EMPLEADO---
SELECT staff_id, CONCAT(first_name,' ',last_name) Nombre, email FROM SALES.STAFFS;

--TABLA CLIENTE---
SELECT customer_id, CONCAT(first_name,' ',last_name) Nombre, email FROM SALES.customers;

---TABLA PRODUCTOS---
SELECT product_id, product_name,production.brands.brand_name, categories.category_name, model_year FROM PRODUCTION.products INNER JOIN production.brands ON production.products.brand_id =  production.brands.brand_id INNER JOIN production.categories ON products.category_id = categories.category_id;

---TABLA Tienda---
SELECT store_id, store_name, CONCAT(street, ' - ',city, ' - ', state ) Direccion FROM sales.stores;

---TABLA TIEMPO---
SELECT CONVERT(VARCHAR, order_date) Id_Time,DATEPART(YEAR, order_date) Anyo, DATEPART(MONTH, order_date) MES,
DATEPART(QUARTER, order_date) TRIMESTRE, 
		CASE
         WHEN Month(order_date) >= 1
              AND Month(order_date) <= 6 THEN '1'
         WHEN Month(order_date) >= 7
              AND Month(order_date) <= 12 THEN '2' END SEMESTRE,
DATENAME (WEEKDAY, order_date) Dia_Semana FROM sales.orders; 

---TABLA HECHOS---
SELECT sales.orders.customer_id, sales.orders.staff_id, sales.orders.store_id, production.products.product_id,
CONVERT(DATE,order_date) Id_Tiemp,  SUM(sales.order_items.quantity*sales.order_items.list_price*(1-sales.order_items.discount)) Total_Venta_Producto
FROM production.products INNER JOIN sales.order_items ON production.products.product_id = sales.order_items.product_id INNER JOIN
sales.orders ON sales.order_items.order_id = sales.orders.order_id INNER JOIN sales.customers ON sales.orders.customer_id= sales.customers.customer_id
INNER JOIN sales.staffs ON sales.staffs.staff_id = sales.orders.staff_id INNER JOIN sales.stores ON sales.orders.store_id=sales.stores.store_id
Group By  sales.orders.staff_id,sales.orders.customer_id, sales.orders.store_id, production.products.product_id, order_date;