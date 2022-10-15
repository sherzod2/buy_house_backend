CREATE DATABASE house;

CREATE TABLE companies(
    company_id BIGSERIAL NOT NULL PRIMARY KEY,
    company_name VARCHAR(64) NOT NULL,
    company_img TEXT NOT NULL
);

INSERT INTO
    companies(company_name, company_img)
VALUES
    ('murod', 'murodrasm');
INSERT INTO companies(company_name, company_img) VALUES('akay', 'akayrasm');

CREATE TABLE complexs(
    complex_id BIGSERIAL NOT NULL PRIMARY KEY,
    complex_name VARCHAR(64) NOT NULL,
    company_id INT,
        FOREIGN KEY(company_id)
        REFERENCES companies(company_id)
        ON DELETE CASCADE
);

INSERT INTO complexs(complex_name, company_id) VALUES('akaycity', 1);
INSERT INTO complexs(complex_name, company_id) VALUES('ukaycity', 1);
INSERT INTO complexs(complex_name, company_id) VALUES('olmazorcity', 2);
INSERT INTO complexs(complex_name, company_id) VALUES('tikonzorcity', 2);


CREATE TABLE rooms(
    room_id BIGSERIAL NOT NULL PRIMARY KEY,
    room_count INT NOT NULL,
    room_price INT NOT NULL,
    room_area INT NOT NULL,
    room_address VARCHAR(64) NOT NULL,
    complex_id INT,
        FOREIGN KEY(complex_id)
        REFERENCES complexs(complex_id)
        ON DELETE CASCADE
);

INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 700, 36, 'CHORSU1', 1);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 650, 56, 'XADRA1', 1);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 600, 76, 'CHORSU2', 2);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 575, 81, 'XADRA2', 2);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 550, 91, 'CHORSU3', 3);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(7, 525, 101, 'CHORSU3', 3);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(8, 500, 111, 'CHORSU4', 4);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(9, 474, 121, 'CHORSU4', 4);


CREATE TABLE banks(
    bank_id BIGSERIAL NOT NULL PRIMARY KEY,
    bank_name VARCHAR(64) NOT NULL,
    bank_updo INT NOT NULL
);

INSERT INTO banks(bank_name, bank_updo)
    VALUES('XALQBANK', 50000);
INSERT INTO banks(bank_name, bank_updo)
    VALUES('cAPITAL', 55000);
INSERT INTO banks(bank_name, bank_updo)
    VALUES('ALOQA', 60000);
INSERT INTO banks(bank_name, bank_updo)
    VALUES('Milliy', 45000);



-- --------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION choose_bank(house_price int)
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
result int;
gh record;
BEGIN

    result = -1;

    for gh in SELECT bank_id, bank_updo FROM banks ORDER BY bank_updo
    loop
        IF
            gh.bank_updo > house_price AND result = -1
        THEN
            result := gh.bank_id;
        END IF;
    end loop;

    RETURN result;

END
$$;
