SELECT COUNT(*) FROM film
WHERE length >
(
SELECT AVG(length) FROM film
);


SELECT COUNT(*) FROM film
WHERE rental_rate =
(
SELECT MAX(rental_rate) FROM film
);


SELECT * FROM film
WHERE rental_rate = 
(
SELECT MIN(rental_rate) FROM film
)
AND replacement_cost = 
(
SELECT MIN(replacement_cost) FROM film
);


SELECT customer_id, 
(
SELECT first_name FROM customer
WHERE payment.customer_id = customer.customer_id
),
(
SELECT last_name FROM customer
WHERE payment.customer_id = customer.customer_id
),
COUNT(customer_id) AS shopping_count FROM payment
GROUP BY customer_id
ORDER BY shopping_count DESC;