-- Write your PostgreSQL query statement below
-- Get name of manager by self join
select m.name
from employee e
join employee m
on e.managerId = m.id
-- Group by each manager id and count employee id >=5
group by e.managerId, m.name
having count(e.id)>=5