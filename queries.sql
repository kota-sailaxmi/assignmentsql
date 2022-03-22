create database if not exists company;
use company ;
create table if not exists SalesPeople(
Snum int (10) not null,Sname char(20) unique ,
City varchar (20) not null default ' ',
Comm int unsigned not null default 00,
primary key(Snum)
);
desc SalesPeople;
insert into SalesPeople values 
(1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10)
;
select * from SalesPeople ;

 create table if not exists Customers (
 Cnum int not null, 
 Cname  varchar(25) not null,
 City varchar (25) not null,
 Snum int (10) not null,
 primary key(Cnum),
 foreign key (Snum) references SalesPeople(Snum)
 );
 desc Customers;
insert into Customers values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);
select * from customers ;
 
create table if not exists Orders (
Onum int not null,
Amt decimal (7,2) not null,
Odate date not null default '00-00-0000' ,
Cnum int not null,
Snum int not null,
primary key(Onum),
foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);
--drop table Orders;
desc Orders;

insert into Orders values 
(3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
(3008,4273.00,'1990-10-05',2006,1001),
(3010,1309.95,'1990-10-06',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001)
;
Select * from Orders;
select count(Sname) from  SalesPeople where Sname like  '^A' and '^a' ;
select Snum from Orders group by Snum having sum(Amt)>2000 ;
select count(Sname) from SalesPeople where City like 'Newyork' ;
select count(Sname) from SalesPeople where City like 'London' or City like 'Paris';
use company;
select Snum,Odate,count(*) from orders group by Odate,Snum ;






