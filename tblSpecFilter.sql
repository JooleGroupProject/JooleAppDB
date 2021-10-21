CREATE TABLE [dbo].[tblSpecFilter]
(
	[Property_ID] INT NOT NULL PRIMARY KEY, 
    [SubCategory_ID] INT NOT NULL, 
    [Min_value] NVARCHAR(50) NOT NULL, 
    [Max_value] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_tblSpecFilter_tblSubCategory] FOREIGN KEY ([SubCategory_ID]) REFERENCES [tblSubCategory]([SubCategory_ID])
)
