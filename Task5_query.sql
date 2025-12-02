-- Example 1

create table people (
    person_id serial primary key,
    name varchar(100) not null,
    age int not null
);

insert into people (name, age) values
('Maya', 5),     
('Alex', 30),    
('Robert', 68),  
('Sarah', 17),  
('Tom', 45);    

select * from people;

create or replace function age_group(p_age integer)
returns varchar as $$
declare
    age_category text;
begin
    if p_age <= 17 then
        age_category := 'Child'; 
    elsif p_age <= 45 then
        age_category := 'Adult'; 
    else
        age_category := 'Senior'; 
    end if;
    return age_category;
end;
$$ language plpgsql;

select age_group(12);

select age_group(40);

select age_group(70);

select name, age, age_group(age) as status_category from people;


-- Example 2

create table employees (
    employee_id serial primary key,
    name varchar(100) not null,
    salary decimal(10, 2) not null
);

insert into employees (name, salary) values
('jordan', 35000.00),
('kelly', 65000.00),
('david', 95000.00),
('chris', 50000.00),
('ava', 105000.00);

select * from employees;

create or replace function salary_status(p_salary numeric)
returns varchar as $$
declare
    s_status text;
begin
    if p_salary <= 40000 then
        s_status := 'low';
    elsif p_salary <= 80000 then
        s_status := 'medium';
    else
        s_status := 'high';
    end if;
    return s_status;
end;
$$ language plpgsql;


select salary_status(25000);

select salary_status(70000);

select salary_status(90000);


select name,salary,salary_status(salary) as status_category from employees;