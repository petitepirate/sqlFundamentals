--Find all active students

-- Create a simple SELECT query to display student information of all ACTIVE students.

-- TABLE STRUCTURE:

-- students
-- Id	FirstName	LastName	IsActive

-- Note: IsActive (true or false)


-- Type your query here
SELECT Id, FirstName, LastName, IsActive
FROM students
WHERE IsActive = true;   -- ACTUAL answer is WHERE IsActive;   Flawed Kata.  WHERE IsActive IS true; should also work
