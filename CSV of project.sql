use mwf_evening;

create table cars(
brand varchar(30),
km_drive int,
fuel varchar(15),
owner varchar(20),
selling_price int);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cars.csv'
into table cars
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
set global local_infile = 1;
show variables like "secure_file_priv";

select * from cars;
-- 1) How many cars are First Owner?
SELECT COUNT(*) AS FirstOwnerCars FROM cars
WHERE Owner = 'First Owner';

-- 2) What is the average price of Diesel cars?
SELECT AVG(selling_price) AS AvgDieselPrice FROM cars
WHERE fuel = 'Diesel';

-- 3) List all Petrol cars with kilometers less than 100000.
SELECT * FROM cars
WHERE fuel = 'Petrol' AND km_drive < 100000;

-- 4) What is the total number of cars for each make?
SELECT brand, COUNT(*) AS TotalCars FROM cars
GROUP BY brand;

-- 5) Which cars have a price higher than the average price of all cars?
SELECT * FROM cars
WHERE selling_price > 
(SELECT AVG(selling_price) FROM cars);
    
-- 6) total number of brand
SELECT COUNT(DISTINCT brand) AS TotalBrands
FROM cars;

-- 7) How many cars are there in the dataset?
SELECT COUNT(*) AS total_cars FROM cars;

-- 8) List all petrol cars sorted by price:
SELECT *FROM cars
WHERE fuel = 'Petrol'
ORDER BY selling_price ASC;

-- 9) Find the top 5 most expensive cars:
SELECT *FROM cars
ORDER BY selling_price DESC LIMIT 5;

-- 10) Which cars are from first owners and cost more than ₹500,000?
SELECT *FROM cars
WHERE owner = 'First Owner' AND selling_price > 500000;

-- 11) List brands with cars that have driven less than 10,000 km:
SELECT brand, km_drive FROM cars
WHERE km_drive < 10000;

-- 12)  What is the average price for each fuel type?
SELECT fuel, AVG(selling_price) AS avg_price
FROM cars
GROUP BY fuel;

-- 13) Show average kilometers driven by each ownership type:
SELECT owner,AVG(km_drive) AS avg_km
FROM cars
GROUP BY owner;

-- 14) What’s the highest and lowest price per brand?
SELECT brand, MAX(selling_price) AS max_price,MIN(selling_price) AS min_price
FROM cars 
GROUP BY brand;

-- 15) Find cars priced above the average selling price:
SELECT *FROM cars
WHERE selling_price > (SELECT AVG(selling_price) FROM cars);

-- 16) List cars that have the maximum price among all:
SELECT *FROM cars
WHERE selling_price = 
(SELECT MAX(selling_price) FROM cars);

-- 17) Which fuel type has the highest average resale value?
SELECT fuel FROM cars
GROUP BY fuel
ORDER BY AVG(selling_price) DESC
LIMIT 1;

-- 18) Find the cheapest car for each fuel type:
SELECT *FROM cars AS c
WHERE selling_price = (SELECT MIN(selling_price) FROM cars AS sub WHERE sub.fuel = c.fuel);

-- 19) Find all brands whose average price is more than the overall average price
SELECT brand FROM cars
GROUP BY brand HAVING AVG(selling_price) > (SELECT AVG(selling_price) FROM cars);

-- 20)Get the price difference between the most and least expensive car
SELECT (SELECT MAX(selling_price) FROM cars) - 
  (SELECT MIN(selling_price) FROM cars) AS price_range;

-- 21) Which cars have a below-average price but have also been driven below the average kilometers?
SELECT * FROM cars
WHERE selling_price < (SELECT AVG(selling_price) FROM cars) AND km_drive < (SELECT AVG(km_drive) FROM cars);

-- 32 different brands of cars.
-- there are 48768 cars in dataset
-- firstowner has 31734 cars.
-- most expensive car is volvo.
-- diesel has the highest average resale value.
-- avg prize of diesel cars is 791452.9216.
-- Most cars are from first owners.
-- Maruti is the most common brand.
-- Diesel cars are the most expensive on average.
-- Petrol cars are more affordable compared to diesel.
-- This project shows how fuel type, brand, and ownership affect car prices.










