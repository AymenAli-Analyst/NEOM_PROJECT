SELECT * FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data]

SELECT DISTINCT * FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data];


SELECT 
    UPPER(Project_Name) AS Project_Name,
    Company,
    Sector
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data];

SELECT 
    Project_Name,
    COALESCE(Employees, (SELECT AVG(Employees) FROM
    [dbo].[NEOM_Saudi_Vision2030_Project_Data]))
    AS Employees_Cleaned
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data];

SELECT 
    Project_Name,
    COALESCE(Revenue_Million_SAR, (SELECT AVG(Revenue_Million_SAR)
    FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data]))
    AS Revenue_Cleaned
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data];

SELECT 
    Project_Name,
    CASE 
        WHEN City = 'Unknown' OR City IS NULL THEN 'Not Specified' 
        ELSE City 
    END AS City_Cleaned
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data];

SELECT 
    SUM(Revenue_Million_SAR) AS Total_Revenue,
    SUM(Expenses_Million_SAR) AS Total_Expenses,
    SUM(Revenue_Million_SAR) - SUM(Expenses_Million_SAR) AS Total_Profit
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data];

SELECT 
    Company,
    SUM(Revenue_Million_SAR) AS Total_Revenue,
    SUM(Revenue_Million_SAR) - SUM(Expenses_Million_SAR) AS Profit
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data]
GROUP BY Company
ORDER BY Profit DESC;

SELECT 
    City,
    COUNT(*) AS Number_of_Projects,
    SUM(Revenue_Million_SAR) AS Total_Revenue
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data]
GROUP BY City
ORDER BY Total_Revenue DESC;

SELECT 
    Year,
    SUM(Revenue_Million_SAR) AS Annual_Revenue,
    AVG(Employees) AS Avg_Employees
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data]
GROUP BY Year
ORDER BY Year ASC;

SELECT 
    Project_Name, 
    Revenue_Million_SAR, 
    Expenses_Million_SAR,
    (Revenue_Million_SAR - Expenses_Million_SAR) AS Profit
FROM [dbo].[NEOM_Saudi_Vision2030_Project_Data]
WHERE Sector = 'Construction' AND City = 'Riyadh';
