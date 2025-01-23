SELECT 
    *
FROM
    ola_company.ola_company_rides;
-- Retrieve all ride details:
CREATE VIEW all_ride AS
    SELECT 
        *
    FROM
        ola_company_rides;

-- Filter completed rides only:

CREATE VIEW completed_rides AS
    SELECT 
        *
    FROM
        ola_company_rides
    WHERE
        Ride_Status = 'Completed';
SELECT 
    *
FROM
    completed_rides;

-- Find rides with fare over ₹1000

CREATE VIEW rides_with_fare_over_1000 AS
    SELECT 
        *
    FROM
        ola_company_rides
    WHERE
        Fare_Amount > 1000;
 
 -- 4.	Total number of rides per city
 
CREATE VIEW rides_per_city AS
    SELECT 
        Pickup_Location, COUNT(Pickup_Location) AS PickupCount
    FROM
        ola_company_rides
    GROUP BY Pickup_Location;
 
 -- Average fare collected from completed rides   

CREATE VIEW Average_fare_collected_from_completed_rides AS
    SELECT 
        AVG(Fare_Amount) AS Average_Amt
    FROM
        ola_company_rides
    WHERE
        Ride_Status = 'Completed';
         
    -- 	Retrieve rides on a specific date:
    
CREATE VIEW rides_on_a_specific_date AS
    SELECT 
        *
    FROM
        ola_company_rides
    WHERE
        Ride_Date = '1/18/2024';
 
  -- 	Find rides during peak hours (e.g., 6 PM to 10 PM):
  
CREATE VIEW rides_during_peak_hours AS
    SELECT 
        *
    FROM
        ola_company_rides
    WHERE
        CAST(Pickup_Time AS TIME) BETWEEN '18:00:00' AND '22:00:00';
 
    -- Highest-rated driver for completed rides:    

CREATE VIEW Highest_rated_driver AS
    SELECT 
        Driver_ID,
        AVG(Rating) AS Average_Rating,
        COUNT(Ride_ID) AS Completed_Rides
    FROM
        Ola_Company_Rides
    WHERE
        Ride_Status = 'Completed'
    GROUP BY Driver_ID
    ORDER BY Average_Rating DESC
    LIMIT 1;

-- Payment methods used most frequently
CREATE VIEW Payment_methods_used_most_frequently AS
    SELECT 
        Payment_Method, COUNT(Payment_Method)
    FROM
        Ola_Company_Rides
    GROUP BY Payment_Method
    ORDER BY Payment_Method
    LIMIT 1;
 
-- Combine driver and customer details with ride details (Assumes separate Drivers and Customers tables):

CREATE VIEW Combine_driver_and_customer_details_with_ride_details AS
    SELECT 
        Driver_ID, Customer_ID, Ride_ID, Ride_Status, Ride_Date
    FROM
        Ola_Company_Rides;
