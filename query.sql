create table employee(
	empid int8,
	name varchar(50),
	email varchar(50),
	mobno numeric,
	address varchar(50),
	salaary numeric
)
select*from employee

insert into employee( empid, name, email, mobno, address, salaary)
values
(17, 'sahili', 'sahili@gmail.com', 456363879, 'dhule', 50000)

update employee
set remark = 'E' 
where empid = 12 

alter table employee
add remark char

copy payments from 'D:\payment.csv'
	delimiter ','
	CSV HEADER;

	select * from payments 
	
create table payments(
	customer_id int8,
	amount numeric,
	mode varchar(50),
	payment_date date
)


copy student from 'D:\student_database.csv'
	delimiter ','
	CSV HEADER;

drop table student

create table students(
	id int8,
	name varchar(50),
	country varchar(50),
	city varchar(50),
	gender varchar(50),
	age int8,
	english float,
	math float,
	science float,
	language float
)
 select country from students where country like 'y%'
select length(city) from students

copy students from 'D:\student.csv'
delimiter ','
csv header;