-- clean the data
select * from salaries;

 -- Delete unwanted columns
 ALTER TABLE salaries
DROP COLUMN Benefits;

 ALTER TABLE salaries
DROP COLUMN Notes;

ALTER TABLE salaries
DROP COLUMN Status;

-- check for the data type of the data
desc salaries;

-- change the data type of columns with incorrect data type
alter table salaries
modify column BasePay float;

alter table salaries
modify column OtherPay float;

alter table salaries
modify column OvertimePay float;

-- delete empty rows 
delete from salaries
where BasePay = 0;

delete from salaries
where overtimepay = 0;


DELETE FROM salaries
WHere id = 36199;

-- 1. what is the average basepay
select avg(basepay) from salaries;

-- 2.  what is the highest amount of overtime pay
select max(overtimepay) from salaries;

-- 3. who has the highest amount of overtime pay
select * from salaries
order by OvertimePay desc
limit 1; 

-- 4. what is the job title of Joseph driscoll --
select jobtitle from salaries
where  EmployeeName regexp 'joseph driscoll';

-- 5. how much does Joseph driscoll make
select basepay + overtimepay + otherpay + totalpay + totalpaybenefits
from salaries
where employeename = 'joseph driscoll';

-- 6. Who is the highest paid person by total benefit
select EmployeeName, max(TotalPayBenefits) from salaries
group by EmployeeName, TotalPayBenefits
having TotalPayBenefits = max(TotalPayBenefits)
limit 1;

-- 7. what is the name of the person with the lowest paid person by total benefits
select EmployeeName, TotalPayBenefits from salaries
order by TotalPayBenefits asc
limit 1;

-- 8. what is the average basepay of employee per year
select currentyear, avg(basepay) as average_basepay_peryear from salaries
group by  currentyear ;

-- 9. what are the five most common jobs
select jobtitle, count(jobtitle) as count_of_jobtitle from salaries
group by jobtitle
order by count(jobtitle) desc
limit 5;

-- 10. how many unique job titles are in the dataset
SELECT COUNT(DISTINCT jobtitle) AS num_unique_job_titles
FROM salaries;

-- 11. how many job titles are represeted by only 1 person in 2013
 select count(*)
 From(select  jobtitle, count(jobtitle) from salaries
group by currentYear, jobtitle
having count(JobTitle) = 1 and currentYear = 2013) AS tvv;

 

