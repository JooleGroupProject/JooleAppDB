﻿CREATE TABLE [dbo].[tblUser]
(
	[User_ID] INT NOT NULL PRIMARY KEY, 
    [User_Name] NVARCHAR(50) NOT NULL, 
    [User_Email] NVARCHAR(50) NOT NULL, 
    [User_Image] NVARCHAR(50) NOT NULL, 
    [User_Password] NVARCHAR(50) NOT NULL
)