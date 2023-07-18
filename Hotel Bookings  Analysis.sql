-- Finding the total number of guest we have per weekend_nights and week night


SELECT 
    SUM(stays_in_week_nights) AS Totalstays_per_weeknight,
    SUM(stays_in_weekend_nights) AS Totalstays_per_weekendnight
FROM hotel_bookings
WHERE stays_in_week_nights <> 0 AND stays_in_weekend_nights <> 0 ;

-- finding the number of repeated guest per year
SELECT 
		SUM(is_repeated_guest) AS total_number_of_repeated_guest,
        arrival_date_year
FROM hotel_bookings
WHERE is_repeated_guest = 1
GROUP BY arrival_date_year;

/*Finding the total number of guest per year*/
SELECT
	COUNT(*) AS Total_guests,
 arrival_date_year
FROM hotel_bookings
GROUP BY arrival_date_year
ORDER BY Total_guests;

/*Finding the country where most guests are coming from*/
SELECT 
	COUNT(*) AS total_guests,
    Country
FROM hotel_bookings
GROUP BY country
ORDER BY total_guests DESC;

/*Finding the total_number_of cancellation per year*/
SELECT
	SUM(previous_cancellations) AS total_cancellations,
    arrival_date_year
FROM hotel_bookings
WHERE previous_cancellations != 0
GROUP BY  arrival_date_year
ORDER BY total_cancellations;
