/*7 day rolling average*/
SELECT ds, time_spent, avg(time_spent) over(order by ds rows between 6 preceding and current row) as Rolling_average
FROM `metric-analysis`.`sql project-1 table - sheet1`
order by ds;


/*Duplicate values*/
SELECT job_id, count(*) as Duplicate_values
FROM `metric-analysis`.`sql project-1 table - sheet1`
group by job_id
having count(*)>1;


/*Number of jobs*/
SELECT ds, count(*) as no_of_jobs
FROM `metric-analysis`.`sql project-1 table - sheet1`
where ds between '2020-11-01' and '2020-11-30'
group by ds;


/*Percentage share*/
SELECT language, count(*) * 100/(select count(*) FROM `metric-analysis`.`sql project-1 table - sheet1`) as Percentage_Share
FROM `metric-analysis`.`sql project-1 table - sheet1`
group by language;


/*Total Email*/
SELECT week(occurred_at) as week, count(action) as total_email
FROM `metric-analysis`.`table-3 email_events`;


/*Weekly engagement per device*/
SELECT distinct week(occurred_at) as week, device, count(device) over(partition by device order by location) as wpd
FROM `metric-analysis`.`table-2 events`;


/*Weekly user engagement*/
SELECT week(occurred_at) as week, count(event_type) as weekly_user
FROM `metric-analysis`.`table-2 events`
where event_type="engagement";


/*Weekly user sign up*/
SELECT week(occurred_at) as week, count(event_type) as user_signup
FROM `metric-analysis`.`table-2 events`
where event_type="signup_flow";