CREATE TABLE [dbo].[tblSubCategory]
(
	[SubCategory_ID] INT NOT NULL PRIMARY KEY, 
    [Category_ID] INT NOT NULL, 
    [SubCategory_Name] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY ([Category_ID]) REFERENCES [tblCategory]([Category_ID]) 
)
