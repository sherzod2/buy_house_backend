CREATE OR REPLACE FUNCTION fn()
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
result int;
gh record;
BEGIN

    result := 0;

    for gh in select
                user_cost, user_id
	        from
                users
    loop
        IF
            gh.user_cost > result
        THEN
            result := gh.user_cost;
        END IF;
    end loop;

    RETURN result;

END
$$;

create table users(
    user_id bigserial not null primary key,
    user_name VARCHAR(64) not null,
    user_age int not null
);


-------------------------------------------------------------
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
            result := gh.bank_updo;
        END IF;
    end loop;

    RETURN result;

END
$$;
        -- ELSIF
        --     gh.bank_updo > house_price
        -- THEN
        --     result = gh.bank_updo;


        -- select choose_bank((select (room_price * room_area) from rooms where room_id = 4))


-- CREATE TABLE years(
--     year_id BIGSERIAL NOT NULL PRIMARY KEY,
--     year_count INT NOT NULL,
--     bank_id INT NOT,
--         FOREIGN KEY(bank_id)
--         REFERENCES banks(bank_id)
--         ON DELETE CASCADE
-- );

-- INSERT INTO years(year_count, bank_id)
--     VALUES(4, 1);
-- INSERT INTO years(year_count, bank_id)
--     VALUES(6, 1);
-- INSERT INTO years(year_count, bank_id)
--     VALUES(5, 2);
-- INSERT INTO years(year_count, bank_id)
--     VALUES(7, 2);
-- INSERT INTO years(year_count, bank_id)
--     VALUES(5, 3);
-- INSERT INTO years(year_count, bank_id)
--     VALUES(10, 3);

-- --------------------------------------------------------------------------
--BANKNI TANLAYDIGAN
--HOUSE PRICE
--17%
--OYIGA SUMMASI
-----------------------------------------------------------------------------------------
-- SELECT
--     complexs.complex_id,
--     complexs.complex_name,
--     companies.company_name
-- FROM
--     companies
-- JOIN
--     complexs
-- ON
--     companies.company_id = complexs.company_id;
-----------------------------------------------------------------------------------------
SELECT
    rooms.room_id,
    rooms.room_count,
    rooms.room_price,
    rooms.room_area,
    rooms.room_address,
    complexs.complex_name,
    companies.company_name
FROM
    companies
JOIN
    complexs
ON
    companies.company_id = complexs.company_id
JOIN
    rooms
ON
    complexs.complex_id = rooms.complex_id;

    room_id BIGSERIAL NOT NULL PRIMARY KEY,
    room_count INT NOT NULL,
    room_price INT NOT NULL,
    room_area INT NOT NULL,
    room_address