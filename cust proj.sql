select * from customer

#1Q.
select gender,sum(purchased_amount) as revenue 
from customer
group by gender

#2Q.
select customer_id,purchased_amount 
from customer
where discount_applied='Yes' and purchased_amount>=(select avg(purchased_amount) from customer)

#3Q.
select item_purchased, round(avg(review_rating::numeric),2) as avg_prod_rating
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5

#4Q.
select shipping_type ,
round(avg(purchased_amount),2)
from customer
where shipping_type in('Express','Standard')
group by shipping_type

#5Q.
select subscription_status,
count(customer_id) as total_cust,
round(avg(purchased_amount),2) as avg_spend,
round(sum(purchased_amount),2) as total_revenue
from customer
group by subscription_status
order by avg_spend,total_revenue desc