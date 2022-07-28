SELECT 
COUNT(elevators.id) AS elevator,
customers.id
FROM 
elevators 
JOIN columns ON elevators.column_id = columns.id 
JOIN batteries ON columns.battery_id = batteries.id 
JOIN buildings ON batteries.building_id = buildings.id 
JOIN customers ON buildings.customer_id = customers.id
GROUP BY 
customers.id
