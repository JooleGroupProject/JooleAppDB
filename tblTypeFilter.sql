CREATE TABLE [dbo].[tblTypeFilter]
(
	[Filter_ID] INT NOT NULL PRIMARY KEY, 
    [SubCategory_ID] INT NOT NULL, 
    [Type_Name] NVARCHAR(50) NOT NULL, 
    [Type_Options] NVARCHAR(50) NULL, 
    [Property_ID] INT NULL, 
    CONSTRAINT [FK_tblTypeFilter_tblSubCategory] FOREIGN KEY ([SubCategory_ID]) REFERENCES [tblSubCategory]([SubCategory_ID])
)
