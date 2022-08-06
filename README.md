# E-commerce-Class-project-v0.1
A solo made project for a E-commerce university class


In case that the DataBase did not work out for you:

~table#1

	CREATE TABLE [dbo].[Account] (
		[Id]             INT           IDENTITY (7000001, 1) NOT NULL,
		[Name]           NVARCHAR (50) NULL,
		[UserName]       NVARCHAR (50) NULL,
		[Email]          NVARCHAR (50) NULL,
		[Password]       NVARCHAR (50) NULL,
		[Address]        NVARCHAR (50) NULL,
		[Payment_method] NVARCHAR (50) NULL,
		PRIMARY KEY CLUSTERED ([Id] ASC)
	);

~table#2

	CREATE TABLE [dbo].[Cart] (
		[Cart_ID]          INT            NOT NULL,
		[Item_ID]          INT            NULL,
		[Account_ID]       INT            NULL,
		[item_description] NVARCHAR (500) NULL,
		[Price]            INT            NULL,
		FOREIGN KEY ([Item_ID]) REFERENCES [dbo].[Products] ([Id]),
		FOREIGN KEY ([Account_ID]) REFERENCES [dbo].[Account] ([Id])
	);

~taple3

	CREATE TABLE [dbo].[Orders] (
		[Order_ID]   INT            IDENTITY (5000001, 1) NOT NULL,
		[Cart_ID]    INT            NULL,
		[Items_ID]   NVARCHAR (500) NULL,
		[Account_ID] INT            NULL,
		[Payment]    NVARCHAR (50)  NULL,
		PRIMARY KEY CLUSTERED ([Order_ID] ASC),
		FOREIGN KEY ([Account_ID]) REFERENCES [dbo].[Account] ([Id])
	);

~table4

	CREATE TABLE [dbo].[Products] (
		[Id]                INT            IDENTITY (1000001, 1) NOT NULL,
		[Manufacturer]      NVARCHAR (50)  NULL,
		[Model]             NVARCHAR (50)  NULL,
		[color]             NVARCHAR (50)  NULL,
		[capacity]          NVARCHAR (50)  NULL,
		[img_link]          NVARCHAR (50)  NULL,
		[description_short] NVARCHAR (50)  NULL,
		[description_long]  NVARCHAR (500) NULL,
		[quantity]          INT            NULL,
		[Price]             INT            NULL,
		PRIMARY KEY CLUSTERED ([Id] ASC)
	);
