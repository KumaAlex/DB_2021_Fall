create table dealer (
    id integer primary key ,
    name varchar(255),
    location varchar(255),
    charge float
);

INSERT INTO dealer (id, name, location, charge) VALUES (101, 'Ерлан', 'Алматы', 0.15);
INSERT INTO dealer (id, name, location, charge) VALUES (102, 'Жасмин', 'Караганда', 0.13);
INSERT INTO dealer (id, name, location, charge) VALUES (105, 'Азамат', 'Нур-Султан', 0.11);
INSERT INTO dealer (id, name, location, charge) VALUES (106, 'Канат', 'Караганда', 0.14);
INSERT INTO dealer (id, name, location, charge) VALUES (107, 'Евгений', 'Атырау', 0.13);
INSERT INTO dealer (id, name, location, charge) VALUES (103, 'Жулдыз', 'Актобе', 0.12);

create table client (
    id integer primary key ,
    name varchar(255),
    city varchar(255),
    priority integer,
    dealer_id integer references dealer(id)
);

INSERT INTO client (id, name, city, priority, dealer_id) VALUES (802, 'Айша', 'Алматы', 100, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (807, 'Даулет', 'Алматы', 200, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (805, 'Али', 'Кокшетау', 200, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (808, 'Ильяс', 'Нур-Султан', 300, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (804, 'Алия', 'Караганда', 300, 106);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (809, 'Саша', 'Шымкент', 100, 103);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (803, 'Маша', 'Семей', 200, 107);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (801, 'Максат', 'Нур-Султан', null, 105);

create table sell (
    id integer primary key,
    amount float,
    date timestamp,
    client_id integer references client(id),
    dealer_id integer references dealer(id)
);

INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (201, 150.5, '2012-10-05 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (209, 270.65, '2012-09-10 00:00:00.000000', 801, 105);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (202, 65.26, '2012-10-05 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (204, 110.5, '2012-08-17 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (207, 948.5, '2012-09-10 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (205, 2400.6, '2012-07-27 00:00:00.000000', 807, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (208, 5760, '2012-09-10 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (210, 1983.43, '2012-10-10 00:00:00.000000', 804, 106);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (203, 2480.4, '2012-10-10 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (212, 250.45, '2012-06-27 00:00:00.000000', 808, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (211, 75.29, '2012-08-17 00:00:00.000000', 803, 107);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (213, 3045.6, '2012-04-25 00:00:00.000000', 802, 101);

-- drop table client;
-- drop table dealer;
-- drop table sell;



-- LAB 6;

-- #1

--a
SELECT *
FROM dealer, client;
--b
SELECT dealer.name, client.name, client.city, client.priority AS grade, sell.id AS sell_number, sell.date, sell.amount
FROM dealer, client, sell
WHERE dealer.id = sell.dealer_id AND
      client.id = sell.client_id;
--c
SELECT dealer.name, client.name
FROM dealer, client
WHERE dealer.location = client.city;
--d
SELECT sell.id, sell.amount, client.name, dealer.location, sell.amount
FROM sell, client, dealer
WHERE sell.dealer_id = dealer.id AND
      sell.client_id = client.id AND
      sell.amount BETWEEN 100 AND 500;
--e
SELECT dealer.name, client.name
FROM dealer LEFT JOIN client
ON dealer.id = client.dealer_id;
--f
SELECT client.name, client.city, dealer.name, dealer.charge AS commission
FROM dealer INNER JOIN client
ON client.dealer_id = dealer.id;
--g
SELECT client.name, client.city, dealer.name, dealer.charge AS commission
FROM dealer INNER JOIN client
ON client.dealer_id = dealer.id
WHERE (dealer.charge > 0.12);
--h
SELECT client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge AS commission
FROM (dealer INNER JOIN client
    ON dealer.id = client.dealer_id) LEFT JOIN sell
        ON sell.client_id = client.id;
--i
--find dealers who either work for one or more clients. The client may have made,
--either one or more purchases on or above purchase amount 2000 and must have a
--grade, or he may not have made any purchase to the associated dealer. Print
--client name, client grade, dealer name, sell id, sell amount
SELECT client.name, client.priority, dealer.name, sell.amount
FROM (sell INNER JOIN client
    ON client.id = sell.client_id) LEFT JOIN dealer
        ON sell.dealer_id = dealer.id
WHERE sell.amount > 2000 AND client.priority != 0;

-- #2

-- a
CREATE VIEW v AS (SELECT client.id, AVG(sell.amount), SUM(sell.amount)
                    FROM client INNER JOIN sell
                    ON client.id = sell.client_id
                    GROUP BY client.id);

SELECT *
FROM v;

DROP VIEW v;
--b
CREATE VIEW v AS (SELECT date, SUM(amount)
                    FROM sell
                    GROUP BY date
                    ORDER BY SUM(amount) DESC
                    LIMIT 5);

SELECT *
FROM v;

DROP VIEW v;
--c
CREATE VIEW v AS (SELECT dealer.id, AVG(sell.amount), SUM(sell.amount)
                    FROM dealer INNER JOIN sell ON
                        dealer.id = sell.dealer_id
                    GROUP BY dealer.id);

SELECT *
FROM v;

DROP VIEW v;
--d
CREATE VIEW v AS (SELECT dealer.location, SUM(sell.amount * dealer.charge)
                FROM dealer INNER JOIN sell ON dealer.id = sell.dealer_id
                GROUP BY dealer.location);

SELECT *
FROM v;

DROP VIEW v;
--e
CREATE VIEW v AS (SELECT dealer.location, AVG(sell.amount), SUM(sell.amount)
                FROM dealer INNER JOIN sell ON dealer.id = sell.dealer_id
                GROUP BY dealer.location);

SELECT *
FROM v;

DROP VIEW v;
--f
CREATE VIEW v AS (SELECT client.city, AVG(sell.amount), SUM(sell.amount)
                    FROM client INNER JOIN sell ON client.id = sell.client_id
                    GROUP BY client.city);

SELECT *
FROM v;

DROP VIEW v;
--g
CREATE VIEW v1 AS (SELECT dealer.location, SUM(sell.amount) AS amount
                    FROM dealer INNER JOIN sell ON dealer.id = sell.dealer_id
                    GROUP BY dealer.location);

CREATE VIEW v2  AS (SELECT client.city, SUM(sell.amount) AS expenses
                    FROM client INNER JOIN sell ON client.id = sell.client_id
                    GROUP BY client.city);

CREATE VIEW ans AS (SELECT *
                    FROM v1 INNER JOIN v2 ON v1.location = v2.city
                    WHERE v2.expenses > v1.amount);

SELECT *
FROM ans;

DROP VIEW v1;
DROP VIEW v2;
DROP VIEW ans;