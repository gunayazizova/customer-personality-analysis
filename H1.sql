use project4_week4_sql;
select * from marketing_campaign;

UPDATE marketing_campaign
SET Education = CASE 
    WHEN Education = '2n Cycle' THEN NULL 
    ELSE Education 
END;

SELECT *
FROM marketing_campaign;


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
   
ALTER table marketing_campaign
rename column NumDealsPurchases to Deals_Purchases;

ALTER table marketing_campaign
rename column NumWebPurchases to Web_Purchases;

ALTER table marketing_campaign
rename column NumCatalogPurchases to Catalog_Purchases;

ALTER table marketing_campaign
rename column NumStorePurchases to Store_Purchases;

ALTER table marketing_campaign
rename column NumWebVisitsMonth to Web_VisitsMonth;

ALTER table marketing_campaign
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

SELECT Education, Marital_Status, COUNT(EDUCATION) as people_count,
    CASE
        WHEN (2024 - Year_Birth) <= 20 THEN '<=20'
        WHEN (2024 - Year_Birth) BETWEEN 21 AND 40 THEN '20 to 40'
        WHEN (2024 - Year_Birth) BETWEEN 41 AND 60 THEN '40 to 60'
        ELSE '60+'
    END AS age_group
FROM marketing_campaign
group by Education, age_group, Marital_Status
having Marital_Status!='In_relationship' and Marital_Status !='Widow'
ORDER BY people_count desc;


SELECT
    Education,
    ROUND((SUM(Wine_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_wine,
    ROUND((SUM(Fruits_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_fruit,
    ROUND((SUM(Meat_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_meat,
    ROUND((SUM(Fish_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_fish,
    ROUND((SUM(Sweet_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_sweet,
    ROUND((SUM(Promotion_products) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_promotion
FROM marketing_campaign
GROUP BY Education
HAVING (SUM(Wine_products_spending) + SUM(Fruits_products_spending) + SUM(Meat_products_spending) + SUM(Fish_products_spending) + SUM(Sweet_products_spending) + SUM(Promotion_products)) > 0;

SELECT
    Marital_Status,
    ROUND((SUM(Wine_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_wine,
    ROUND((SUM(Fruits_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_fruit,
    ROUND((SUM(Meat_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_meat,
    ROUND((SUM(Fish_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_fish,
    ROUND((SUM(Sweet_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_sweet,
    ROUND((SUM(Promotion_products) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_promotion
FROM marketing_campaign
group by Marital_Status
having Marital_Status!='In_relationship' and Marital_Status !='Widow';

SELECT
    CASE
        WHEN (2024 - Year_Birth) <= 20 THEN '<=20'
        WHEN (2024 - Year_Birth) BETWEEN 21 AND 40 THEN '20 to 40'
        WHEN (2024 - Year_Birth) BETWEEN 41 AND 60 THEN '40 to 60'
        ELSE '60+'
    END AS age_group,
    ROUND((SUM(Wine_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_wine,
    ROUND((SUM(Fruits_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_fruit,
    ROUND((SUM(Meat_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_meat,
    ROUND((SUM(Fish_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_fish,
    ROUND((SUM(Sweet_products_spending) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_sweet,
    ROUND((SUM(Promotion_products) / SUM(Wine_products_spending + Fruits_products_spending + Meat_products_spending + Fish_products_spending + Sweet_products_spending + Promotion_products)) * 100, 2) AS percentage_promotion
FROM marketing_campaign
group by age_group;