use project4_week4_sql;
select * from marketing_campaign;

UPDATE marketing_campaign
SET Education = CASE 
    WHEN Education = '2n Cycle' THEN NULL 
    ELSE Education 
END;

SELECT *
FROM marketing_campaign;

#-----------------------------CLEANING_START-----------------------------#
delete from marketing_campaign where Education is null;

SELECT *
FROM marketing_campaign;

ALTER TABLE marketing_campaign
DROP COLUMN Kidhome;

ALTER TABLE marketing_campaign
DROP COLUMN Teenhome;

ALTER TABLE marketing_campaign
DROP COLUMN AcceptedCmp3;

ALTER TABLE marketing_campaign
DROP COLUMN AcceptedCmp4;

ALTER TABLE marketing_campaign
DROP COLUMN AcceptedCmp5;

ALTER TABLE marketing_campaign
DROP COLUMN AcceptedCmp1;

ALTER TABLE marketing_campaign
DROP COLUMN AcceptedCmp2;

ALTER TABLE marketing_campaign
DROP COLUMN Complain;

ALTER TABLE marketing_campaign
DROP COLUMN Z_CostContact;

ALTER TABLE marketing_campaign
DROP COLUMN Z_Revenue;

ALTER TABLE marketing_campaign
DROP COLUMN Response;

ALTER TABLE marketing_campaign
rename column Amount_wines to Wine_products_spending;

ALTER TABLE marketing_campaign
rename column Amount_fruits to Fruits_products_spending;

ALTER TABLE marketing_campaign
rename column Amount_meat_products to Meat_products_spending;

ALTER TABLE marketing_campaign
rename column Amount_fish_products to Fish_products_spending;

ALTER TABLE marketing_campaign
rename column Amount_sweet_products to Sweet_products_spending;

SELECT *
FROM marketing_campaign;


DELETE FROM marketing_campaign
WHERE Marital_Status IS NULL;
   
alter table marketing_campaign
rename column NumDealsPurchases to Deals_Purchases;

alter table marketing_campaign
rename column NumWebPurchases to Web_Purchases;

alter table marketing_campaign
rename column NumCatalogPurchases to Catalog_Purchases;

alter table marketing_campaign
rename column NumStorePurchases to Store_Purchases;

alter table marketing_campaign
rename column NumWebVisitsMonth to Web_VisitsMonth;

alter table marketing_campaign
rename column MntGoldProds to Promotion_products;

UPDATE marketing_campaign
SET Education = CASE 
    WHEN Education = 'Graduation' THEN 'Bachelor'
    ELSE Education 
END;

UPDATE marketing_campaign
SET Marital_Status = CASE 
    WHEN Marital_Status = 'Alone' THEN 'Single'
    WHEN Marital_Status = 'Absurd' THEN 'Unspecified'
    WHEN Marital_Status = 'Together' THEN 'In_relationship'
    WHEN Marital_Status = 'YOLO' THEN 'Unspecified'  
    ELSE Marital_Status 
END;

SELECT *
FROM marketing_campaign;
#-----------------------------CLEANING_END----------------------------#



#-----------------------------H2 START----------------------------#
#-------------Table 1: Total Purchases Across Channels for Each Recency Segment ------------#
# This table shows the number of customers in each segment. 
#It will help you understand how many customers belong to each category (Very Recent, Recent, Older).

SELECT 
    RecencySegment,
    COUNT(ID) AS CustomerCount
FROM (
    SELECT 
        ID,
        Recency, 
        CASE 
            WHEN Recency <= 30 THEN 'Very Recent'
            WHEN Recency BETWEEN 31 AND 60 THEN 'Recent'
            ELSE 'Older'
        END AS RecencySegment
    FROM 
        marketing_campaign
) AS segmented_customers
GROUP BY 
    RecencySegment;

    
#-------------Table 2: Average and Total Purchases for Each Recency Segment ------------#
#This table provides insights into the average and total purchases for each customer segment, helping you analyze purchasing behavior.

SELECT 
    RecencySegment,
    AVG(Web_Purchases) AS AvgWebPurchases,
    AVG(Catalog_Purchases) AS AvgCatalogPurchases,
    AVG(Store_Purchases) AS AvgStorePurchases,
    SUM(Web_Purchases) AS TotalWebPurchases,
    SUM(Catalog_Purchases) AS TotalCatalogPurchases,
    SUM(Store_Purchases) AS TotalStorePurchases
FROM (
    SELECT 
        Recency, 
        CASE 
            WHEN Recency <= 30 THEN 'Very Recent'
            WHEN Recency BETWEEN 31 AND 60 THEN 'Recent'
            ELSE 'Older'
        END AS RecencySegment,
        Web_Purchases,
        Catalog_Purchases,
        Store_Purchases
    FROM 
        marketing_campaign
) AS segmented_customers
GROUP BY 
    RecencySegment;
    
    
#-------------Table 3: Total Purchases Across Channels for Each Recency Segment ------------#
#This table aggregates the total number of purchases made across different channels (Web, Catalog, and Store) for each customer segment.

SELECT 
    RecencySegment,
    SUM(Web_Purchases) AS TotalWebPurchases,
    SUM(Catalog_Purchases) AS TotalCatalogPurchases,
    SUM(Store_Purchases) AS TotalStorePurchases
FROM (
    SELECT 
        Recency, 
        CASE 
            WHEN Recency <= 30 THEN 'Very Recent'
            WHEN Recency BETWEEN 31 AND 60 THEN 'Recent'
            ELSE 'Older'
        END AS RecencySegment,
        Web_Purchases,
        Catalog_Purchases,
        Store_Purchases
    FROM 
        marketing_campaign
) AS segmented_customers
GROUP BY 
    RecencySegment;


#-------------Table 4: Percentage of Purchases Across Channels for Each Recency Segment ------------#
#This table calculates the proportion of purchases made through the web, catalog, and store channels for each segment.

SELECT 
    RecencySegment,
    SUM(Web_Purchases) / SUM(Web_Purchases + Catalog_Purchases + Store_Purchases) * 100 AS WebPurchasesPercentage,
    SUM(Catalog_Purchases) / SUM(Web_Purchases + Catalog_Purchases + Store_Purchases) * 100 AS CatalogPurchasesPercentage,
    SUM(Store_Purchases) / SUM(Web_Purchases + Catalog_Purchases + Store_Purchases) * 100 AS StorePurchasesPercentage
FROM (
    SELECT 
        Recency, 
        Web_Purchases,
        Catalog_Purchases,
        Store_Purchases,
        CASE 
            WHEN Recency <= 30 THEN 'Very Recent'
            WHEN Recency BETWEEN 31 AND 60 THEN 'Recent'
            ELSE 'Older'
        END AS RecencySegment
    FROM 
        marketing_campaign
) AS segmented_customers
GROUP BY 
    RecencySegment;
    
#-----------------------------------------------------END----------------------------------------------------#
