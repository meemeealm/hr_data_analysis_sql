-- show the number of employee records --
SELECT COUNT(*)
FROM hr_data;

-- add a new column 'email' --
ALTER TABLE hr_data
ADD email varchar(50);

-- EDUCATION --
-- show the education of employees --
SELECT distinct (education)
FROM hr_data;

-- show the departments --
SELECT distinct (department)
FROM hr_data;

-- show the departments with below secondary education --
SELECT DISTINCT department
FROM hr_data
WHERE education = 'Below Secondary';

-- show the departments with Master's and above education --
SELECT DISTINCT department
FROM hr_data
WHERE education = "Master's & above";

-- GENDER DISTRIBUTION --
SELECT gender,COUNT(gender)
FROM hr_data
GROUP BY gender;

-- Gender Distritbution across the departments"
SELECT department,
	COUNT(CASE WHEN gender='m' THEN 1 END) AS Male,
    COUNT(CASE WHEN gender='f' THEN 1 END) AS Female
FROM hr_data
GROUP BY department
ORDER BY department;

-- Recruitment Channels based on Education -- 
SELECT education,
	COUNT(CASE WHEN recruitment_channel='sourcing' THEN 1 END) AS Sourcing,
    COUNT(CASE WHEN recruitment_channel='other' THEN 1 END) AS Other,
    COUNT(CASE WHEN recruitment_channel='referred' THEN 1 END) AS Referrals
FROM hr_data
GROUP BY education
ORDER BY education;

-- Age by Departments --
SELECT department,
	COUNT(CASE WHEN age < 25 THEN 1 END) AS Youth,
    COUNT(CASE WHEN age >25 AND age<35 THEN 1 END) AS Adults,
    COUNT(CASE WHEN age >= 36 THEN 1 END) AS Seniors
FROM hr_data
GROUP BY department
ORDER BY department;

-- GENDER BY POSITIONS (JOINING TABLES) --
SELECT DISTINCT t.position,
	COUNT(CASE WHEN h.gender='m' THEN 1 END) AS Male,
    COUNT(CASE WHEN h.gender='f' THEN 1 END) AS Female
FROM hr_data AS h
RIGHT JOIN hr_positions AS t ON h.employee_id = t.employee_id
GROUP BY position
ORDER BY position ASC;