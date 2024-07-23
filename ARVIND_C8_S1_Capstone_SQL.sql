use sakila;

-- Task 1--
select *  from actor ;
select concat(first_name,' ',last_name) as fullname from actor;


-- TASK 2.1 -- 
SELECT first_name, count(*) AS count
from actor
group by first_name
order by count desc;


-- TASk 2.2 
select count(*) as unique_first_name,first_name
from actor
group by first_name
having count(*) = 1;


-- TASK 3.1--
select last_name, COUNT(*) AS count
from actor
group by last_name
order by  count desc;


-- TASK 3.2--
select count(*) as unique_first_name, last_name
from actor
group by last_name
having count(*) = 1;


-- TASK 4.1 --
select title, rating from film 
where rating ='R';


-- TASK 4.2 --
select title as TITLE, rating from film 
where rating <>'R';


-- TASK 4.3 --

select title as TITLE, rating from film 
where rating ='G' or rating ='PG';


-- TASK 5.1 --
select title, replacement_cost from film
where replacement_cost <= 11
order by replacement_cost DESC;


-- TASK 5.2 --
select title, replacement_cost from film
where replacement_cost between 11 and 20
order by replacement_cost DESC;


-- TASK 5.3--
select title, replacement_cost from film
order by replacement_cost DESC;


-- TASK 6 --
select * from film;
select * from film_actor;

select F.title, count(FA.actor_id) as Actor_Count 
from film F join film_actor FA
on F.film_id = FA.film_id
group by F.film_id
order by Actor_Count
desc limit 3;


-- TASK 7 --
select title from film where title like'K%' or title like 'Q%'; 


-- TASK 8 --
select * from film;
select * from film_actor;
select * from actor;

select F.title, concat(A.first_name,'_',A.last_name) as Full_Name
from film F join film_actor FA 
on F.film_id  = FA.film_id 

join actor A
on A.actor_id = FA.actor_id 
where title ='Agent Truman';

-- TASK 9 --
select * from category;
select*from film;
select*from film_category;

select F.title
from film F join film_category FC
on F.film_id  = Fc.film_id 
join category C
on FC.category_id = C.category_id 
where name ='family';


-- TASK 10.1 --
select * from film;
select 
max(rental_rate) as Maximum_Rental_Rate ,
min(rental_rate) as Minimum_Rental_Rate,
avg(rental_rate) as Average_Rental_Rate from film
group by rating
order by Average_Rental_Rate desc ;

-- TASK 10.2--
select*from rental;
select*from film;
select*from inventory;

select F.title, count(R.rental_id) as RENT from film F
join inventory I 
on F.film_id = I.film_id

join rental R  
on R.inventory_id = I.inventory_id
group by F.film_id 
order by RENT desc;


-- TASK 11--
select*from category;
select*from film;
select * from  film_category;

select C.name as Category_Names, 
avg(F.replacement_cost) as Average_Replacement_Cost,
avg(F.rental_rate) as Average_Rental_Rate
from film F join film_category FC 
on F.film_id = FC.film_id

join category C 
on FC.category_id = C.category_id
group by C.name 
having (avg(f.replacement_cost) - avg(f.rental_rate)) > 15;


-- TASK 12  --
select*from category;
select*from film;
select * from  film_category;

select C.name as category_name, count(*) as Movie_Count
from film F join film_category FC 
on F.film_id = FC.film_id
join category c 
on FC.category_id = C.category_id
group by C.name
having Movie_Count > 70;




 
