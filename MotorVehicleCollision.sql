-- Query 1
-- What are the most common times and days of the week for alcohol-related motor vehicle incidents?
-- This query aims to identify high-risk times and days for alcohol-related motor vehicle incidents
-- Part 1 Original
SELECT
DAYNAME(collision_data.Crash_Date) AS day_of_week,
HOUR(collision_data.Crash_Time) AS hour_of_day,
COUNT(*) AS incident_count
FROM
collision_data
JOIN
vehicle ON collision_data.Collision_ID = vehicle.Collision_ID
JOIN
driver_contributing_factors ON vehicle.Vehicle_ID =
driver_contributing_factors.Vehicle_ID
WHERE
driver_contributing_factors.Contributing_Factor_1 = 'Alcohol Involvement'
OR driver_contributing_factors.Contributing_Factor_2 = 'Alcohol Involvement'
GROUP BY
day_of_week, hour_of_day
ORDER BY
incident_count DESC;
-- Part 2 View
CREATE OR REPLACE VIEW most_common_incident_times AS
SELECT
DAYNAME(collision_data.Crash_Date) AS day_of_week,
HOUR(collision_data.Crash_Time) AS hour_of_day,
COUNT(*) AS incident_count
FROM
collision_data
JOIN
vehicle ON collision_data.Collision_ID = vehicle.Collision_ID
JOIN
driver_contributing_factors ON vehicle.Vehicle_ID =
driver_contributing_factors.Vehicle_ID
WHERE
driver_contributing_factors.Contributing_Factor_1 = 'Alcohol Involvement'
OR driver_contributing_factors.Contributing_Factor_2 = 'Alcohol Involvement'
GROUP BY
day_of_week, hour_of_day
ORDER BY
incident_count DESC;
-- Part 3 test view
-- This shows time of day crashes happens most often 
SELECT * FROM most_common_incident_times;

