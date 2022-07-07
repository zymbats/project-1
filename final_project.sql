# 1a. Выбрать все столбцы из таблицы actor (ограничить по 100 строкам).
SELECT * FROM actor
LIMIT 100;
# 1b. Выбрать только last_name из таблицы actor
SELECT last_name 
FROM actor;
# 1c. Выбрать только следующие столбцы из таблицы film:
SELECT
    title, 
    description, 
    rental_duration, 
    rental_rate, 
    rental_duration * rental_rate as total_rental_cost
FROM film;
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)

# ---------------------------------------------------------#

# 2a. Выбрать различные/уникальные фамилии из таблицы actor.
SELECT DISTINCT last_name
FROM actor;
# 2b. Выбрать различные/уникальные почтовые коды из таблицы address.
SELECT DISTINCT postal_code
FROM address;
# 2c. Выбрать различные/уникальные рейтинги из таблицы film.
SELECT DISTINCT rating
FROM film;
# ---------------------------------------------------------#

# 3a. Выбрать столбцы title, description, rating, length из таблицы film, которые длятся более 3 часа или более.
SELECT 
    title, 
    description, 
    rating, 
    length
FROM film
WHERE length >= 3 * 60; #Думаю тут длина в минутах, поэтому умножила.
# 3b. Выбрать столбцы payment_id, amount, payment_date из таблицы payment, где платежи были сделаны 05/27/2005 или позднее.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date >= '2005-05-27';
# 3c. Выбрать все столбцы из таблицы customer, где фамилии начинаются на S и имена заканчиваются на N.
SELECT * FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%n';
# 3d. Выбрать все столбцы из таблицы customer, где клиент является неактивным или его фамилия начинается на M.
SELECT * FROM customer 
WHERE active = 'null' AND last_name LIKE 'M%';
# 3e. Выбрать все столбцы из таблицы category, где первичный ключ больше 4 и столбец name начинается на C, S или T.
SELECT * FROM category
WHERE category_id > 4 AND name LIKE 'C%' OR name LIKE 'S%' OR name LIKE 'T%';
# 3f. Выбрать все столбцы за исключением столбца password из таблицы staff, где имеется значение password.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;
# ---------------------------------------------------------#

# 4a. Выбрать столбцы phone, district из таблицы address, которые находятся в California, England, Taipei, или West Java.
SELECT phone, district FROM address
WHERE district LIKE 'California' OR district LIKE 'England' OR district LIKE 'Taipei' OR district LIKE 'West Java';
# 4b. Выбрать столбцы payment_id, amount, и payment_date из таблицы payment, где платежи были выполнены 05/25/2005, 05/27/2005, 05/29/2005.
SELECT payment_id, amount,payment_date 
FROM payment
WHERE YEAR(payment_date) IN (2005) AND MONTH(payment_date) IN (05) AND DAY(payment_date) IN (25, 27, 29)
ORDER BY payment_date;
# 4c. Выбрать все столбцы из таблицы film, где рейтинг фильма является G, PG-13 или NC-17.
SELECT *
FROM film
WHERE rating IN ('G','PG-13' 'NC-17')
ORDER BY rating;
# ---------------------------------------------------------#

# 5a. Выбрать все столбцы из таблицы payment, где платежи были выполнены между 05/25/2005 и 05/26/2005.
SELECT * FROM payment
WHERE payment_date BETWEEN '2005-05-25' AND '2005-05-26';
# 5b. Выбрать только следующие столбцы из таблицы film, для фильмов у которых длина description между 100 и 120:
SELECT 
    title,
    description,
    release_year,
    rental_duration * rental_rate AS total_rental_cost
FROM film
WHERE length(description) BETWEEN 100 AND 120;

# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)
# ---------------------------------------------------------#
# 6a. Выбрать только следующие столбцы из таблицы film, где description начинается на "A Thoughtful":
# Title, Description, Release Year
SELECT title, description, release_year
FROM film 
WHERE description LIKE 'A Thoughtful%';
# 6b. Выбрать только следующие столбцы из таблицы film, где description заканчивается на слово "Boat".
# Title, Description, Rental Duration
SELECT title, description, rental_duration
FROM film 
WHERE description LIKE '%Boat';
# 6c. Выбрать только следующие столбцы из таблицы film, где description содержит слово "Database" и длина фильма больше 3-х часов.
# Title, Length, Description, Rental Rate
SELECT title, length, description, rental_rate
FROM film 
WHERE description LIKE '%Database%' AND length >= 3 * 60;
# ---------------------------------------------------------#

# 7a. Выбрать все столбцы из таблицы film и упорядочить строки относительно столбца length по возрастанию.
SELECT * 
FROM film 
GROUP BY length
ORDER BY length ASC;
# 7b. Выбрать различные (уникальные) рейтинги из таблицы film, отсортированный по столбцу rating по убыванию.
SELECT DISTINCT rating
FROM film 
GROUP BY rating
ORDER BY rating DESC;
# 7c. Выбрать столбцы payment_date, amount из таблицы payment (первые 20 строк) отсортированные по столбцу amount по убыванию.
SELECT payment_date, amount
FROM payment
GROUP BY amount
ORDER BY amount DESC
LIMIT 20;
# ---------------------------------------------------------#

# 8a. Выбрать столбцы customer first_name/last_name и actor first_name/last_name используя /left join/ 
# между таблицами customer и actor (ON имена и фамилии соответсвенных таблиц) 
# Переименуйте столбцы customer first_name/last_name как customer_first_name/customer_last_name
# Переименуйте столбцы actor first_name/last_name в том же стиле как сверху
# Должно быть 599 строк
SELECT
c.first_name AS customer_first_name,
c.last_name AS customer_last_name,
a.first_name AS actor_first_name,
a.last_name AS actor_last_name
FROM customer AS c
LEFT JOIN actor AS a ON (a.first_name=c.first_name) AND (a.last_name=c.last_name);

# 8b. Выполните тоже самое что и в 8а, только используйте /right join/ и посмотрите на разницу
# Должно быть 200 строк
SELECT
c.first_name AS customer_first_name,
c.last_name AS customer_last_name,
a.first_name AS actor_first_name,
a.last_name AS actor_last_name
FROM customer AS c
RIGHT JOIN actor AS a ON (a.first_name=c.first_name) AND (a.last_name=c.last_name);

# 8c. Выбрать те же столбцы что и в 8а, только используйте /inner join/ через фамилию (без имени)
# Должно быть 43 строки
SELECT
c.first_name AS customer_first_name,
c.last_name AS customer_last_name,
a.first_name AS actor_first_name,
a.last_name AS actor_last_name
FROM customer AS c
INNER JOIN actor AS a ON (c.last_name=a.last_name);

# 8d. Выбрать столбцы city, country из таблицы city, используя left join с таблицей country.
# Должно быть 600 строк
SELECT
city.city,
country.country
FROM city
LEFT JOIN country ON(city.country_id=country.country_id);

# 8e. Выбрать столбцы title, description, release_year, и language_name из таблицы film, используя left join с таблицей language.
# Должно быть 1000 строк
SELECT
film.title,
film.description,
film.release_year,
language.name AS language
FROM film
LEFT JOIN language ON (film.language_id=language.language_id);

# 8f. Выбрать столбцы first_name, last_name, address, address2, city name, district, и postal code из таблицы staff, используя 2 left join с таблицей address, а потом также с таблицей city.
# Должно быть 2 строки
SELECT
staff.first_name,
staff.last_name,
address.address,
address.address2,
address.district,
address.postal_code,
city.city
FROM staff
LEFT JOIN address ON (staff.address_id=address.address_id)
LEFT JOIN city ON (address.city_id=city.city_id);