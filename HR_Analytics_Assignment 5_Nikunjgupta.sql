create database hr_analytics;

use hr_analytics;

desc hr;

# [added primary key]
alter table hr
add primary key (EmployeeNumber);

select * from hr;
select * from hr limit 20;

# [viewing min, max, avg daily rate]
select 
min(DailyRate) as min_daily_rate,
max(DailyRate) as max_daily_rate,
avg(DailyRate) as avg_daily_rate from hr;


# [viewing min, max, avg distance from home]
select 
min(distancefromhome) as min_distance_from_home,
max(distancefromhome) as max_distance_from_home,
avg(distancefromhome) as avg_distance_from_home from hr;



# [counting no of employees in diff. departments]
select department, count(*) as frequency
from hr
group by department;


# [counting no of employees in diff. job roles]
select jobrole, count(*) as frequency
from hr
group by jobrole;


# [relation b/w job satisfaction and monthly income]
SELECT JobSatisfaction,
AVG(MonthlyIncome) AS avg_monthly_income
FROM hr
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


# [ relation b/w job satisfaction and daily rate ]
SELECT JobSatisfaction,
AVG(dailyrate) AS avg_daily_rate
FROM hr
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


# [ average tenure of employee in department ] 
select department,
round(avg(yearsatcompany), 3) as avg_tenure
from hr
group by department
order by avg_tenure;

desc hr;

# [ average tenure of employee in job role ] 
select jobrole,
round(avg(yearsatcompany), 3) as avg_tenure_in_company
from hr
group by jobrole
order by avg_tenure_in_company;


# [ average monthly income of employee in job role ] 
select jobrole,
round(avg(monthlyincome), 3) as avg_monthly_income
from hr
group by jobrole
order by avg_monthly_income desc;



# [ average monthly income of different education field ] 
select educationfield,
round(avg(monthlyincome), 3) as avg_monthly_income
from hr
group by educationfield
order by avg_monthly_income desc;


# [ analysed percent salary hike of diff. job roles and perfomance rating] 
select jobrole,
avg(percentsalaryhike) as avg_percent_salary_hike,
round(avg(PerformanceRating), 3) as avg_performance_rating,
round(avg(yearsatcompany), 3) as avg_tenure_in_company
from hr
group by jobrole
order by avg_percent_salary_hike desc;
