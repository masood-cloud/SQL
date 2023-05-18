use SuperStoreOrders

Select * From OnlineRetail

# What are the most frequently product purchased?
#(understand which products are in high demand and potentially drive marketing strategies around them)

select StockCode, Description, SUM(Quantity) as TotalQuantity
from OnlineRetail
Group by StockCode, Description
Order by TotalQuantity Desc


# What are the Sales Analyze Trends?
#(identify peak sales periods, seasonality patterns, or any notable trends that may impact your business)

SELECT DATEPART(YEAR, InvoiceDate) AS [Year], DATEPART(MONTH, InvoiceDate) AS [Month], SUM(UnitPrice * Quantity) AS TotalSales
FROM OnlineRetail
GROUP BY DATEPART(YEAR, InvoiceDate), DATEPART(MONTH, InvoiceDate)
ORDER BY [Year], [Month];


#what is Customer Behavior?
(explore metrics such as customer loyalty, repeat purchases, 
or customer lifetime value to understand your customer base better.)

Select CustomerID, COUNT(distinct InvoiceNo) as TotalOrders
from OnlineRetail
Group by CustomerID
Order by TotalOrders Desc

#what are the sales country wise ?
(insights into your international market presence and identify regions where your products are most popular.)

Select Country, COUNT (distinct CustomerID) as TotalCustomer
from OnlineRetail
Group by Country
Order by TotalCustomer Desc


#what are pricing patterns and their impact on sales and profitability?
(examine the UnitPrice column and assess the relationship between price, quantity sold, and revenue generated)

Select StockCode, Description, AVG(UnitPrice) AS AveragePrice
From OnlineRetail
Group by StockCode, Description
Order by AveragePrice Desc

#(Utilize customer and transactional data to segment your market based on customer demographics or purchase behavior. 
#This can help tailor marketing campaigns and promotions to specific customer segments.)

SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM OnlineRetail
GROUP BY CustomerID
Order by TotalOrders desc


#Group customers based on their first purchase date and analyze their behavior and value over time. 
#This allows you to understand customer retention, average customer lifetime, and revenue generated from different cohorts.

SELECT YEAR(InvoiceDate) AS CohortYear,
       MONTH(InvoiceDate) AS CohortMonth,
       COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM OnlineRetail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY CohortYear, CohortMonth;

