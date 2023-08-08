create database HR_DIS;

use HR_DIS;

select * from `human resources`;

-- modify the data type and name of id
alter table `human resources`
change column id emp_id varchar(20) NULL;

describe `human resources`;


set sql_safe_updates = 0;
SET sql_mode='ONLY_FULL_GROUP_BY,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select birthdate from `human resources`;

-- to harmonize the birthdate format
update `human resources`
set birthdate = case
    when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
    else NULL
end;

-- modify the data type of birthdate
alter table `human resources`
modify column birthdate date;

describe `human resources`;

select birthdate from `human resources`;





select hire_date from `human resources`;

-- to harmonize the hire_date format
update `human resources`
set hire_date = case
    when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m-%d')
    else NULL
end;

-- modify the data type of hire_date
alter table `human resources`
modify column hire_date date;

describe `human resources`;

select hire_date from `human resources`;





select termdate from `human resources`;

-- to harmonize the termdate format
update `human resources`
set termdate = date(str_to_date(termdate, '%Y-%m-%d'))
where termdate is not null and termdate != '';

-- modify the data type of termdate
alter table `human resources`
modify column termdate date;

describe `human resources`;

select termdate from `human resources`;





alter table `human resources` add column age INT;

select * from `human resources`;

update `human resources`
set age = timestampdiff(year,birthdate,curdate());

select birthdate, age from `human resources`;

select count(*) from `human resources` where age < 18;

alter table `human resources`
modify column termdate text;

describe `human resources`;

select termdate from `human resources`;

update `human resources`
set termdate = '00-00-0000'
where termdate = '0000-00-00';

update `human resources`
set termdate = date_format(str_to_date('00-00-0000','%m-%d-%Y'), '%Y-%m-%d')
where termdate = '00-00-0000';

alter table `human resources`
modify column termdate date;