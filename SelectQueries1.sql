/*use food_order_app database */
use food_order_app;

/* 1. Display all distinct cuisine names. */
SELECT DISTINCT name
FROM cuisine;
/* 2. Display description of 'Cake' category. */
SELECT description
FROM category
WHERE category like '%cake%';
/* 3. Select all restaurants where restaurant names ends with 'Junction'. */
SELECT name 
FROM restaurants 
WHERE name like '%Junction';
/* 4. Display details of all vegeterian fooditems. */
SELECT name, description
FROM fooditem
WHERE isVeg = 1;
/* 5. Retrieve all menu items with food items that have a price equal to or less than $10. */
SELECT *
FROM menu_items
WHERE fooditemPrice <= 10
/* 6.Retrieve cartId having the maximum number of food items. */
SELECT MAX(unitsInCart)
FROM cart_items
GROUP BY cartId
ORDER BY unitsInCart DESC
LIMIT 1;
/* 7. Retrieve all the shipping details where emailId contains 'doe'. */
SELECT shippingAddress
FROM shipping_details
WHERE emailId LIKE '%doe%'
/* 8. Retrieve the order with the highest price. */
 SELECT MAX(orderTotalPrice)
 from `order`
/* 9. Retrieve the most recently updated order. */
SELECT *
FROM `order`
ORDER BY updatedTs DESC
LIMIT 1;
/* 10. How many total units of food items were purchased in orderId 1? */
SELECT SUM(unitsInCart) 
FROM cart_items
WHERE orderId = 1
