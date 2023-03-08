
/*						
																															*/

--=======================================  Start of DML script  =========================================--

USE StockManagementSystem
GO
select * from tblCustomers
select * from tblEmployees
select * from tblSuppliers
select * from tblProducts
select * from tblCategory
select * from tblShippers
select * from tblOrders
select * from tblOrdersDetails
select * from tblInventory


insert into tblCUSTOMERS 
values 
		(111,'Arman','Hossain','Sadarghat','Dhaka','Bangladesh','+88 0175581900','arman@gmil.com'),
		(112,'Saddam','Hossain','Rampura','Barisal','Bangladesh','+88 0175581900','arman@gmil.com'),
		(113,'Imam','Masum','Badda','Shylet','Bangladesh','+88 0175581900','imam@gmil.com'),
		(114,'Shihab','Hossain','Greenroad','Bangladesh','Bangladesh','+88 0175581900','shihab@gmil.com'),
		(115,'Arafat','Rimon','Framgate','Rangpur','Bangladesh','+88 0175581900','arafat@gmil.com'),
		
GO

insert into tblEmployees 
values
		(211,'MD. Rabin','Sadar','Faridpur','Bangladesh','1995-01-01','2015-01-01','1995253265125','N/A','0178145689','rabin@gmil.com'),
		(212,'MD. Rabbi','Badda','Dhaka','Bangladesh','1995-02-03','2016-01-01','1995253265124','N/A','0178145689','rabbi@gmil.com'),
		(213,'MD. Sieam','Gazipur','Dhaka','Bangladesh','1996-01-01','2017-01-01','1995253222125','N/A','0178145689','sieam@gmil.com'),
		(214,'MD. Ferdoes','Savar','Mymensing','Bangladesh','1998-01-01','2018-01-01','1995253235125','N/A','0178145689','ferdoes@gmil.com'),
		(215,'MD. Abbas','Rajbari','Chattagram','Bangladesh','1994-01-01','2014-01-01','1995215265125','N/A','0178145689','abbas@gmil.com')
GO

insert into tblSuppliers
values
		('APPLE','Mr. Devid','Sales Manager','ER Road','Washington','America',default),
		('DELL','Mr. Ronald','Sales Manager','12/wc','New York','America',default),
		('HP','Mr. Robart','Manager','15/wc','Texas','America',default),
		('LENEVO','Mrs. Rose','Production Manager','17/wc','Beijing','China',default),
		('ASUS','Ms. Swift','Sales Manager','20/wc','Taipei','Taiwan',default)
GO

select * from tblSuppliers
GO

insert into tblProducts
values
		(1,'14" monitor',10000.00,100),
		(2,'16" monitor',12000.00,50),
		(3,'DDR4 RAM',3000.00,20),
		(4,'DD3 RAM',2500.00,30),
		(5,'MOUSE',500.00,70),
		(6,'KEYBOARD',1000.00,80),
		(7,'HEADPHONE',1500.00,35),
		(8,'LAPTOP',50000.00,40),
		(9,'IPOD',5000.00,50),
		(10,'SPEAKER',1200.00,60),
		(11,'SMART PHONE',15000.00,50),
		(12,'SOUND BOX',2000.00,90),
		(13,'WEB CAM',3000.00,20),
		(14,'DESKTOP',35000.00,10),
		(15,'HDD 500GB',2800.00,15)
GO
select * from tblProducts
GO

insert into tblCategory
values
		(default,'monitor'),
		(default,'assescories'),
		(default,'stroage'),
		(default,'mobile phone'),
		(default,'memory')
GO

select * from tblCategory
GO

insert into tblShippers
values 
		('REDX','0175500000'),
		('SUNDORBAN','0165500000'),
		('SA','0175500000')

select * from tblShippers
GO


insert into tblOrders
values
		(1,101,201,'2020-01-01','2020-01-15',1,5000.00),
		(2,102,201,'2020-01-10','2020-01-20',2,2000.00),
		(3,103,202,'2020-02-01','2020-02-15',3,4000.00),
		(4,104,203,'2020-02-20','2020-02-15',2,5500.00),
		(5,105,204,'2020-03-01','2020-03-15',3,4500.00),
		(6,106,205,'2020-03-15','2020-03-15',2,2500.00),
		(7,107,201,'2020-04-01','2020-04-15',1,3000.00),
		(8,108,202,'2020-04-05','2020-04-15',1,2200.00),
		(9,109,203,'2020-05-01','2020-05-15',2,4000.00),
		(10,110,204,'2020-05-25','2020-06-15',3,8000.00),
		(11,101,205,'2020-06-01','2020-06-15',1,8500.00),
		(12,102,201,'2020-07-10','2020-07-15',1,9000.00),
		(13,102,202,'2020-08-15','2020-08-15',3,1000.00),
		(14,103,203,'2020-09-01','2020-09-15',1,2500.00),
		(15,104,201,'2020-10-30','2020-11-15',3,3200.00),
		(16,105,202,'2020-11-01','2020-11-15',1,5000.00),
		(17,105,204,'2020-12-15','2020-12-15',2,2500.00),
		(18,106,203,'2021-01-01','2021-01-16',3,2700.00),
		(19,107,202,'2021-01-15','2021-01-25',2,3600.00),
		(20,108,201,'2021-02-01','2021-02-15',3,3800.00),
		(21,109,202,'2021-03-01','2021-03-15',3,9500.00),
		(22,105,205,'2021-04-01','2021-04-15',1,1200.00),
		(23,105,203,'2021-05-01','2021-05-15',1,7800.00),
		(24,107,201,'2021-06-01','2021-06-15',1,500.00),
		(25,108,202,'2021-06-05','2021-06-20',1,4500.00),
		(26,109,205,'2021-07-01','2021-07-15',2,8000.00),
		(27,102,204,'2021-07-20','2021-07-28',3,6500.00),
		(28,110,203,'2021-08-01','2021-08-15',3,6200.00),
		(29,105,201,'2021-09-01','2021-09-15',2,4500.00),
		(30,101,204,'2021-10-01','2021-10-15',1,1800.00)
GO		
select * from tblOrders
GO


insert into tblOrdersDetails
values 
		(1,1,15000.00,5,.05),
		(2,2,15000.00,4,.05),
		(3,3,15000.00,10,.05),
		(4,3,15000.00,12,.05),
		(5,4,15000.00,20,.05),
		(6,4,15000.00,7,.05),
		(7,5,15000.00,8,.05),
		(8,1,15000.00,10,.05),
		(9,6,15000.00,20,.05),
		(12,7,15000.00,25,.10),
		(14,8,15000.00,30,.10),
		(15,1,15000.00,10,.05),
		(16,14,15000.00,40,.10),
		(17,15,15000.00,4,.05),
		(18,10,15000.00,8,.05),
		(19,12,15000.00,15,.05),
		(20,1,15000.00,18,.05)
GO
select * from tblOrdersDetails
GO

insert into tblInventory
values 
		(1,100,'2019-01-15',DEFAULT,1,1,2),
		(2,100,'2019-02-15','2021-11-10',2,0,1),
		(3,100,'2019-03-15',DEFAULT,5,1,2),
		(4,100,'2019-04-15',DEFAULT,3,1,3),
		(5,100,'2019-05-15',DEFAULT,4,1,4),
		(2,100,'2019-06-15',DEFAULT,2,1,5),
		(3,100,'2019-04-25',DEFAULT,1,1,6),
		(4,100,'2019-07-15',DEFAULT,5,1,7),
		(5,100,'2019-08-15',DEFAULT,2,1,9),
		(1,100,'2019-09-15',DEFAULT,1,1,7),
		(3,100,'2019-10-15','2021-11-15',3,0,11),
		(4,100,'2019-11-15',DEFAULT,1,1,12),
		(5,100,'2019-12-15',DEFAULT,1,1,7),
		(3,100,'2019-04-20',DEFAULT,2,1,15),
		(2,100,'2019-09-30','2021-11-20',4,0,2),
		(1,100,'2019-01-20',DEFAULT,3,1,1)
GO	

select * from tblInventory
GO
--inserting data through stored procedure
		EXEC sp_InsertCustomers 111,'Shakib','Rana','Elephant Road','Dhaka','Bangladesh','+88 0175581900','shakib@gmil.com'
		EXEC sp_InsertCustomers 112,'Helal','Uddin','DC Road','Dhaka','Bangladesh','+88 0175581900','helal@gmil.com'
		EXEC sp_InsertCustomers 113,'Riaz','Morshed','AC Road','Dhaka','Bangladesh','+88 0175581900','riaz@gmil.com'
		EXEC sp_InsertCustomers 114,'Abdur','Rahaman','BC Road','Dhaka','Bangladesh','+88 0175581900','rahman@gmil.com'
		EXEC sp_InsertCustomers 115,'Abdur','Razzak','W/C Road','Dhaka','Bangladesh','+88 0175581900','razzak@gmil.com'
		EXEC sp_InsertCustomers 116,'Abul','Kalam','A/F Road','Dhaka','Bangladesh','+88 0175581900','kalam@gmil.com'
		EXEC sp_InsertCustomers 117,'Abik','Hossain','Badda','Dhaka','Bangladesh','+88 0175581900','abik@gmil.com'
		EXEC sp_InsertCustomers 118,'Masud','Rana','Dhanmondi','Dhaka','Bangladesh','+88 0175581900','masud@gmil.com'
		EXEC sp_InsertCustomers 119,'Suman','Molla','Rampura','Dhaka','Bangladesh','+88 0175581900','suman@gmil.com'
		EXEC sp_InsertCustomers 120,'Ripon','Reza','Halishore','Ctg','Bangladesh','+88 0175581900','ripon@gmil.com'
		
GO
select * from tblCustomers
GO
--simple query
select * from tblInventory
GO

--join quary to find out order deatils join 
select * from tblOrders O
join tblOrdersDetails OD On OD.OrderId=O.OrderId
where O.CustomerId = 105
GO

/*         join quary with aggregate column with group by,orderby clause
           to find out customer wise total discount
															 */
			
select O.CustomerId,SUM(od.UnitPrice*od.Quantity* OD.Discount) 'Discount_per_Customer' FROM tblOrders O
JOIN tblOrdersDetails OD ON OD.OrderId=O.OrderId
GROUP BY O.CustomerId
ORDER BY O.CustomerId DESC
GO

--subquery to find out the orders details of a specific customer
select * from tblOrders O
JOIN tblCustomers C ON C.CustomerId = O.CustomerId
WHERE O.CustomerId=(SELECT CustomerId FROM tblCustomers WHERE CustomerFName='ARMAN')
GO

--using rollup in query with having clause to find out the customer and product wsie net order amount who have more than 50000 order amountselect customerid,productid,sum(unitprice*quantity*(1-discount)) as 'net_order_amount' from tblorders ojoin tblOrdersDetails OD ON O.OrderId=OD.OrderId
GROUP BY ROLLUP (CustomerId,PRODUCTID)
HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) >=50000
ORDER BY CustomerId
GO


-- using  searched case function to find out the customer who have get 20 or more percent discount on their purchase
select ORDERID,SUM(Quantity*UnitPrice) AS 'Total Amount ordered',
CASE
	WHEN SUM(Quantity*UnitPrice)>= 100000
		THEN '25% DISCOUNT'
	WHEN SUM(Quantity*UnitPrice)>= 75000
		THEN '20% DISCOUNT'
	ELSE 'DEFAULT DISCOUNT'
END AS DISCOUNT
FROM tblOrdersDetails
GROUP BY OrderId

--Check for view
select * from V_tblOrdersDetails
GO

--Check for stored procedure
EXEC sp_tblCustomers
GO

--inserting data using stroed procedure
declare @id INT
exec @id= sp_InsertEmployeesWithReturn 212,'MD. ABU BAKAR','BADDA','DHAKA','BANGLADESH','1995-02-10','2015-10-15','1245367895412','N/A','01770000','kalam@gmail.com'
print 'New product inserted with Id : '+STR(@id)
GO

--test for scalar valued function for calculating month wise total sales
select DBO.fn_OrdersDetailS(02,2020) AS TOTAL_SALES_AMOUNT
GO

--test for scalar valued function to calculating product wise total sales
select DBO.fn_ordersamountPerProduct(1) AS product_wise_total_sales
GO

--test for single statement table valued function to bring out the net amount of specific customer
select * from fn_OrderdetailsSimpleTable(105)
GO

--test for multi-statement table valued function to bring out the total amount of specific inventory purchased at a specific date
select * from fn_InventoryMultiStatement('2019-01-15')
GO

--test for after trigger that does not let to delete any data from orders table
delete from tblOrders
where OrderId=1
GO


--test for after trigger to insert data--
insert into tblInventory values(2,50,'2019-12-15',DEFAULT,3,1,4)
insert into tblInventory values(3,50,'2019-11-12',DEFAULT,4,0,8)
GO

select * from tblInventory
select * from tblProducts
GO

--test triggers for delete data
delete from tblInventory WHERE PId=1
GO

select * from tblInventory
select * from tblProducts
GO

--test triggers for update data
UPDATE tblInventory
SET Quantity=40
WHERE InventoryId=10
GO

select * from tblInventory
select * from tblProducts
GO

--test insted of trigers for insert data into a view
insert into V_tblSuppliers values ('WALTON','MR. Habib','Manager','Gazipur','Gazipur','Bangladesh',DEFAULT)
GO

--test insted of trigers for insert data into table. if the stock is less than the order amount data can't be inserted. rollbacked
insert into tblOrdersDetails values (21,11,12000.00,10,.05)
GO

insert into tblOrdersDetails values(22,10,20000.00,50,.05)
GO

select * from tblOrdersDetails
select * from tblInventory


--=======================================    end of DML script    =========================================--