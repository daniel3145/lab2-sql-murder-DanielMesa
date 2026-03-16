-- 1. Busqué el reporte del crimen ocurrido el 15 de enero de 2018 en SQL City.
-- Esta consulta me permitió encontrar la descripción del asesinato y descubrir que existen dos testigos.
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City'
AND type = 'murder';


-- 2. Según el reporte, uno de los testigos vive en Northwestern Dr.
-- Busqué a la persona que vive en esa calle y tomé el último número de dirección.
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;


-- 3. Consulté la entrevista del testigo Morty Schapiro para obtener pistas sobre el asesino.
SELECT *
FROM interview
WHERE person_id = 14887;


-- 4. La entrevista indica que el sospechoso es miembro del gimnasio Get Fit Now
-- y que su membresía empieza con "48Z".
SELECT *
FROM get_fit_now_member
WHERE id LIKE '48Z%';


-- 5. Verifiqué qué miembros con esas características fueron al gimnasio el 9 de enero.
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109;


-- 6. El reporte también menciona un segundo testigo llamado Annabel
-- que vive en Franklin Ave.
SELECT *
FROM person
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave';


-- 7. Revisé la entrevista de Annabel Miller para confirmar más detalles sobre el sospechoso.
SELECT *
FROM interview
WHERE person_id = 16371;


-- 8. Con la información obtenida, investigué al sospechoso Jeremy Bowers.
SELECT *
FROM person
WHERE name = 'Jeremy Bowers';


-- 9. Revisé la entrevista de Jeremy Bowers donde confiesa haber sido contratado
-- y describe a la persona que planeó el asesinato.
SELECT *
FROM interview
WHERE person_id = 67318;


-- 10. Según la confesión, la autora intelectual es una mujer pelirroja
-- que conduce un Tesla Model S.
SELECT *
FROM drivers_license
WHERE hair_color = 'red'
AND car_make = 'Tesla'
AND car_model = 'Model S';


-- 11. Jeremy también indicó que la persona asistió al evento SQL Symphony Concert
-- tres veces en diciembre de 2017.
SELECT *
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date LIKE '201712%';


-- 12. Después de cruzar la información de las tablas anteriores,
-- identifiqué que la autora intelectual del crimen es Miranda Priestly.
INSERT INTO solution VALUES (1, 'Miranda Priestly');

SELECT value FROM solution;