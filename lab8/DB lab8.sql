--Aleksandr Kim
--Laboratory work 8
---------------------------------------1
--a
CREATE OR REPLACE FUNCTION a(val integer) RETURNS integer AS $$
BEGIN
RETURN val + 1;
END; $$
LANGUAGE PLPGSQL;

select inc(20);

--b
CREATE OR REPLACE FUNCTION b(
a NUMERIC,
b NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
RETURN a + b;
END; $$
LANGUAGE plpgsql;

select get_sum(1, 10);

--c
CREATE OR REPLACE FUNCTION c(a NUMERIC)
RETURNS BOOL AS $$
BEGIN
    return (a%2 = 0);
END; $$
LANGUAGE plpgsql;

select f(2);
select f(3);

--d
create or replace function d(password varchar)
returns bool as $$
begin
    return (length(password) >= 8 and length(password) <= 40);
end;$$
language plpgsql;

select d('awe');
select d('12345678');

--e
create or replace function e(val int, out a bool, out b int) as $$
begin
    a := (val >= 0);
    b := val*val;
end;$$
language plpgsql;

select e(-1);
select e(20);

---------------------------------------2
--a

create table trig_test(
    name varchar(40),
    time timestamp,
    info text
);

create table trig_res(
    action_name varchar(40),
    timestamp timestamp
);

CREATE OR REPLACE FUNCTION a2()
  RETURNS TRIGGER AS
$$
BEGIN
	insert into trig_res values('insertion', CURRENT_TIMESTAMP);
	return new;
END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER a2_trigger
  BEFORE INSERT
  ON trig_test
  FOR EACH ROW
  EXECUTE PROCEDURE a2();

insert into trig_test values('name2');

drop table trig_test;
drop table trig_res;
drop function a2;

--b
create table trig_test(
    name varchar(40),
    birthday timestamp,
    info text
);

create table trig_res(
    name varchar(40),
    age interval
);

CREATE OR REPLACE FUNCTION b2()
  RETURNS TRIGGER AS
$$
BEGIN
	insert into trig_res values(new.name, (current_timestamp - new.birthday));
	return new;
END;
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER b2_trigger
  BEFORE INSERT
  ON trig_test
  FOR EACH ROW
  EXECUTE PROCEDURE b2();

insert into trig_test values('name2', '2003-05-04');

drop table trig_test;
drop table trig_res;
drop function b2;

--3
--A function is used to calculate result using given inputs. A procedure is used to perform certain task in order.
--A function can be called by a procedure. A procedure cannot be called by a function.