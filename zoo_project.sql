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
   begin 
   execute immediate 'alter table animal_pr drop constraint animal_fk_1';
   exception when others then null;
   end;
   begin 
   execute immediate 'alter table employee_pr drop constraint employee_fk_2';
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

                                                               
--customer table creation
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
   begin 
   execute immediate 'alter table employee_pr drop constraint employee_fk_1';
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


--animal table creation
begin
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

--habitat table creation
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