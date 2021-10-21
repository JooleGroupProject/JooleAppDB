CREATE TABLE [dbo].[tblPropertyValue]
(
	[Property_ID] INT NOT NULL PRIMARY KEY, 
    [Product_ID] INT NOT NULL, 
    [Value] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_tblPropertyValue_tblProducts] FOREIGN KEY ([Product_ID]) REFERENCES [tblProducts]([Product_ID])
)
