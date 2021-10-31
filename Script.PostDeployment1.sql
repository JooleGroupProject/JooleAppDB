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
MERGE INTO tblCategory AS Target
USING(VALUES
(1,'Mechanical'),
(2,'Furniture')
)
AS SOURCE(Category_ID, Category_Name)
ON Target.Category_ID = Source.Category_ID
WHEN MATCHED THEN
UPDATE SET
    Target.Category_Name = Source.Category_Name
WHEN NOT MATCHED BY Target THEN
INSERT (Category_ID, Category_Name)
VALUES (Category_ID, Category_Name);

/*SubCategory*/
MERGE INTO tblSubCategory AS Target
USING(VALUES
(1,1,'Fans'),
(2,1,'Lighting'),
(3,2,'Tables')
)
AS SOURCE(SubCategory_ID, Category_ID, SubCategory_Name)
ON Target.SubCategory_ID=Source.SubCategory_ID
WHEN MATCHED THEN
UPDATE SET
    Target.Category_ID = Source.Category_ID,
    Target.SubCategory_Name = Source.SubCategory_Name
WHEN NOT MATCHED BY Target THEN
INSERT(SubCategory_ID, Category_ID, SubCategory_Name)
VALUES(SubCategory_ID, Category_ID, SubCategory_Name);

/*User*/
MERGE INTO tblUser AS Target
USING(VALUES
('admin','admin@jool.com',NULL,'admin')
)
AS SOURCE(User_Name, User_Email, User_Image, User_Password)
ON Target.User_Name = SOURCE.User_Name
WHEN MATCHED THEN
UPDATE SET
    Target.User_Name = Source.User_Name,
    Target.User_Email = Source.User_Email,
    Target.User_Image = Source.User_Image,
    Target.User_Password = Source.User_Password
WHEN NOT MATCHED BY Target THEN
INSERT(User_Name, User_Email, User_Image, User_Password)
VALUES(User_Name, User_Email, User_Image, User_Password);

/*Manufacturer*/
MERGE INTO tblManufacturer AS Target
USING(VALUES
(1,'Emerson',null),
(2,'Minka',null)
)
AS SOURCE(Manufacturer_ID, Manufacturer_Name, Manufacturer_Department)
ON Target.Manufacturer_ID = SOURCE.Manufacturer_ID
WHEN MATCHED THEN
UPDATE SET
    Target.Manufacturer_Name = Source.Manufacturer_Name,
    Target.Manufacturer_Department = Source.Manufacturer_Department
WHEN NOT MATCHED BY Target THEN
INSERT(Manufacturer_ID, Manufacturer_Name, Manufacturer_Department)
VALUES(Manufacturer_ID, Manufacturer_Name, Manufacturer_Department);

/*Products*/
MERGE INTO tblProducts AS Target
USING(VALUES
    (1,1,1,'Luray Eco Series Fan','lurayEcoSeries.jpg','Luray Eco','CF860','2014',null,null),
    (2,1,2,'Minka Ceiling Fan','minkaCeilingFan.jpg','Aviation','F853-RW','2015',null,null),
    (3,1,2,'Industrial Ceiling Fan','industrialCeilingFan.jpg','Industry','S13150-S0-BC','2016',null,null),
    (4,2,1,'Rustic Farmhouse Light','rusticLight.jpg','Southbourn','A1253','2012',null,null),
    (5,2,2,'Grafton 3-Light Celing','graftonLight.jpg','Walden','UN241','2013',null,null),
    (6,3,1,'Coffee Table','coffeeTable.jpg','LifeStyle','AB3421','2017',null,null)
)
AS SOURCE(Product_ID, SubCategory_ID, Manufacturer_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info,Featured)
ON Target.Product_ID = Source.Product_ID
WHEN MATCHED THEN
UPDATE SET
    Target.SubCategory_ID = Source.SubCategory_ID,
    Target.Manufacturer_ID = Source.Manufacturer_ID,
    Target.Product_Name = Source.Product_Name,
    Target.Product_Image = Source.Product_Image,
    Target.Series = Source.Series,
    Target.Model = Source.Model,
    Target.Model_Year = Source.Model_Year,
    Target.Series_Info = Source.Series_Info,
    Target.Featured = Source.Featured
WHEN NOT MATCHED BY Target THEN
INSERT (Product_ID, SubCategory_ID, Manufacturer_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info,Featured)
VALUES (Product_ID, SubCategory_ID, Manufacturer_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info,Featured);

/*Property*/
MERGE INTO tblProperty AS Target
USING(VALUES
    (1,'Air Flow (CFM)','FALSE','TRUE'),
    (2,'Use Type','TRUE','FALSE'),
    (3,'Application','TRUE','FALSE'),
    (4,'Accessories','TRUE','FALSE'),
    (5,'Power (W) at Max Speed','FALSE','TRUE'),
    (6,'Operating Voltage (VAC)','FALSE','TRUE'),
    (7,'Fan speed (RPM)','FALSE','TRUE'),
    (8,'Number of fan speeds','FALSE','TRUE'),
    (9,'Sound at max speed (dBA)','FALSE','TRUE'),
    (10,'Brightness (Lumens)','FALSE','TRUE'),
    (11,'Power Consumption (Watts)','FALSE','TRUE'),
    (12,'Lifetime (hours)','FALSE','TRUE'),
    (13,'Mount Location','TRUE','FALSE'),
    (14,'Height (in)','FALSE','TRUE'),
    (15,'Width (in)','FALSE','TRUE'),
    (16,'Loation','TRUE','FALSE')
)
AS Source(Property_ID,Property_Name, IsType, IsTechSpec)
ON Target.Property_ID = Source.Property_ID
WHEN MATCHED THEN
UPDATE SET
    Target.Property_Name = Source.Property_Name,
    Target.IsType = Source.IsType,
    Target.IsTechSpec = Source.IsTechSpec
WHEN NOT MATCHED BY Target THEN
INSERT (Property_ID,Property_Name, IsType, IsTechSpec)
VALUES (Property_ID,Property_Name, IsType, IsTechSpec);

/*PropertyValue*/
MERGE INTO tblPropertyValue AS Target
USING(VALUES
(1,1,'5467'),
(2,1,'Commercial'),
(3,1,'Indoor'),
(4,1,'With Light'),
(5,1,'21.14'),
(6,1,'240'),
(7,1,'200'),
(8,1,'7'),
(9,1,'35'),
(1,2,'2500'),
(2,2,'Commercial'),
(3,2,'Outdoor'),
(4,2,'Without Light'),
(5,2,'15.21'),
(6,2,'150'),
(7,2,'300'),
(8,2,'5'),
(9,2,'60'),
(1,3,'8000'),
(2,3,'Industrial'),
(3,3,'Indoor'),
(4,3,'With Light'),
(5,3,'30.2'),
(6,3,'300'),
(7,3,'100'),
(8,3,'9'),
(9,3,'90'),
(10,4,'50'),
(11,4,'200'),
(12,4,'350'),
(13,4,'Wall'),
(10,5,'20'),
(11,5,'450'),
(12,5,'750'),
(13,5,'Ceiling'),
(14,6,'100'),
(15,6,'50'),
(16,6,'Living Room')
)
AS SOURCE (Property_ID, Product_ID, Value)
ON Target.Property_ID = Source.Property_ID AND Target.Product_ID = Source.Product_ID
WHEN MATCHED THEN
UPDATE SET
    Target.Value = Source.Value
WHEN NOT MATCHED BY Target THEN
INSERT (Property_ID, Product_ID, Value)
VALUES (Property_ID, Product_ID, Value);

/*TypeFilter*/
MERGE INTO tblTypeFilter Target
USING(VALUES
(1,2,1,'Commercial', NULL),
(2,2,1,'Industrial', NULL),
(3,3,1,'Indoor',NULL),
(4,3,1,'Outdoor',NULL),
(5,4,1,'With Light',NULL),
(6,4,1,'Without Light',NULL),
(7,13,2,'Ceiling',null),
(8,13,2,'Wall',null),
(9,16,3,'Living Room',null),
(10,16,3,'Dining Room',null)
)
AS SOURCE(Filter_ID, Property_ID, SubCategory_ID, Type_Name,Type_Options)
ON Target.Filter_ID = Source.Filter_ID
WHEN MATCHED THEN
UPDATE SET
    Target.Property_ID = Source.Property_ID,
    Target.SubCategory_ID = Source.SubCategory_ID,
    Target.Type_Name = Source.Type_Name,
    Target.Type_Options = Source.Type_Options
WHEN NOT MATCHED BY Target THEN
INSERT (Filter_ID, Property_ID, SubCategory_ID, Type_Name,Type_Options)
VALUES (Filter_ID, Property_ID, SubCategory_ID, Type_Name,Type_Options);

/*TechSpecFilter*/
MERGE INTO tblSpecFilter AS Target
USING(VALUES
    (1,1,1000,10000),
    (5,1,5,50),
    (6,1,90,350),
    (7,1,50,400),
    (8,1,1,100),
    (9,1,10,100),
    (10,2,10,100),
    (11,2,100,500),
    (12,2,200,1000),
    (14,3,40,200),
    (15,3,10,150)
)
AS SOURCE(Property_ID,SubCategory_ID,Min_value,Max_value)
ON Target.Property_ID = Source.Property_ID
WHEN MATCHED THEN
UPDATE SET
    Target.SubCategory_ID = Source.SubCategory_ID,
    Target.Min_value = Source.Min_value,
    Target.Max_value = Source.Max_value
WHEN NOT MATCHED BY Target THEN
INSERT(Property_ID,SubCategory_ID,Min_value,Max_value)
VALUES (Property_ID,SubCategory_ID,Min_value,Max_value);

