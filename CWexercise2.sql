/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT categories.Name AS "Cat Nam", products.Name AS "Prod Name"
FROM products LEFT JOIN categories
  ON products.CategoryID = categories.CategoryID;
  
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.price, reviews.rating
FROM products LEFT JOIN reviews
  ON products.ProductID = reviews.ProductID
  WHERE reviews.rating = 5;
  
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.quantity)
FROM employees INNER JOIN sales
  ON employees.EmployeeID = sales.EmployeeID
  GROUP BY employees.EmployeeID
  ORDER BY SUM(sales.quantity) DESC;

-- Show most only...
  SELECT employees.FirstName, employees.LastName, SUM(sales.quantity)
  FROM employees INNER JOIN sales
  ON employees.EmployeeID = sales.EmployeeID
  GROUP BY employees.EmployeeID
  HAVING SUM(sales.quantity) = 
       (SELECT SUM(sales.Quantity)
         FROM employees INNER JOIN sales
          ON employees.EmployeeID = sales.EmployeeID
          GROUP BY employees.EmployeeID
          ORDER BY SUM(Quantity) DESC
          LIMIT 1);
  
-- Limit to MOST SOLD QUANTITY  
SELECT employees.FirstName, employees.LastName, SUM(sales.quantity)
FROM employees INNER JOIN sales
  ON employees.EmployeeID = sales.EmployeeID
  GROUP BY employees.EmployeeID
  ORDER BY SUM(sales.quantity) DESC;
  
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT categories.name, departments.Name
FROM categories LEFT JOIN departments
  ON categories.DepartmentID = departments.DepartmentID
   WHERE categories.name = "Appliances" OR categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.name, sum(sales.Quantity) AS "Total Quantity", sum(sales.PricePerUnit * sales.Quantity) AS "Big Bucks"
FROM products INNER JOIN sales
  ON products.ProductID = sales.ProductID
  WHERE products.Name LIKE "%Hotel Cal%"
  GROUP BY products.ProductID;
  
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.Reviewer, reviews.Comment, reviews.Rating
FROM products INNER JOIN reviews
 ON products.ProductID = reviews.ProductID
 WHERE products.Name LIKE "Visio%" AND reviews.rating = 1;
-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity)
FROM employees INNER JOIN sales
  ON employees.EmployeeID = sales.EmployeeID
  INNER JOIN products
  ON sales.ProductID = products.ProductID
  GROUP BY employees.EmployeeID, products.ProductID
  ORDER BY products.name DESC;
