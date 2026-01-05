/* use food_order_app database */
use food_order_app;

/* 1. Retrieve number of fooditems for each cuisine */
SELECT cuisineId, COUNT(*) as fooditem_count
FROM fooditem
GROUP BY cuisineId
/* 2. Retrieve category names in the order of highest to lowest no. of fooditems */
SELECT c.name, COUNT(f.id) as fooditem_count
FROM category c
JOIN fooditem f ON c.id = f.categoryId
GROUP BY c.name
ORDER BY fooditem_count DESC;
/* 3. Retrieve cuisine name as CuisineName, fooditem name as name FoodItemName 
and description as Description of all the fooditems belonging to 'Italian' cuisine */
SELECT f.name as FoodItemName, f.description as Description, f.cuisineId as CuisineName
FROM fooditem f
JOIN cuisine c ON f.cuisineId = c.id
WHERE c.name = 'Italian';
/* 4. Retrieve details of food items, including their name, vegetarian status,
 and cuisine name, for only those food items that are vegetarian. */
SELECT f.name as FoodItemName, f.description as Description, c.name as CuisineName, f.isVeg as IsVegetarian
FROM fooditem f
JOIN cuisine c ON f.cuisineId = c.id
WHERE f.isVeg = 1;
/* 5. Retrieve the details of users who have items in their cart 
along with the total order amount */
SELECT ci.userId, SUM(ci.unitsInCart) as totalItems, o.orderTotalPrice
FROM cart_items ci
JOIN `order` o ON ci.cartId = o.cartId
GROUP BY ci.userId, o.orderTotalPrice;

