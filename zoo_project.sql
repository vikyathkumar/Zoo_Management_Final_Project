set serveroutput on;
-- created a sequence
begin
    begin
    execute immediate 'create sequence customer_pk';
    exception when others then null;
    end;
    dbms_output.put_line('sequence customer_pk created');
end;
/

----creating tables and establishing constraints

--zoo_info table creation
begin
  begin
   execute immediate 'alter table ticket_pricing_pr drop constraint ticket_pricing_fk';
   exception when others then null;
   end;
<<<<<<< HEAD
   begin 
   execute immediate 'alter table animal_pr drop constraint animal_fk_1';
<<<<<<< HEAD
   exception when others then null;
   end;
   begin 
   execute immediate 'alter table employee_pr drop constraint employee_fk_2';
=======
   exception when others then null;
   end;
   begin 
   execute immediate 'alter table employee_pr drop constraint employee_fk_2';
=======
   begin
   execute immediate 'alter table zoo_department_pr drop constraint zoo_department_fk';
   exception when others then null;
   end;
   begin
   execute immediate 'alter table animal_pr drop constraint animal_fk';
   exception when others then null;
   end;
   begin
   execute immediate 'alter table department_pr drop constraint department_fk';
>>>>>>> 26b77bbdeaf0cbf5d596818c72c15ce6599c3b0f
>>>>>>> d284f76f407d6ec208ee65b78515c7d8cfbad0e0
   exception when others then null;
   end;
   begin
     execute immediate 'drop table zoo_info_pr';
  exception when others then NULL;
  end;
  execute immediate 'CREATE TABLE zoo_info_pr(zoo_id int,
                        zoo_name varchar(30) not null,
                        city varchar(30),
                        state varchar(30),
                        zip_code int,
                        constraint zoo_info_pk primary key (zoo_id))';
    dbms_output.put_line('table zoo_info_pr created');
end;
/

-- ticket_pricing table creation
begin
  begin
  execute immediate 'alter table transaction_pr drop constraint transaction_fk2';
  exception when others then null;
  end;
  begin
   execute immediate 'drop table ticket_pricing_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table ticket_pricing_pr(ticket_id int,
                                ticket_type varchar(30),
                                price int not null,
                                tp_zoo_id int not null,
                                constraint ticket_pricing_pk primary key (ticket_id),
                                constraint ticket_pricing_fk foreign key(tp_zoo_id) references zoo_info_pr(zoo_id),
                                constraint ticket_pricing_uk unique (tp_zoo_id,ticket_type))';
     dbms_output.put_line('table ticket_pricing_pr created');
end;
/

<<<<<<< HEAD
                                                               
--customer table creation
=======

--customer table
>>>>>>> 26b77bbdeaf0cbf5d596818c72c15ce6599c3b0f
begin
    begin
  execute immediate 'alter table transaction_pr drop constraint transaction_fk1';
  exception when others then null;
  end;
  begin
   execute immediate 'drop table customer_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table customer_pr(customer_id int default customer_pk.nextval,
                        first_name varchar(30) not null,
                        last_name varchar(30) not null,
                        sex varchar(30),
                        constraint customer_pk primary key(customer_id))';
    dbms_output.put_line('table customer_pr created');
end;
/


--transaction table creation
begin
  begin
   execute immediate 'drop table transaction_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table transaction_pr(transaction_id int,
                            date_of_transaction date,
                            ticket_id int,
                            ticket_count int,
                            total_amount int,
                            customer_id int,
                            constraint transaction_pk primary key (transaction_id),
                            constraint transaction_fk1 foreign key (customer_id) references customer_pr(customer_id),
                            constraint transaction_fk2 foreign key (ticket_id) references ticket_pricing_pr(ticket_id))';
    dbms_output.put_line('table transaction_pr created');
end;
/


--department table creation
begin
    begin
   execute immediate 'alter table zoo_department_pr drop constraint zoo_department_fk';
   exception when others then null;
   end;
<<<<<<< HEAD
   begin 
   execute immediate 'alter table employee_pr drop constraint employee_fk_1';
<<<<<<< HEAD
=======
=======
   begin
   execute immediate 'alter table employee_pr drop constraint employee_fk';
>>>>>>> 26b77bbdeaf0cbf5d596818c72c15ce6599c3b0f
>>>>>>> d284f76f407d6ec208ee65b78515c7d8cfbad0e0
   exception when others then null;
   end;
  begin
   execute immediate 'drop table department_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table department_pr(department_id int,
                            department_name varchar(30),
                            constraint department_pk primary key(department_id))';
    dbms_output.put_line('table department_pr created');
end;
/

/*drop table zoo_department_pr;
--zoo_department table
begin
  begin
   execute immediate 'drop table zoo_department_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table zoo_department_pr(zoo_dept_id int,
                                zoo_id int,
                                department_id int,
                                constraint zoo_department_pk primary key (zoo_dept_id),
                                constraint zoo_department_fk foreign key (department_id) references department_pr(department_id),
                                constraint zoo_department_uk unique(zoo_id,department_id))';
    dbms_output.put_line('table zoo_department_pr created');
end;
/*/

--employee table creation
begin
  begin
   execute immediate 'drop table employee_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table employee_pr(employee_id int,
                                first_name varchar(30),
                                last_name varchar(30),
                                date_of_birth date,
                                department_id int not null,
                                zoo_id int not null,
                                constraint employee_fk_2 foreign key (zoo_id) references zoo_info_pr(zoo_id),
                                constraint employee_pk primary key (employee_id),
                                constraint employee_fk_1 foreign key (department_id) references department_pr(department_id))';
    dbms_output.put_line('table employee_pr created');
end;
/


<<<<<<< HEAD
--habitat table 
begin
  begin 
    execute immediate 'alter table animal_pr drop constraint animal_fk_2';
    exception when others then null;
  end;
  begin
   execute immediate 'drop table habitat_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table habitat_pr(habitat_id int,
                                habitat_name varchar(30),
                                constraint habitat_pk primary key (habitat_id))';
    dbms_output.put_line('table habitat_pr created');
end;
/

--animal_kingdom table
begin
  begin 
    execute immediate 'alter table animal_pr drop constraint animal_fk_4';
    exception when others then null;
  end;
  begin
   execute immediate 'drop table animal_kingdom_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table animal_kingdom_pr(animal_kingdom_id int,
                                kingdom_name varchar(30),
                                constraint animal_kingdom_pk primary key (animal_kingdom_id))';
    dbms_output.put_line('table animal_kingdom_pr created');
end;
/

--nutrition table
begin
  begin 
    execute immediate 'alter table animal_pr drop constraint animal_fk_3';
    exception when others then null;
  end;
  begin
   execute immediate 'drop table nutrition_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table nutrition_pr(nutrition_id int,
                                nutrition_type varchar(30),
                                nutrition_cost int,
                                constraint nutrition_pk primary key (nutrition_id))';
    dbms_output.put_line('table nutrition_pr created');
end;
/


--animal table
begin
=======
--animal table creation
begin
<<<<<<< HEAD
=======
    begin
    execute immediate 'alter table habitat_pr drop constraint habitat_fk';
    exception when others then null;
    end;
    begin
    execute immediate 'alter table animal_kingdom_pr drop constraint animal_kingdom_fk';
    exception when others then null;
    end;
    begin
    execute immediate 'alter table nutrition_pr drop constraint nutrition_fk';
    exception when others then null;
    end;
>>>>>>> 26b77bbdeaf0cbf5d596818c72c15ce6599c3b0f
>>>>>>> d284f76f407d6ec208ee65b78515c7d8cfbad0e0
  begin
   execute immediate 'drop table animal_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table animal_pr(animal_id int,
                                animal_name varchar(30),
                                zoo_id int,
                                category varchar(30),
                                endangered_category varchar(30),
                                life_expectency int,
                                habitat_id int not null,
                                nutrition_id int not null,
                                animal_kingdom_id int not null,
                                constraint animal_fk_2 foreign key (habitat_id) references habitat_pr(habitat_id),
                                constraint animal_fk_3 foreign key (nutrition_id) references nutrition_pr(nutrition_id),
                                constraint animal_fk_4 foreign key (animal_kingdom_id) references animal_kingdom_pr(animal_kingdom_id),
                                constraint animal_pk  primary key (animal_id),
                                constraint animal_fk_1 foreign key (zoo_id) references zoo_info_pr(zoo_id),
                                constraint animal_uk unique(zoo_id,animal_name))';
    dbms_output.put_line('table animal_pr created');
end;
/

<<<<<<< HEAD


----inserting values into tables

--inserting into zoo_info_pr

insert into zoo_info_pr 
with name as (select 1,'Audubon Zoo', 'New Orleans','Louisiana',70118 from dual union all
                select 2,'Bronx Zoo','New York City','New York ',10460 from dual union all
                select 3,'Brookfield Zoo','Chicago','Illinois',60513 from dual union all
                select 4,'Cheyenne Mountain Zoo','Colorado Springs','Colorado',80906 from dual union all
                select 5, 'Cincinnati Zoo','Cincinnati','Ohio ',45220 from dual union all
                select 6, 'Columbus Zoo','Delaware County','Ohio ', 43065 from dual union all
                select 7,'Dallas Zoo','Dallas', 'Texas', 75203 from dual union all
                select 8, 'Denver Zoo', 'Denver', 'Coolorad', 80205 from dual union all
                select 9, 'Henry Doorly Zoo','Omaha','Nebraska',68107 from dual union all
                select 10, 'Zoo Miami', 'Miami', 'Florida', 33177 from dual union all
                select 11, 'National Zoo','Washington','DC', 20008 from dual union all
                select 12, 'Philadelphia Zoo','Centennial District','Philadelphia', 19104 from dual union all
                select 13, 'Saint Louis Zoo','St. Louis','Missouri',63110 from dual union all
                select 14, 'San Diego Zoo','San Diego',' California',92101 from dual) select * from name;


--inserting into ticket_pricing_pr
insert into ticket_pricing_pr values (1  , 'Adult', 25, 1 );
insert into ticket_pricing_pr values (2  , 'Adult', 40, 2);
insert into ticket_pricing_pr values (3  , 'Adult', 18, 3);
insert into ticket_pricing_pr values (4  , 'Adult', 25, 4);
insert into ticket_pricing_pr values (5 , 'Adult', 28, 5);
insert into ticket_pricing_pr values (6  , 'Adult', 22, 6);
insert into ticket_pricing_pr values (7  , 'Adult', 21, 7);
insert into ticket_pricing_pr values (8  , 'Adult', 20, 8);
insert into ticket_pricing_pr values (9  , 'Adult', 19, 9);
insert into ticket_pricing_pr values (10  , 'Adult', 23, 10);
insert into ticket_pricing_pr values (11  , 'Adult', 28, 11);
insert into ticket_pricing_pr values (12  , 'Adult', 24, 12);
insert into ticket_pricing_pr values (13  , 'Adult', 25, 13);
insert into ticket_pricing_pr values (14  , 'Adult', 62, 14);
insert into ticket_pricing_pr values (15  , 'Child', 20, 1 );
insert into ticket_pricing_pr values (16  , 'Child', 30, 2);
insert into ticket_pricing_pr values (17  , 'Child', 12, 3);
insert into ticket_pricing_pr values (18  , 'Child', 15, 4);
insert into ticket_pricing_pr values (19  , 'Child', 22, 5);
insert into ticket_pricing_pr values (20  , 'Child', 17, 6);
insert into ticket_pricing_pr values (21  , 'Child', 16, 7);
insert into ticket_pricing_pr values (22 , 'Child', 14, 8);
insert into ticket_pricing_pr values (23  , 'Child', 13, 9);
insert into ticket_pricing_pr values (24  , 'Child', 19, 10);
insert into ticket_pricing_pr values (25  , 'Child', 23, 11);
insert into ticket_pricing_pr values (26  , 'Child', 19, 12 );
insert into ticket_pricing_pr values (27  , 'Child', 20, 13);
insert into ticket_pricing_pr values (28  , 'Child', 52, 14);


--inserting into department_pr
insert all
 into department_pr values (1,'Veterinarian')

 into department_pr values ( 2, 'Animal Curator')

 into department_pr values ( 3, 'Zoologist')

 into department_pr values ( 4, 'Keeper')

 into department_pr values ( 5, 'Registrar')
 
 into department_pr values ( 6, 'Finance')
 
 into department_pr values ( 7, 'Gift Shop')
 
 into department_pr values ( 8, 'Visitor Services')
 
 into department_pr values ( 9, 'Security')

 into department_pr values ( 10, 'Food Court')
 
 into department_pr values ( 11, 'House Keeping')
 
 into department_pr values ( 12, 'IT')

 select 1 from dual;

--inserting into customer_pr
insert all
    into customer_pr values ( 1,'Meghan', 'Bower','F')
    into customer_pr values ( 2,'Melanie','Avery','F')
    into customer_pr values ( 3,'Abigail', 'Abraham','F')
    into customer_pr values ( 4, 'Adam' , 'Allan', 'M')
    into customer_pr values ( 5, 'Alexander', 'Alsop', 'M')
    into customer_pr values ( 6, 'Andrew', 'Anderson','M')
    into customer_pr values ( 7, 'Anthony', 'Bailey','M')
    into customer_pr values ( 8, 'Carolyn', 'Bower','F')
    into customer_pr values ( 9, 'Clarie', 'Bell', 'F')
    into customer_pr values ( 10, 'Carl', 'Buckland', 'F')
    into customer_pr values ( 11, 'Charles', 'Carr', 'M')
    into customer_pr values ( 12, 'Harry', 'Gibson', 'M')
    into customer_pr values ( 13, 'Zoe', 'Lawrance', 'F')
    into customer_pr values ( 14, 'John', 'Rutherford', 'M')
    into customer_pr values ( 15, 'Kevin', 'Sharp', 'M')
    into customer_pr values ( 16, 'Will', 'Young', 'M')
    into customer_pr values ( 17, 'Micheal', 'Jackson', 'M')
    into customer_pr values ( 18, 'Adien', 'Smith', 'M')
    into customer_pr values ( 19, 'Chris', 'Gayle', 'M')
    into customer_pr values ( 20, 'Kane', 'Willianson', 'M')
    into customer_pr values ( 21, 'Ellise', 'Perry', 'F')
    into customer_pr values ( 22, 'Racheal', 'Mackay', 'F')
    into customer_pr values ( 23, 'Mitchel', 'Marsh', 'M')
    into customer_pr values ( 24, 'Sanjay', 'Gandhi', 'M')
    into customer_pr values ( 25, 'Sanjay', 'Dutt', 'M')
    into customer_pr values ( 26, 'Natalie', 'MacDonald', 'F')
    into customer_pr values ( 27, 'Olivia', 'Manning','F')
    into customer_pr values ( 28, 'Sophie','Miller','F')
    into customer_pr values ( 29, 'Pippa', 'Dowd','F')
    into customer_pr values ( 30, 'Ricky', 'Ponting', 'M')
    into customer_pr values ( 31, 'Priyanka', 'Gandhi', 'F')
    into customer_pr values ( 32, 'Shane', 'Warne', 'M')
    into customer_pr values ( 33, 'Adam', 'Gilchrist', 'M')
    into customer_pr values ( 34, 'Lesllie', 'Winkle', 'F')
    into customer_pr values ( 35, 'Gavin', 'Jones', 'M')
    into customer_pr values ( 36, 'Jake', 'Keller', 'M')
    into customer_pr values ( 37, 'Isaac', 'Newton', 'M')
    into customer_pr values ( 38, 'Mitchel', 'Johnson', 'M')
    into customer_pr values ( 39, 'Sarah', 'Randling', 'M')
    into customer_pr values ( 40, 'Samantha', 'Paterson', 'M')
    into customer_pr values ( 41, 'Stuart', 'Anderson', 'M')
    into customer_pr values ( 42, 'Mary', 'Peters', 'F')
    into customer_pr values ( 43, 'Meghan', 'Powel', 'F')
    into customer_pr values ( 44, 'Olivia', 'Henderson', 'F')
    into customer_pr values ( 45, 'James', 'Anderson', 'M')
    into customer_pr values ( 46, 'Joe', 'Root', 'M')
    into customer_pr values ( 47, 'Sophie', 'Bell', 'F')
    into customer_pr values ( 48, 'Sanath', 'Jayasurya', 'M')
    into customer_pr values ( 49, 'Wendy', 'Lee', 'F')
    into customer_pr values ( 50, 'Maria', 'Martin', 'F')
    into customer_pr values ( 51, 'Jennier', 'Lopez', 'F')
    into customer_pr values ( 52, 'Grace', 'Swift', 'F')
    into customer_pr values ( 53, 'Theresa', ' Payne', 'F')
    select 1 from dual;
=======
<<<<<<< HEAD
--habitat table creation
=======
--habitat table
>>>>>>> 26b77bbdeaf0cbf5d596818c72c15ce6599c3b0f
begin
  begin 
    execute immediate 'alter table animal_pr drop constraint animal_fk_2';
    exception when others then null;
  end;
  begin
   execute immediate 'drop table habitat_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table habitat_pr(habitat_id int,
                                habitat_name varchar(30),
                                constraint habitat_pk primary key (habitat_id))';
    dbms_output.put_line('table habitat_pr created');
end;
/

--animal_kingdom table creation
begin
  begin 
    execute immediate 'alter table animal_pr drop constraint animal_fk_4';
    exception when others then null;
  end;
  begin
   execute immediate 'drop table animal_kingdom_pr';
  exception when others then
   NULL;
  end;
  execute immediate 'create table animal_kingdom_pr(animal_kingdom_id int,
                                kingdom_name varchar(30),
                                constraint animal_kingdom_pk primary key (animal_kingdom_id))';
    dbms_output.put_line('table animal_kingdom_pr created');
end;
/

--nutrition table  creation
begin
  begin 
    execute immediate 'alter table animal_pr drop constraint animal_fk_3';
    exception when others then null;
  end;
  begin
   execute immediate 'drop table nutrition_pr';
<<<<<<< HEAD
=======

>>>>>>> 26b77bbdeaf0cbf5d596818c72c15ce6599c3b0f
  exception when others then
   NULL;
  end;
  execute immediate 'create table nutrition_pr(nutrition_id int,
                                nutrition_type varchar(30),
                                nutrition_cost int,
                                constraint nutrition_pk primary key (nutrition_id))';
    dbms_output.put_line('table nutrition_pr created');
end;
/
>>>>>>> d284f76f407d6ec208ee65b78515c7d8cfbad0e0
