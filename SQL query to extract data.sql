use bikestores;
select
	ord.order_id,
	concat(cus.first_name,' ', cus.last_name) as "Customers",
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) AS 'total units',
	sum(ite.quantity*ite.list_price) AS 'revenue',
    pro.product_name,
    cat.category_name,
    sto.store_name,
    concat(sta.first_name," ", sta.last_name) as 'Sales rep'
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id	= cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON pro.product_id =  ite.product_id
JOIN production.categories cat
ON cat.category_id = pro.category_id
JOIN sales.stores sto
ON sto.store_id = ord.store_id
JOIN sales.staffs sta
ON sta.store_id = sto.store_id 
group by
ord.order_id,
concat(cus.first_name,' ', cus.last_name),
cus.city,
cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
sto.store_name,
concat(sta.first_name," ", sta.last_name)