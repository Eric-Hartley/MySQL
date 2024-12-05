/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select products.Name,categories.Name from products
 inner join categories on categories.CategoryID = products.CategoryID
 where categories.name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.Name, products.Price, reviews.Rating from products
 inner join reviews on reviews.ProductID = products.ProductID
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, Sum(s.Quantity) as total from sales as s
inner join employees on employees.EmployeeID = s.EmployeeID
group by employees.EmployeeID
order by total desc
limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name as Department, categories.Name as Category from departments
inner join categories on categories.DepartmentID = departments.DepartmentID
where categories.Name = "Appliances" or categories.Name = "Games";
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, Sum(sales.Quantity) as Copies_Sold, (Sum(sales.Quantity * products.Price)) as Total_Sales from products
inner join sales on sales.ProductID = products.ProductID
where products.Name = "Eagles: Hotel California"
group by products.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.Name, reviews.Rating, reviews.Comment as Review from products
inner join reviews on products.ProductID = reviews.ProductID
where Name = "Visio TV" and reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select employees.EmployeeID, employees.LastName, employees.FirstName, products.Name as Product, sales.Quantity from employees
left join sales on employees.EmployeeID = sales.EmployeeID
right join products on sales.ProductID = products.ProductID
where employees.EmployeeID is not null
order by employees.LastName asc; 