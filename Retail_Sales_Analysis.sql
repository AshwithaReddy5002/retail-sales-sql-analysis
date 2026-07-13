/* ============================================================
   RETAIL SALES ANALYSIS - SQL Server
   A retail sales analytics project covering schema design,
   data population, and business-question-driven analysis.
   ============================================================ */


/* ============================================================
   SECTION 1: DATABASE & SCHEMA SETUP
   ============================================================ */

CREATE DATABASE RetailSalesAnalysis
GO
USE RetailSalesAnalysis
GO

CREATE TABLE Category(
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(255)
)

CREATE TABLE Products(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(255),
    CategoryID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255),
    Phone BIGINT,
    Email VARCHAR(255) UNIQUE,
    City VARCHAR(255),
    JoinDate DATE
)

CREATE TABLE Stores(
    StoreID INT PRIMARY KEY IDENTITY(1,1),
    StoreName VARCHAR(255),
    Branch VARCHAR(255),
    City VARCHAR(255),
    ManagerName VARCHAR(255)
)

CREATE TABLE Sales(
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    StoreID INT,
    SaleDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
)

CREATE TABLE SaleItems(
    SaleItemID INT PRIMARY KEY IDENTITY(1,1),
    SaleID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)


/* ============================================================
   SECTION 2: SAMPLE DATA
   ============================================================ */

INSERT INTO Category (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Food&Beverages'),
('Home&Kitchen'),
('Sports')

INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity) VALUES
('Samsung TV', 1, 45000.00, 50),
('Nokia 105', 1, 1500.00, 200),
('Mens Shirt', 2, 799.00, 150),
('Womens Kurta', 2, 999.00, 120),
('Basmati Rice 5Kg', 3, 450.00, 300),
('Olive Oil 1L', 3, 650.00, 180),
('Non-stick Pan', 4, 1299.00, 90),
('Dinner Set', 4, 2499.00, 60),
('Cricket Bat', 5, 1899.00, 75),
('Football', 5, 699.00, 100)

INSERT INTO Customers (Name, Phone, Email, City, JoinDate) VALUES
('Ravi Kumar', 9848012345, 'ravi@gmail.com', 'Hyderabad', '2023-01-15'),
('Priya Sharma', 9848023456, 'priya@gmail.com', 'Hyderabad', '2023-02-20'),
('Ajay Reddy', 9848034567, 'ajay@gmail.com', 'Secunderabad', '2023-03-10'),
('Sneha Patel', 9848045678, 'sneha@gmail.com', 'Warangal', '2023-04-05'),
('Kiran Rao', 9848056789, 'kiran@gmail.com', 'Hyderabad', '2023-05-18'),
('Divya Nair', 9848067890, 'divya@gmail.com', 'Nizamabad', '2023-06-22'),
('Suresh Babu', 9848078901, 'suresh@gmail.com', 'Hyderabad', '2023-07-30'),
('Anita Singh', 9848089012, 'anita@gmail.com', 'Karimnagar', '2023-08-14'),
('Rahul Verma', 9848090123, 'rahul@gmail.com', 'Hyderabad', '2023-09-09'),
('Meena Iyer', 9848001234, 'meena@gmail.com', 'Secunderabad', '2023-10-25')

INSERT INTO Stores (StoreName, Branch, City, ManagerName) VALUES
('RetailMart', 'Ameerpet', 'Hyderabad', 'Venkat Rao'),
('RetailMart', 'Kukatpally', 'Hyderabad', 'Lakshmi Devi'),
('RetailMart', 'Warangal Central', 'Warangal', 'Sunil Kumar'),
('RetailMart', 'Secunderabad', 'Secunderabad', 'Fatima Begum'),
('RetailMart', 'Nizamabad', 'Nizamabad', 'Raju Naik')

INSERT INTO Sales (CustomerID, StoreID, SaleDate, TotalAmount) VALUES
(1, 1, '2024-01-05', 45799.00),
(2, 1, '2024-01-10', 1499.00),
(3, 2, '2024-01-15', 2098.00),
(4, 3, '2024-02-01', 1299.00),
(5, 1, '2024-02-14', 46499.00),
(6, 4, '2024-02-20', 999.00),
(7, 2, '2024-03-05', 3798.00),
(8, 5, '2024-03-18', 2499.00),
(9, 1, '2024-04-02', 1349.00),
(10, 3, '2024-04-22', 5997.00),
(1, 2, '2024-05-10', 2798.00),
(3, 1, '2024-05-25', 1299.00),
(5, 4, '2024-06-08', 699.00),
(7, 3, '2024-06-15', 4498.00),
(2, 5, '2024-06-28', 1898.00)

INSERT INTO SaleItems (SaleID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 45000.00),
(1, 3, 1, 799.00),
(2, 2, 1, 1500.00),
(3, 3, 1, 799.00),
(3, 4, 1, 999.00),
(4, 7, 1, 1299.00),
(5, 1, 1, 45000.00),
(5, 2, 1, 1500.00),
(6, 4, 1, 999.00),
(7, 8, 1, 2499.00),
(7, 7, 1, 1299.00),
(8, 8, 1, 2499.00),
(9, 6, 2, 650.00),
(10, 9, 1, 1899.00),
(10, 10, 6, 699.00),
(11, 3, 2, 799.00),
(11, 5, 2, 450.00),
(12, 7, 1, 1299.00),
(13, 10, 1, 699.00),
(14, 9, 1, 1899.00),
(14, 6, 4, 650.00),
(15, 3, 1, 799.00),
(15, 5, 2, 450.00),
(15, 2, 1, 1500.00)


/* ============================================================
   SECTION 3: BUSINESS QUESTIONS & ANALYSIS
   ============================================================ */

-- --------------------------------------------------------------
-- Q1. Which store is bringing in the most total revenue?
-- --------------------------------------------------------------
SELECT Branch, SUM(TotalAmount) AS TotalRevenue
FROM Stores
JOIN Sales ON Sales.StoreID = Stores.StoreID
GROUP BY Branch
ORDER BY TotalRevenue DESC

-- Insight: Ameerpet is the top-performing branch with ₹96,445 in revenue,
-- while Secunderabad is the lowest at ₹1,698 — a ~56x gap, suggesting
-- serious underperformance at the weaker branches.
-- Recommendation: Investigate what makes Ameerpet successful (location,
-- footfall, staffing, local demand) and assess whether those factors can
-- be replicated at Secunderabad and Nizamabad. If underperformance persists
-- despite intervention, consider whether these branches are worth the cost
-- of keeping open, or whether resources should be reallocated toward
-- strengthening Ameerpet and Warangal Central further.


-- --------------------------------------------------------------
-- Q2. Which product category generates the most revenue?
-- --------------------------------------------------------------
SELECT CategoryName, SUM(Quantity * UnitPrice) AS Revenue
FROM Products
JOIN Category ON Products.CategoryID = Category.CategoryID
JOIN SaleItems ON Products.ProductID = SaleItems.ProductID
GROUP BY CategoryName
ORDER BY Revenue DESC

-- Insight: Electronics is the top revenue category with ₹94,500, over 10x
-- the second-highest category. This concentration comes from a few
-- high-ticket items (e.g. Samsung TV at ₹45,000) rather than broad volume
-- across the category, making Electronics revenue somewhat fragile.
-- Recommendation: Maintain strong stock availability for key high-value
-- electronics, and consider diversifying with mid-priced electronics to
-- reduce dependency on a small number of flagship products.


-- --------------------------------------------------------------
-- Q3. Who are the top 5 customers by total spend?
-- --------------------------------------------------------------
SELECT TOP 5 Name, SUM(TotalAmount) AS Total_Spend
FROM Customers
JOIN Sales ON Sales.CustomerID = Customers.CustomerID
GROUP BY Name
ORDER BY Total_Spend DESC

-- Insight: Ravi Kumar (₹48,597) and Kiran Rao (₹47,198) are the top two
-- spenders, far ahead of the rest. There's a sharp drop-off after them —
-- the third-highest customer spent only ₹8,296, less than a fifth of
-- Ravi Kumar's total — showing high-value relationships are concentrated
-- in just two customers.
-- Recommendation: Prioritize retaining Ravi Kumar and Kiran Rao through
-- loyalty perks or personalized offers, while working to grow mid-tier
-- customers like Suresh Babu into higher spenders to reduce dependence
-- on just two people.


-- --------------------------------------------------------------
-- Q4. Which products sell the most by quantity vs. by revenue?
-- --------------------------------------------------------------
SELECT ProductName, SUM(Quantity) AS Total_Units
FROM SaleItems
JOIN Products ON Products.ProductID = SaleItems.ProductID
GROUP BY ProductName
ORDER BY Total_Units DESC

SELECT ProductName, SUM(Quantity * UnitPrice) AS Total_Revenue
FROM SaleItems
JOIN Products ON Products.ProductID = SaleItems.ProductID
GROUP BY ProductName
ORDER BY Total_Revenue DESC

-- Insight: Samsung TV sells the fewest units (2) of all products, yet
-- generates the highest revenue by far (₹90,000). This happens because
-- it's priced at ₹45,000 per unit, so a single sale has a massive revenue
-- impact — unlike low-priced, high-volume items like Football, which sold
-- 7 units but generated only ₹4,893. Unit-sold count alone is a misleading
-- measure of a product's true business importance.
-- Recommendation: Evaluate product performance and inventory priorities
-- based on revenue contribution, not just sales volume. High-value,
-- low-volume items like the Samsung TV deserve dedicated stock monitoring,
-- since losing even one or two sales significantly impacts overall revenue.


-- --------------------------------------------------------------
-- Q5. Which stores have total revenue below ₹10,000?
-- --------------------------------------------------------------
SELECT Branch, SUM(TotalAmount) AS Total_Revenue
FROM Stores
JOIN Sales ON Stores.StoreID = Sales.StoreID
GROUP BY Branch
HAVING SUM(TotalAmount) < 10000

-- Insight: 3 out of 5 branches (Kukatpally, Nizamabad, Secunderabad)
-- generate less than ₹10,000 in total revenue — well below the top
-- performers (Ameerpet: ₹96,445, Warangal: ₹11,794). This means 60% of
-- branches are significantly underperforming.
-- Recommendation: Prioritize a performance review across these 3 branches
-- specifically, rather than treating store performance as evenly
-- distributed across the network.


-- --------------------------------------------------------------
-- Q6. Which customers spent more than the average customer?
-- --------------------------------------------------------------
SELECT Name, SUM(TotalAmount) AS CustomerTotal
FROM Customers
JOIN Sales ON Sales.CustomerID = Customers.CustomerID
GROUP BY Name
HAVING SUM(TotalAmount) > (
    SELECT AVG(CustomerTotal)
    FROM (
        SELECT CustomerID, SUM(TotalAmount) AS CustomerTotal
        FROM Sales
        GROUP BY CustomerID
    ) AS CustomerTotals
)

-- Insight: Only 2 customers — Ravi Kumar (₹48,597) and Kiran Rao (₹47,198)
-- — spent more than the average customer spend of ₹22,697. Just 40% of
-- customers exceed the average, and the average itself is being pulled
-- upward almost entirely by these 2 top spenders — without them, the
-- typical customer spends far less (~₹5,900 for the remaining 3). This
-- confirms revenue is concentrated in a small group of high-value
-- customers rather than spread evenly across the customer base.
-- Recommendation: Prioritize retention for Ravi Kumar and Kiran Rao
-- specifically (e.g. personalized discounts, loyalty perks), since they
-- anchor a disproportionate share of revenue. Separately, run targeted
-- campaigns to grow spending among the remaining customers, to reduce
-- the business's dependence on just 2 individuals.


-- --------------------------------------------------------------
-- Q7. Rank each product by revenue, within its own category.
-- --------------------------------------------------------------
SELECT
    ProductName,
    CategoryName,
    SUM(Quantity * UnitPrice) AS TotalAmount,
    RANK() OVER (
        PARTITION BY CategoryName
        ORDER BY SUM(Quantity * UnitPrice) DESC
    ) AS Revenue_Rank
FROM Products
JOIN Category ON Products.CategoryID = Category.CategoryID
JOIN SaleItems ON SaleItems.ProductID = Products.ProductID
GROUP BY CategoryName, ProductName
ORDER BY CategoryName, Revenue_Rank

-- Insight: Within Electronics, Samsung TV (₹90,000) outranks Nokia 105
-- (₹4,500) by roughly 20x — by far the widest #1 vs #2 gap of any
-- category. Every other category (Clothing, Food&Beverages,
-- Home&Kitchen, Sports) has a much more even split between its top 2
-- products (1.3x–2.2x), meaning Electronics is uniquely reliant on a
-- single flagship product. If Samsung TV sales dip for any reason, the
-- entire category's revenue would collapse far more severely than any
-- other category would from losing its top item.
-- Recommendation: Treat Samsung TV as a critical, high-risk revenue
-- driver — ensure consistent stock and monitor it closely — while also
-- working to build a stronger #2 or #3 electronics product, so the
-- category isn't entirely dependent on one item the way it currently is.


/* ============================================================
   SECTION 4: REUSABLE VIEWS
   ============================================================ */

-- Purpose: Reusable view for checking total revenue per branch on demand,
-- without rewriting the JOIN + GROUP BY query each time. Useful for
-- recurring reporting (e.g. weekly/monthly store performance checks).
GO
CREATE VIEW Total_Revenue_Per_Branch AS
SELECT Branch, SUM(TotalAmount) AS Total_Revenue
FROM Stores
JOIN Sales ON Sales.StoreID = Stores.StoreID
GROUP BY Branch
GO

-- Usage:
SELECT * FROM Total_Revenue_Per_Branch
