create database BMS;
use BMS;

#creating table for coustomer 
create table customer_personal_info(
customer_id varchar(10),
customer_name varchar(20),
DOB date,
gender char(1),
address varchar(20),
contact_no int(10),
ifsc_code int(5) ,
constraint fk_if foreign key(ifsc_code) references bank_infor(ifsc_code)
);

#bank info
create table bank_infor(
ifsc_code int(5) primary key ,
bank_name varchar(10),
branch_name varchar(25));

#account 
create table account(
customer_id int(10),
balance  int (10));

-- describe the table 
describe bank_infor;
describe customer_personal_info;

-- Alter table 
alter table bank_infor add address varchar(30);
alter table bank_infor drop branch_name ;
alter table bank_infor modify ifsc_code int  not null;
alter table bank_infor rename column address to bra_name;
alter table customer_personal_info  rename to customer;
#add column
alter table customer add ifsc_code int ;
alter table account add bank_name varchar(25);


# insert the value into the table
insert into customer values(1,"arun","1990-09-12","M","chennai",1245789,13579);
insert into customer values 
(2,"rocky","1989-10-15","M","chengalpattu",23498015,24680),
(3,"harini","2000-01-21","F","thambaram",98302382,34521),
(4,"priya","2001-02-14","F","chengalpattu",90364810,24680);
insert into customer values 
(5,"deepak","2002-07-24","M","chengalpattu",90856731,24680),
(6,"pragadeesh","2001-09-12","M","chennai",934276891,13579),
(7,"saranaya","2001-08-24","F","thambaram",87939419,34521),
(8,"kalaivani","2003-08-02","F","thambaram",87345691,34521);
insert into customer (customer_id,customer_name,DOB,gender,address,contact_no)values (9,"siva","2003-09-15","M","chengalpattu",893792);

insert into bank_infor values( 13579,"HDFC","chennai");
insert into bank_infor values( 24680,"SBI","chengalpattu"),
(34521,"IOB","Thambaram");
insert into bank_infor (bank_name,ifsc_code) values ("IOBS",15345);

insert into account values ( 1,129033,"IOB");
insert into account values (2,12000, "HDFS");
insert into account values (3,13500,"IOB"),
(4,40000,"SBI"),
(5,35000,"HDFS"),
(6,20000,"SBI"),
(7,300000,"IOBS"),
(8,2300,"IOBS");

#show the table values
select * from customer;
select * from bank_infor;

#ALIAS
select balance, balance*12 as total from account; 

#DISTINCT
select  distinct bra_name from bank_infor;
select distinct address from  customer;

#where clause
select * from customer where customer_name = "arun";
select address from customer where customer_id =4 ;
select customer_name,address from customer where customer_id>2;

#LOGIC OPERATOR 
#AND
select * from customer where  customer_id=1 and customer_name ="arun";
select * from customer where  customer_id=2 and customer_name="rocky";

#OR
select * from customer where customer_id=2 or customer_id=10;
select * from  customer where customer_name="arun" or customer_name ="jacob";

#NOT
select * from customer where not customer_id =2;
select * from customer where not gender ="M";

#IN operator
select customer_id,customer_name,address from customer where address in ("chennai");

#NOTIN  operator
select * from customer where address not in ("thambaram");

#BETWEEEN
select * from customer where customer_id between 1 and 5;

#NOTBETWEEN 
select * from customer where customer_id not between 2 and 4 ;

#NULL
select * from customer where customer_id is null;

#NOT NULL
select * from customer where customer_name is not null;

#like 
#name start with H 
select * from customer where customer_name like "h%";

#name end with a
select * from customer where customer_name like "%a";

#name contain i 
select * from customer where customer_name like "%i%";

#name contain 2a
select * from customer where customer_name like "%a%a";

#name contain second character a
select * from customer where customer_name like "_a%";

#name contain secont last character n
select * from customer where customer_name like "%n_";

#name start with k and end with i 
select * from customer where customer_name like "k%" and customer_name like "%i";

#NOT LIKE
select * from customer where customer_name not like "%i%";

#FUNCTIONS
#multirow function
#max
select max(balance) from account;

#min
select min(balance) from account;

#sum
select sum(balance) from account;

#count
select count(*) from customer  where address ="chennai";

#single row function
#lower
select lower(customer_name)from customer;

#upper
select upper(customer_name)from customer;

#reverse
select reverse (customer_name)from customer;

#length
select length(customer_name)from customer;

#JOINS

#INNER JOIN
select customer.customer_id,customer.customer_name, customer.gender,bank_infor.bank_name
from customer inner join bank_infor on customer.ifsc_code = bank_infor.ifsc_code;

#LEFT JOIN
select customer.customer_id,customer.customer_name, customer.gender,bank_infor.bank_name 
from customer left join bank_infor on customer.ifsc_code = bank_infor.ifsc_code;

#RIGHT JOIN
select customer.customer_id,customer.customer_name, customer.gender,bank_infor.bank_name
from customer right join bank_infor on customer.ifsc_code = bank_infor.ifsc_code;

#ORDER BY
select * from customer order by customer_name desc;
select * from customeR where address = "chennai" order by customer_name;
select * from bank_infor order by branch_name;
select * from bank_infor where bank_name = "sbi" order by branch_name;

#GROUP BY  clause

select min(balance) from account group by bank_name;
select max(balance) from account group by bank_name;
select sum(balance) from account  group by bank_name;
select count(*) from account  group by bank_name;

# LIMIT and OFFSET 
select * from customer  limit 1 offset 1;

#end of project 
#bank  database management
#*********************************************THE END************************************************************#