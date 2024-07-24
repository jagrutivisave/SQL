select mode, count(amount) as total
from payment
group by mode
having count(amount)>= 4


select mode, count(amount) as total
from payment
group by mode
having count(amount)>= 4

SELECT mode, COUNT(amount) AS total
FROM payment
GROUP BY mode
HAVING COUNT(amount)>2 AND COUNT(amount)=3
ORDER BY total DESC


SHOW TIMEZONE
SELECT NOW()
SELECT TIMEOFDAY()
SELECT CURRENT_TIME
SELECT CURRENT_DATE

SELECT extract(day from payment_date) as payment_month
FROM payment

select c.amount, d.email
from payment as c
inner join customer as d
on d.customer_id = c.customer_id

select * 
from customer as c
right join payment as p
on c.customer_id = p.customer_id

select * 
from customer as c
left join payment as p
on c.customer_id = p.customer_id

 select * 
	 from emp as t1
join emp as t2
on t2.empid = t1.managerid


select t1.empname as employee_name, t2.empname as manager_name  
from emp as t1
join emp as t2
on t2.empid = t1.managerid

select name, age from test1 as total
union
select empname, empid from emp as total


select name from test1 as total
union all
select empnamefrom emp as total 



1)  select avg(amount) from payment

2)  select * from payment
where amount > 48
	
3)  select * from payment
where amount > (select avg(amount) from payment) - sub query



select id, category,
sum(id) over(order by id rows between unbounded preceding and unbounded following) as Total,
avg(id) over(order by id rows between unbounded preceding and unbounded following) as Average,
count(id) over(order by id rows between unbounded preceding and unbounded following) as totalCount,
min(id) over(order by id rows between unbounded preceding and unbounded following) as Minimum,
max(id) over(order by id rows between unbounded preceding and unbounded following) as Maximum
from windowfun


select id, category,
row_number() over(order by id) as rowno,
rank() over(order by id ) as "rank",
dense_rank() over(order by id ) as denserank,
percent_rank() over(order by id ) as percentr
from windowfun

select id, category,
first_value(id) over(order by id) as "first value",
last_value(id) over(order by id ) as "last value",
lead(id) over(order by id ) as "lead",
lag(id) over(order by id ) as "lag"
from windowfun

select category,
lead(category,2) over(order by category ) as "lead",
lag(category,2) over(order by category ) as "lag"
from windowfun

select customer_id, amount,
CASE
	WHEN amount = 50 THEN 'expensive'
	WHEN amount < 100 THEN 'chip'
	ELSE 'canbuy'
	END AS status
	from payment


select customer_id,
CASE amount
	WHEN 50 THEN 'expensive'
	WHEN 100 THEN 'chip'
	ELSE 'canbuy'
	END AS status
	from payment	


	select customer_id,
CASE mode
	WHEN 'Cash' THEN 'expensive'
	WHEN 'Credit card' THEN 'chip'
	ELSE 'canbuy'
	END AS status
	from payment



the data will only display with the syntax for temporary

WITH mycte AS (
	SELECT *, avg(amount) OVER(ORDER BY p.customer_id) AS "avg price", 
	COUNT(address_id) OVER(ORDER BY c.customer_id) AS "count" 
	FROM payment AS p
	INNER JOIN customer AS c
	ON p.customer_id = c.customer_id
) 

select first_name, last_name
from mycte