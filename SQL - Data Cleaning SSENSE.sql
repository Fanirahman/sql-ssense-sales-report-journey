SELECT *
FROM c2cfashion..salesfashion


--CHECK THE DATA AND MAKE THE CLEANING OF DESCRIPTION OF THE PRODUCT

SELECT *
FROM c2cfashion..salesfashion
WHERE Description like '%SSENSE%'

SELECT *
FROM c2cfashion..salesfashion
WHERE Description like '%Two-Pack%'


-- Add The Table for New Description

-- Add a new column to the salesfashion table
ALTER TABLE c2cfashion..salesfashion
ADD NewDescriptionProduct NVARCHAR(255);

-- Update the values in the NewDescriptionProduct column by replacing 'SSENSE Exclusive '
UPDATE c2cfashion..salesfashion
SET NewDescriptionProduct = REPLACE(description, 'SSENSE Exclusive ', '');

-- Update the values in the NewDescriptionProduct column by replacing 'Two-Pack '
UPDATE c2cfashion..salesfashion
SET NewDescriptionProduct = REPLACE(NewDescriptionProduct, 'Two-Pack ', '');


-- Check the Description for Colour and Type of Product and input new colomns to the table


ALTER TABLE c2cfashion..salesfashion
ADD colourofproduct nvarchar(255)

ALTER TABLE c2cfashion..salesfashion
ADD producttype nvarchar(255)

UPDATE c2cfashion..salesfashion
SET colourofproduct = SUBSTRING(NewDescriptionProduct, 1, CHARINDEX(' ', NewDescriptionProduct)),
    producttype = REVERSE(SUBSTRING(REVERSE(NewDescriptionProduct), 1, CHARINDEX(' ', REVERSE(NewDescriptionProduct))))

SELECT *
FROM c2cfashion..salesfashion
