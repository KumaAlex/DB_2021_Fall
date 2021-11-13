create table customers (
    id integer primary key,
    name varchar(255),
    birth_date date
);

create table accounts(
    account_id varchar(40) primary key ,
    customer_id integer references customers(id),
    currency varchar(3),
    balance float,
    "limit" float
);

create table transactions (
    id serial primary key ,
    date timestamp,
    src_account varchar(40) references accounts(account_id),
    dst_account varchar(40) references accounts(account_id),
    amount float,
    status varchar(20)
);

INSERT INTO customers VALUES (201, 'John', '2021-11-05');
INSERT INTO customers VALUES (202, 'Anny', '2021-11-02');
INSERT INTO customers VALUES (203, 'Rick', '2021-11-24');

INSERT INTO accounts VALUES ('NT10204', 201, 'KZT', 1000, null);
INSERT INTO accounts VALUES ('AB10203', 202, 'USD', 100, 0);
INSERT INTO accounts VALUES ('DK12000', 203, 'EUR', 500, 200);
INSERT INTO accounts VALUES ('NK90123', 201, 'USD', 400, 0);
INSERT INTO accounts VALUES ('RS88012', 203, 'KZT', 5000, -100);

INSERT INTO transactions VALUES (1, '2021-11-05 18:00:34.000000', 'NT10204', 'RS88012', 1000, 'commited');
INSERT INTO transactions VALUES (2, '2021-11-05 18:01:19.000000', 'NK90123', 'AB10203', 500, 'rollback');
INSERT INTO transactions VALUES (3, '2021-06-05 18:02:45.000000', 'RS88012', 'NT10204', 400, 'init');

--ALEKSANDR KIM
--LABORATORY WORK 7

--2.a)
CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;

GRANT SELECT ON transactions
to accountant;
GRANT ALL ON ALL TABLES IN SCHEMA lab7
to administrator;
GRANT SELECT ON transactions, customers
to support;

REVOKE ALL ON ALL TABLES IN SCHEMA lab7
    FROM accountant;
REVOKE ALL ON ALL TABLES IN SCHEMA lab7
    FROM administrator;
REVOKE ALL ON ALL TABLES IN SCHEMA lab7
    FROM support;

DROP ROLE accountant;
DROP ROLE administrator;
DROP ROLE support;

--2.b)
CREATE USER Alex;
CREATE USER Steve;
CREATE USER Alen;
CREATE USER Sam;

GRANT Alen, Sam TO support;
GRANT Alex TO administrator;
GRANT Steve TO accountant;

REVOKE Alex FROM administrator;
REVOKE Alen, Sam FROM support;
REVOKE Steve FROM accountant;

--2.c)
GRANT ALL ON ALL TABLES IN SCHEMA lab7
    TO Alex WITH GRANT OPTION;
GRANT SELECT ON customers
    TO Alen, Sam WITH GRANT OPTION;

--2.d)
REVOKE SELECT ON customers
    FROM Alen, Sam;
REVOKE ALL ON ALL TABLES IN SCHEMA lab7
    FROM Alex;

--3.b)
ALTER TABLE transactions
ADD CONSTRAINT tran_con CHECK (src_account is not null);

ALTER TABLE transactions
DROP CONSTRAINT tran_con;

INSERT INTO transactions VALUES (4, CURRENT_DATE, NULL, NULL, 100, 'init');

ALTER TABLE accounts
ADD CONSTRAINT ac_con CHECK (balance >= 0);

ALTER TABLE accounts
DROP CONSTRAINT ac_con;

--5.a)
CREATE UNIQUE INDEX ac_ind ON accounts(account_id, currency);

DROP INDEX ac_ind;

--5.b)
CREATE INDEX ac_ind ON accounts(currency, balance);

DROP INDEX ac_ind;

--6.a)
BEGIN TRANSACTION;

INSERT INTO transactions VALUES (4, CURRENT_DATE, 'NT10204', 'RS88012', 100, 'init');

SELECT * FROM transactions;

DELETE FROM transactions
WHERE id = 4;

--6.b)
UPDATE accounts
SET balance = balance - 100
WHERE account_id = (SELECT src_account FROM transactions WHERE id = 4);

UPDATE accounts
SET balance = balance + 100
WHERE account_id = (SELECT dst_account FROM transactions WHERE id = 4);

SELECT * FROM accounts;

--6.d)
UPDATE transactions
SET status = 'commited'
--'commited' / 'rollback'
WHERE id = 4;

COMMIT TRANSACTION;
END TRANSACTION;

ROLLBACK TRANSACTION;
END TRANSACTION;