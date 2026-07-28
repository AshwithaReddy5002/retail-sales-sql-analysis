# Retail Sales Analysis (SQL Server)

## Overview
This project analyzes retail sales data for a 5-branch retail chain (RetailMart), covering customers, products, categories, stores, and transactions. Using SQL Server, the database was designed from scratch, populated with sample data, and queried to answer real business questions — each paired with a data-driven insight and recommendation.

## Database Structure
Six related tables: `Category`, `Products`, `Customers`, `Stores`, `Sales`, and `SaleItems`, connected through foreign keys (`Sales` and `SaleItems` act as the transactional core, joined out to descriptive tables for readable reporting).

---

## Key Findings

### 1. Store Performance — Revenue Is Heavily Concentrated in One Branch
Ameerpet is the top-performing branch with ₹96,445 in revenue, while Secunderabad is the lowest at ₹1,698 — a ~56x gap, suggesting serious underperformance at the weaker branches.
**Recommendation:** Investigate what makes Ameerpet successful (location, footfall, staffing, local demand) and assess whether those factors can be replicated at Secunderabad and Nizamabad. If underperformance persists, consider reallocating resources toward the stronger branches.

### 2. Category Revenue — Electronics Dominates, But Is Fragile
Electronics is the top revenue category with ₹94,500, over 10x the second-highest category. This concentration comes from a few high-ticket items (e.g. Samsung TV at ₹45,000) rather than broad volume across the category.
**Recommendation:** Maintain strong stock availability for key high-value electronics, and diversify with mid-priced electronics to reduce dependency on a small number of flagship products.

### 3. Top Customers — Revenue Relies on Just Two Individuals
Ravi Kumar (₹48,597) and Kiran Rao (₹47,198) are the top two spenders, far ahead of the rest — the third-highest customer spent only ₹8,296.
**Recommendation:** Prioritize retaining Ravi Kumar and Kiran Rao through loyalty perks or personalized offers, while working to grow mid-tier customers into higher spenders.

### 4. Product Performance — Units Sold ≠ Revenue Generated
Samsung TV sells the fewest units (2) of all products, yet generates the highest revenue by far (₹90,000), since it's priced at ₹45,000 per unit. Low-priced, high-volume items like Football (7 units sold) generated only ₹4,893.
**Recommendation:** Evaluate product performance and inventory priorities based on revenue contribution, not just sales volume.

### 5. Underperforming Branches — 60% Fall Below ₹10,000

3 of 5 branches (Kukatpally, Nizamabad, Secunderabad) generate less than ₹10,000 in total revenue — well below the top performers.

**Recommendation:** Prioritize a performance review across these three branches rather than treating store performance as evenly distributed.

### 6. Customer Spend Distribution — Only 40% Exceed the Average
Only Ravi Kumar and Kiran Rao spent more than the average customer spend (₹22,697) — an average pulled upward almost entirely by these two. The typical remaining customer spends closer to ₹5,900.
**Recommendation:** Prioritize retention for the top 2 customers while running targeted campaigns to grow spending among the rest, reducing dependence on just two individuals.

### 7. Product Ranking by Category — Electronics Has the Widest Leader Gap
Within Electronics, Samsung TV (₹90,000) outranks Nokia 105 (₹4,500) by ~20x — the widest #1 vs #2 gap of any category. Every other category has a much more even split (1.3x–2.2x) between its top 2 products.
**Recommendation:** Treat Samsung TV as a critical, high-risk revenue driver requiring close monitoring, while building a stronger #2 or #3 electronics product to reduce single-item dependency.

---

## SQL Skills Demonstrated
- Multi-table JOINs (2–4 tables per query)
- Aggregate functions (`SUM`, `AVG`) with `GROUP BY`
- Filtering grouped results with `HAVING`
- Subqueries (nested queries for average-based comparisons)
- Window functions (`RANK() OVER (PARTITION BY ... ORDER BY ...)`)
- Views for reusable, on-demand reporting

## Files
- `Retail_Sales_Analysis.sql` — full schema, sample data, all business-question queries, insights, and views
- `README.md` — this summary
