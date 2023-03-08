							
/*						
																															*/
--===================================== Start of DDL script =======================================--


USE MASTER
GO

DROP DATABASE IF EXISTS StockManagementSystem
GO

CREATE DATABASE StockManagementSystem
ON
(
	NAME= StockManagementSystem_data,
	FILENAME='E:\StockManagementSystem_data.mdf',
	SIZE=50MB,
	MAXSIZE=100MB,
	FILEGROWTH=10MB
)
LOG ON
(
NAME= StockManagementSystem_log,
	FILENAME='C:\StockManagementSystem_log.ldf',
	SIZE=15MB,
	MAXSIZE=30MB,
	FILEGROWTH=5%
)
GO

USE StockManagementSystem
GO


create table tblCustomers
(
	CustomerId int primary key,
	CustomerFName varchar (20) not null,
	CustomerLName varchar(20)  not null,
	CustomerAddress varchar(100) null,
	City varchar(40) null ,
	Country varchar(50) null,
	PhoneNo varchar(20) null,
	Email varchar(80) null
)
GO

create table tblEmployees
(
	EmployeeId int primary key,
	EmpName nvarchar(50) not null,
	EmpAddress varchar(100) not null,
	Empcity varchar (20) not null,
	Empcountry varchar (30) null,
	Birthdate date  not null,
	Hiredate date not null,
	NID char (13) not null unique,
	EmpImage  varchar (MAX) not null default 'N/A',
	Phone VARCHAR(20) not null,
	Email VARCHAR(50) null
)
GO

create table tblSuppliers
(
	SupplierId int primary key identity,
	CompanyName varchar (50) not null,
	ContactName varchar (30) null ,
	ContactTitle varchar (30) null,
	SupAddress varchar (100) null,
	City varchar (20) null,
	Country varchar (20) null,
	Phone  varchar (20) not null default 'N/A',
)
GO

create table tblProducts
(
	ProductId int primary key,
	ProductName varchar(100),
	UnitPrice money,
	Stock int default 0
)
GO

create table tblCategory
(
	id int identity primary key,
	CategoryId uniqueidentifier not null default newid(),
	CategoryName varchar(50) not null
)
GO

create table tblShippers
(
	ShipperId int identity primary key,
	CompanyName varchar(50) not null,
	Phone Nvarchar(20)
)
GO

create table tblOrders
(
	OrderId int primary key,
	CustomerId int references tblCustomers(Customerid),
	EmployeeId int references tblEmployees(Employeeid),
	OrderDate date not null,
	ShipDate date not null default getdate(),
	ShippingCompany int references tblShippers(Shipperid),
	Freight money null,
)
GO

create table tblOrdersDetails
(
	OrderId int references tblOrders(Orderid),
	ProductId int references tblProducts(ProductId),
	UnitPrice float not null,
	Quantity int not null,
	Discount float not null default 0,
	DiscountedAmount AS UnitPrice*Quantity*Discount,
	primary key (OrderId,ProductId)
)
GO

create table tblInventory
(
	InventoryId int identity primary key,
	SupplierId int references tblSuppliers(Supplierid),
	Quantity int not null default 0,
	PurchaseDate date not null,
	StockOutDate date null,
	Category int references tblCategory(Id),
	Available bit not null,
	PId int references tblProducts(productid)
)
GO

create table tblCity
(
	CityId int not null unique,
	CityName varchar (20) not null
)
GO

--============  Alter table (ADD, Delete Table, Drop Column)  ===============--

-- Add column to a esisting table  
Alter table tblcity
Add Zipcode varchar(10)
GO
--delete column form a existing table 
Alter table tblcity
drop column ZipCode
GO

--drop a table 
If object_id ('tblcity') is not null
drop table tblCity
GO


--===============================   Index    ==================================--

--create a non-clustered index for customer table 
create unique nonclustered index IX_Customer
ON tblCustomers(customerid)customerid
GO

--=================================  View   ===========================================--

--Create a view for update, insert and delete data from base table
create view V_tblSuppliers
As
select * from tblSuppliers
GO

--Inserting data using view
insert into V_tblSuppliers values
		('ACER','MR.RAHIM','Manager','17/AC','KUALA LAMPUR','MALAYSIA',DEFAULT)
GO

--as suppliers is referenced to others table
delete from V_tblSuppliers
where CompanyName='Dell'
GO

--Create a view to find out the customers who have ordered more the 5000 tk

create view V_tblOrdersDetails
with encryption
As
select top 5 percent OD.OrderId,OD.ProductId,O.CustomerId,OD.Quantity,OD.UnitPrice 
from tblOrdersDetails OD
join tblOrders O ON OD.OrderId=O.OrderId
where (UnitPrice*Quantity) >=5000
with check option
GO

--============================= stored procedure  ================================--
create proc sp_tblCustomers
with encryption
As
select * from tblCustomers
where City='Dhaka'
GO

--A Stored Procedure for inserting DATA
create proc sp_InsertCustomers
						@customerid int,
						@customerFname varchar(20),
						@customerLname varchar(20)=NULL,
						@address varchar(50)=NULL,
						@city varchar(20),
						@country varchar(20),
						@phoneNo varchar(20),
						@email varchar(50)
AS
begin
	insert into tblCustomers(CustomerId,CustomerFName,CustomerLName,CustomerAddress,City,Country,PhoneNo,Email)
	values(@customerid,@customerFname,@customerLname,@address,@city,@country,@phoneNo,@email)
end
GO

--A Stored procedure for deleting data 
create proc sp_deleteCustomers
						@customerFname varchar(20)
As 
	delete from tblCustomers where CustomerFName=@customerFname
GO

--A Stored procedure for inserting data with return values
create proc sp_InsertEmployeesWithReturn
						@employeeid int,
						@empName varchar(20),
						@empAddress varchar(50),
						@city varchar(20),
						@country varchar(20),
						@birthdate date,
						@hiredate date,
						@NID char(13),
						@empImage varchar(max)='N/A',
						@phone varchar(20),
						@email varchar(50)=null
As
declare @id int 
insert into tblEmployees values (@employeeid,@empName,@empAddress,@city,@country,@birthdate,@hiredate,@NID,@empImage,@phone,@email)
select @id=ident_current ('tblEmployees')
return @id
GO


--test with data insert

declare @id int
exec @id= sp_InsertEmployeesWithReturn 208,'MD. KALAM','BADDA','DHAKA','BANGLADESH','1995-02-10','2015-10-15','1245367895412','N/A','01770000','kalam@gmail.com'
print 'New product inserted with Id : '+STR(@id)
GO

----------------A Stored procedure for inserting data with output parameter---------------
create proc sp_InsertEmployeesWithOutPutParameter

						@employeeid int,
						@empName varchar(20),
						@empAddress varchar(50),
						@city varchar(20),
						@country varchar(20),
						@birthdate date,
						@hiredate date,
						@NID char (13),
						@empImage varchar (max)='N/A',
						@phone varchar (20),
						@email varchar (50)=null,
						@Eid int output
As
Insert into tblEmployees values (@employeeid,@empName,@empAddress,@city,@country,@birthdate,@hiredate,@NID,@empImage,@phone,@email)
select @Eid= Ident_current ('tblEmployees')
GO

--test with data insert
declare @eid int
exec sp_InsertEmployeesWithOutPutParameter 210,'MD. ABU BAKAR','BADDA','DHAKA','BANGLADESH','1995-02-10','2015-10-15','1245365895412','N/A','01770000','kalam@gmail.com',@eid OUTPUT
select @eid 'New Id'
GO

--==================================  Function ====================================--


--1. Scalar valued function for calculating the total sales amount
create function fn_OrdersDetails
					(@month int,@year int)
Returns Int
As
	Begin
		Declare @amount Money
		Select @amount=sum (unitprice*quantity) from tblOrders 
		join tblOrdersDetails On tblOrders.OrderId=tblOrdersDetails.OrderId
		where year (OrderDate)=@year and Month (OrderDate)=@month
		Return @amount
	end	
GO


--=========================  Triggers ============================--
																														
-- create for triggers for update data in the inventory table
create trigger tr_UpdateInventory
On tblinventory
for update
AS
	begin
			IF update (quantity)
			begin
						declare @ID int, 
								@DQ int,
								@IQ int,
								@change int

						select @ID=I.PId,@DQ=D.Quantity,@IQ=I.Quantity
						from inserted I
						join deleted D ON D.PId=I.PId
						set @change=@iq-@DQ

						update tblProducts
						set Stock=Stock+@change
						where ProductId=@ID
			end
	end
GO

--TEST--
insert into tblInventory values()
GO

--====================    END OF DDL SCRIPT  ==========================--