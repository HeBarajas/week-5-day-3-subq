create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR (50),
	address VARCHAR (50),
	state VARCHAR (50),
	zipcode VARCHAR (5)
);


-- alter statements
alter table customer
alter column zipcode type integer using zipcode::integer;

alter table customer
add column city VARCHAR(50);

select * from customer;
create table order_(
	prder_id SERIAl primary key,
	order_date timestamp default current_timestamp,
	amount numeric(5,2),
	cust_id integer,
	foreign key(cust_id) references customer(customer_id)
);

-- Insert data into customer table
insert into customer(
	first_name,
	last_name,
	email,
	address,
	city,
	state,
	zipcode
) values (
	'George',
	'Washington',
	'gwash@usa.gov',
	'3200 MT. Vernon HWY',
	'Mt. Vernon',
	'VA',
	22122
);

insert into customer(
 first_name, last_name, email, address, city, state, zipcode
) values ('John', 'Jashington', 'jwash@usa.gov', '33200 MT. Vernon HWY', 'Mt. Jernon', 'JA', 23122),
('Bob', 'Bashington', 'bwash@usa.gov', '12200 MT. Vernon HWY', 'Mt. Bernon', 'BA', 23122),
('Vohn', 'Vashington', 'Vwash@usa.gov', '23200 MT. Vernon HWY', 'Mt. Lernon', 'LA', 23122),
('Dohn', 'Dashington', 'Dwash@usa.gov', '43200 MT. Vernon HWY', 'Mt. Dernon', 'DA', 23122);

select * from customer;

select * from order_;

insert into order_(amount, cust_id)
values(99.99, 1);

insert into order_(amount, cust_id)
values(15.99, 2), (32.75, 2);

insert into order_(amount, cust_id)
values(55.55, 3), (32.23, null)

select * from order_

-- Long way withouth joins
select cust_id
from order_
where prder_id = 1 or prder_id = 4;

select email
from customer where customer_id in (1,3);

--using a join
 select *
 from order_
 join customer
 on order_.cust_id = customer.customer_id;
 
-- Inner Join
alter table order_ 
rename column cust_id to customer_id;

select customer_id, order_date, amount, first_name, last_name
from customer
inner join order_
ON customer.customer_id = order_.customer_id;

-- innder join with a group by
select order_.customer_id, customer.first_name, customer.last_name, sum(amount) as total_spent
from customer
join order_
on customer.customer_id = order_.customer_id
group by order_.customer_id, customer.first_name, customer.last_name
order by total_spent desc;
--having sum
--where first_name like %%%

--ALias table names
select c.first_name, c.last_name, o.order_date, o.amount
from customer as c
join order_ o
on c.customer_id = o.customer_id

--inner join
select *
from order_ o -- left table
join customer c -- right table
on c.customer_id = o.customer_id;

-- left join
select *
from customer c -- left table
left join order_ o -- right table
on c.customer_id = o.customer_id;

-- right join
select *
from customer c -- left table
right join order_ o -- right table
on c.customer_id = o.customer_id;v

--order matters
select *
from order_ o -- left table
right join customer c -- right table
on c.customer_id = o.customer_id;

--full join
select *
from order_ o -- left table
full join customer c -- right table
on c.customer_id = o.customer_id;