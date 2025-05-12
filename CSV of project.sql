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
SELECT COUNT(*) AS FirstOwnerCars
FROM cars
WHERE Owner = 'First Owner';

-- 2) What is the average price of Diesel cars?
SELECT AVG(selling_price) AS AvgDieselPrice
FROM cars
WHERE fuel = 'Diesel';

-- 3) List all Petrol cars with kilometers less than 100000.
SELECT * FROM cars
WHERE fuel = 'Petrol' AND km_drive < 100000;

-- 4) What is the total number of cars for each make?
SELECT brand, COUNT(*) AS TotalCars
FROM cars
GROUP BY brand;

-- 5) Which cars have a price higher than the average price of all cars?
SELECT * FROM cars
WHERE selling_price > (
    SELECT AVG(selling_price)
    FROM cars);
    
-- 6) total number of brand
SELECT COUNT(DISTINCT brand) AS TotalBrands
FROM cars;



