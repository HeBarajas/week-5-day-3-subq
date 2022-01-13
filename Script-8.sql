--1. List all customers who live in Texas (use JOINs)
select  first_name, last_name, address, district
from address a
join customer c 
on a.address_id = c.customer_id
where district = 'Texas'
order by c.first_name ;
--2. Get all payments above $6.99 with the Customer’s full name
select first_name, last_name, amount
from payment p 
join customer c 
on p.customer_id = c.customer_id
where amount in (
select amount 
from payment
group by payment.amount 
having amount >= 6.99
)
order by amount asc;
--3. Show all customer names who have made payments over $175 (use subqueries)
select first_name, last_name
from customer
where customer_id in (
select customer_id
from payment
group by customer_id 
having sum(amount) > 175
order by sum(amount) desc
);
--4. List all customers that live in Nepal (use the city table)
select * from customer
where address_id = 326;
--66 Country, 81 City, 326 address
--5. Which staff member had the most transactions?
select p.staff_id, s.first_name, s.last_name, count(payment_id)
from payment p
join staff s
on p.staff_id = s.staff_id 
group by p.staff_id, s.first_name, s.last_name 
order by staff_id desc 
limit 1;
-- 2, 7304
--6. What film had the most actors in it?
select film_id, count(*) as total_actors
from film_actor fa 
group by film_id 
order by total_actors desc
limit 1;
--7. Which actor has been in the least movies?
select first_name, last_name, a.actor_id, count(*)
from actor a
join film_actor fa 
on a.actor_id = fa.actor_id
group by a.first_name, last_name, a.actor_id
order by count(*) asc;
--8. How many districts have more than 5 customers in it?
select a.district
from address a
join city c
on a.address_id = c.city_id 
join customer c2 
on c.city_id = c2.address_id
group by a.district
having count(*) > 5
order by count(a.district) asc;
 