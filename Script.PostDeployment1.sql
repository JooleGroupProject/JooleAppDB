/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*Cateogry*/
MERGE INTO tblCategory t
USING (
SELECT 1 AS Category_ID,'Mechanical' AS Category_Name
UNION ALL
SELECT 2,'Furniture'
) s
ON ( t.Category_ID= s.Category_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.Category_Name=s.Category_Name
  WHEN NOT MATCHED THEN
     INSERT( Category_ID, Category_Name)
     VALUES( s.Category_ID, s.Category_Name);

/*SubCategory*/
MERGE INTO tblSubCategory t
USING (
SELECT 1 AS SubCategory_ID,1 AS Category_ID,'Fans' AS SubCategory_Name
UNION ALL
SELECT 2,1,'Vaccums'
) s
ON ( t.SubCategory_ID= s.SubCategory_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.Category_ID=s.Category_ID, t.SubCategory_Name=s.SubCategory_Name
  WHEN NOT MATCHED THEN
     INSERT( SubCategory_ID, Category_ID, SubCategory_Name)
     VALUES( s.SubCategory_ID, s.Category_ID, s.SubCategory_Name)
     ;

/*User*/
MERGE INTO tblUser t
USING (
SELECT 1 AS User_ID,'admin' AS User_Name,'admin@jool.com' AS User_Email,NULL AS User_Image,'admin' AS User_Password
) s
ON ( t.User_ID= s.User_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.User_Name=s.User_Name, t.User_Email=s.User_Email, t.User_Image=s.User_Image, t.User_Password=s.User_Password
  WHEN NOT MATCHED THEN
     INSERT( User_ID, User_Name, User_Email, User_Image, User_Password)
     VALUES( s.User_ID, s.User_Name, s.User_Email, s.User_Image, s.User_Password)
;


/*Manufacturer*/
MERGE INTO tblManufacturer t
USING (
SELECT 1 AS Manufacturer_ID,'Emerson' AS Manufacturer_Name,NULL AS Manufacturer_Department
) s
ON ( t.Manufacturer_ID= s.Manufacturer_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.Manufacturer_Name=s.Manufacturer_Name, t.Manufacturer_Department=s.Manufacturer_Department
  WHEN NOT MATCHED THEN
     INSERT( Manufacturer_ID, Manufacturer_Name, Manufacturer_Department)
     VALUES( s.Manufacturer_ID, s.Manufacturer_Name, s.Manufacturer_Department)
;

/*Products*/
MERGE INTO tblProducts t
USING (
SELECT 1 AS Product_ID,1 AS SubCategory_ID,1 AS Manufacturer_ID,'Luray Eco Series Fan' AS Product_Name,'lurayEcoSeries.png' AS Product_Image,'Luray Eco' AS Series,'CF860' AS Model,2014 AS Model_Year,NULL AS Series_Info,NULL AS Featured
) s
ON ( t.Product_ID= s.Product_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.SubCategory_ID=s.SubCategory_ID, t.Manufacturer_ID=s.Manufacturer_ID, t.Product_Name=s.Product_Name, t.Product_Image=s.Product_Image, t.Series=s.Series, t.Model=s.Model, t.Model_Year=s.Model_Year, t.Series_Info=s.Series_Info, t.Featured=s.Featured
  WHEN NOT MATCHED THEN
     INSERT( Product_ID, SubCategory_ID, Manufacturer_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info, Featured)
     VALUES( s.Product_ID, s.SubCategory_ID, s.Manufacturer_ID, s.Product_Name, s.Product_Image, s.Series, s.Model, s.Model_Year, s.Series_Info, s.Featured)
;


/*Property*/
MERGE INTO tblProperty t
USING (
SELECT 1 AS Property_ID,'Air Flow (CFM)' AS Property_Name,'FALSE' AS IsType,'TRUE' AS IsTechSpec
UNION ALL
SELECT 2,'Use Type','TRUE','FALSE'
) s
ON ( t.Property_ID= s.Property_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.Property_Name=s.Property_Name, t.IsType=s.IsType, t.IsTechSpec=s.IsTechSpec
  WHEN NOT MATCHED THEN
     INSERT( Property_ID, Property_Name, IsType, IsTechSpec)
     VALUES( s.Property_ID, s.Property_Name, s.IsType, s.IsTechSpec)
;

/*PropertyValue*/
MERGE INTO tblPropertyValue t
USING (
SELECT 1 AS Property_ID,1 AS Product_ID,'5467' AS Value
UNION ALL
SELECT 2,1,'Commercial'
) s
ON ( t.Property_ID= s.Property_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.Product_ID=s.Product_ID, t.Value=s.Value
  WHEN NOT MATCHED THEN
     INSERT( Property_ID, Product_ID, Value)
     VALUES( s.Property_ID, s.Product_ID, s.Value)
;


/*TechSpecFilter*/
MERGE INTO tblSpecFilter t
USING (
SELECT 1 AS Property_ID,1 AS SubCategory_ID,10 AS Min_value,100 AS Max_value
) s
ON ( t.Property_ID= s.Property_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.SubCategory_ID=s.SubCategory_ID, t.Min_value=s.Min_value, t.Max_value=s.Max_value
  WHEN NOT MATCHED THEN
     INSERT( Property_ID, SubCategory_ID, Min_value, Max_value)
     VALUES( s.Property_ID, s.SubCategory_ID, s.Min_value, s.Max_value)
;

/*TypeFilter*/
MERGE INTO tblTypeFilter t
USING (
SELECT 2 AS Property_ID,1 AS SubCategory_ID,'Commercial' AS Type_Name,NULL AS Type_Options
) s
ON ( t.Property_ID= s.Property_ID )
  WHEN MATCHED THEN 
     UPDATE SET  t.SubCategory_ID=s.SubCategory_ID, t.Type_Name=s.Type_Name, t.Type_Options=s.Type_Options
  WHEN NOT MATCHED THEN
     INSERT( Property_ID, SubCategory_ID, Type_Name, Type_Options)
     VALUES( s.Property_ID, s.SubCategory_ID, s.Type_Name, s.Type_Options);