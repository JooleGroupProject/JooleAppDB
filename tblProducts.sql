CREATE TABLE [dbo].[tblProducts]
(
	[Product_ID] INT NOT NULL PRIMARY KEY, 
    [SubCategory_ID] INT NOT NULL, 
    [Manufacturer_ID] INT NOT NULL, 
    [Product_Name] NVARCHAR(50) NOT NULL, 
    [Product_Image] NVARCHAR(50) NOT NULL, 
    [Series] NVARCHAR(50) NOT NULL, 
    [Model] NVARCHAR(50) NOT NULL, 
    [Model_Year] INT NOT NULL, 
    [Series_Info] NVARCHAR(50) NOT NULL, 
    [Featured] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_tblProducts_tblSubCategory] FOREIGN KEY ([SubCategory_ID]) REFERENCES [tblSubCategory]([SubCategory_ID]), 
    CONSTRAINT [FK_tblProducts_tblManufacturer] FOREIGN KEY ([Manufacturer_ID]) REFERENCES [tblManufacturer]([Manufacturer_ID])
)
