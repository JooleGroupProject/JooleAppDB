CREATE TABLE [dbo].[tblPropertyValue]
(
	[Property_ID] INT NOT NULL, 
    [Product_ID] INT NOT NULL, 
    [Value] NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_tblrPropertyValue PRIMARY KEY ([Property_ID],[Product_ID]),
    CONSTRAINT [FK_tblPropertyValue_tblProducts] FOREIGN KEY ([Product_ID]) REFERENCES [tblProducts]([Product_ID]), 
    CONSTRAINT [FK_tblPropertyValue_tblProperty] FOREIGN KEY ([Property_ID]) REFERENCES [tblProperty]([Property_ID])
)
