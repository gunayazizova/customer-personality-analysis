use customer_segment;
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

alter table marketing_campaign
rename column MntWines to Amount_wines;

alter table marketing_campaign
rename column MntFruits to Amount_fruits;

alter table marketing_campaign
rename column MntMeatProducts to Amount_meat_products;

alter table marketing_campaign
rename column MntFishProducts to Amount_fish_products;

alter table marketing_campaign
rename column MntSweetProducts to Amount_sweet_products;

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
