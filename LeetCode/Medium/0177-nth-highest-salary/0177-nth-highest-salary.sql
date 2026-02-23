CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY
  SELECT MAX(sr.salary) 
  FROM (
      SELECT e.salary,
             DENSE_RANK() OVER (ORDER BY e.salary DESC) AS salary_rank
      FROM Employee e
  ) sr
  WHERE sr.salary_rank = N;
END;
$$ LANGUAGE plpgsql;
