# productBackend
PostgreSQL start up

run:
sudo apt update
sudo apt install postresql postgresql-contrib
sudo -i -u postgres 
createuser --interactive -P super 
- set password
- enable superuser
psql
\du
- Check to see if the user is listed in the Role Name column.
\l 
- list all databases
create database catwalkdb;
\c switch to a database

create table test_table(
pk SERIAL PRIMARY KEY,
name text,
age int,
address char(50)
);

select * from test_table;
- check to see if there are any rows.  There are none, so add one.
insert into test_table(name, age, address) values ('taylor',38,'broadway');
select * from test_table 

- there should be one row in there now.

Hop in to pgDatabase.js and make the modifications to password.
cd to pgDatabase folder
run node pgDatabase.js and ensure there is output.