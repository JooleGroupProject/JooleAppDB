CREATE TABLE [dbo].[tblSpecFilter]
(
	[Property_ID] INT NOT NULL , 
    [SubCategory_ID] INT NOT NULL, 
    [Min_value] NVARCHAR(50) NOT NULL, 
    [Max_value] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_tblSpecFilter_tblSubCategory] FOREIGN KEY ([SubCategory_ID]) REFERENCES [tblSubCategory]([SubCategory_ID]),
    CONSTRAINT [FK_tblSpecFilter_tblProperty] FOREIGN KEY ([Property_ID]) REFERENCES [tblProperty]([Property_ID]), 
    CONSTRAINT PK_tblrSpecFilter PRIMARY KEY ([Property_ID],[SubCategory_ID])
)
