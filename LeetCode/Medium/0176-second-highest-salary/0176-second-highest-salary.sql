-- Write your PostgreSQL query statement below
-- order salary and rank in descending order, using window functions and return the salary where rank = 2


SELECT MAX(salary) as SecondHighestSalary from 
(SELECT 
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employee)
WHERE salary_rank = 2
