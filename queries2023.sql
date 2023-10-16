-- SQL queries are writtin in CAPS - ALWAYS
SELECT * FROM 

-- Make a list with productnames and prices, sort on price DESC
-- ASC is the default and is optional
SELECT name, price FROM products ORDER BY price

-- make a list from the producs with the most recents on top
SELECT * FROM products ORDER BY id DESC

-- select all products from the category 'voedsel'
-- if the result is empty no error, just blank tables
SELECT * FROM products WHERE category = 'voedsel'

-- select all products that cost more then 10 EURO
SELECT * FROM products WHERE price > 10;

-- select all products from category books and supplier 'prometheus'
SELECT * FROM products 
WHERE category = 'boek' 
AND company = 'prometheus';

-- select all products where no supplier is provider...hence the supplier is emtpy
-- IS NULL is one command... ORDER BY is aldo two words ;)
SELECT * FROM products WHERE company IS NULL

-- Select all products where the company is not unilever
SELECT * FROM products WHERE NOT company='unilever'

# Using the `NOT IN` operator:
SELECT * FROM products WHERE company NOT IN ('unilever');

# Using the `<>` operator:
SELECT * FROM products WHERE company <> 'unilever';

# Using the `!=` operator:
SELECT * FROM products WHERE company != 'unilever';

# Using the `SUBQUERY` operator:
SELECT * FROM products WHERE company 
NOT IN (SELECT company FROM companies WHERE name = 'Unilever');

-- Basic for all search functions - the % character is used as
-- a wildcard to select whatever comes first or after the string (unil)
SELECT * FROM product WHERE 
company LIKE '%unil%'
ORDER BY company

-- ALIASSEN - are used to mitigate special chars in mysql formulas
SELECT AVG(price) AS average FROM products

-- count the number of products of the unilever company
SELECT COUNT(*) AS totalunilever FROM products
WHERE company = 'unilever';

-- show me the most expensive product in our database AND the cheapest
SELECT 
MAX(price) AS expensive,
MIN(price) AS cheapest
FROM products

-- DISTINCT make a list of all companies but show me the company once
SELECT DISTINCT company FROM products;

-- Return price vat included as extra alias column
SELECT name, price, price + (price * vat/100) AS pricevat FROM products;

-- Select all products that are already available
SELECT * FROM products WHERE releasedate < CURRENT_DATE

-- behind the scenes, where mysql transforms your dates to epoch and makes the calculations
10/10/2023 and 12/10/2023
1696896000.0 (epoch)
1697068800.0 (epoch)

SELECT * FROM products WHERE 1697068800 < 1696896000