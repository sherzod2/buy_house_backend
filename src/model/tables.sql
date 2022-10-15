CREATE TABLE companies(
    company_id BIGSERIAL NOT NULL PRIMARY KEY,
    company_name VARCHAR(64) NOT NULL,
    company_img TEXT NOT NULL
);

INSERT INTO
    companies(company_name, company_img)
VALUES
    ('Murod buildings', 'https://www.mbc.uz/includes/images/new_layout/logo.svg');
INSERT INTO
    companies(company_name, company_img)
VALUES
    ('Golden house', 'https://logobank.uz:8005/media/logos_png/GOLDEN_HOUSE_logo_png-01.png');
INSERT INTO
    companies(company_name, company_img)
VALUES
    ('Bizning uylar', 'https://www.bizninguylar.uz/report/1649505828photo_2022-04-09%2016.55.10.jpeg');
INSERT INTO
    companies(company_name, company_img)
VALUES
    ('Trillion', 'https://cdn.worldvectorlogo.com/logos/trillion.svg');
-----------------------------------------------------------------------------------------------
CREATE TABLE complexs(
    complex_id BIGSERIAL NOT NULL PRIMARY KEY,
    complex_name VARCHAR(64) NOT NULL,
    company_id INT NOT NULL,
        FOREIGN KEY(company_id)
        REFERENCES companies(company_id)
        ON DELETE CASCADE
);

INSERT INTO complexs(complex_name, company_id) VALUES('Akaycity', 1);
INSERT INTO complexs(complex_name, company_id) VALUES('Nest One', 1);
INSERT INTO complexs(complex_name, company_id) VALUES('Oq tepa sohil bo`yi', 1);
INSERT INTO complexs(complex_name, company_id) VALUES('Olmazor city', 2);
INSERT INTO complexs(complex_name, company_id) VALUES('Beruniy city', 2);
INSERT INTO complexs(complex_name, company_id) VALUES('Tinchlik city', 2);
INSERT INTO complexs(complex_name, company_id) VALUES('Chorsu city', 3);
INSERT INTO complexs(complex_name, company_id) VALUES('O`zbekiston city', 3);
INSERT INTO complexs(complex_name, company_id) VALUES('Kosmonavtlar city', 3);
INSERT INTO complexs(complex_name, company_id) VALUES('Toshkent city', 4);
INSERT INTO complexs(complex_name, company_id) VALUES('Ming o`rik city', 4);
INSERT INTO complexs(complex_name, company_id) VALUES('Minor city', 4);
-----------------------------------------------------------------------------------------------
CREATE TABLE rooms(
    room_id BIGSERIAL NOT NULL PRIMARY KEY,
    room_count INT NOT NULL,
    room_price INT NOT NULL,
    room_area INT NOT NULL,
    room_address VARCHAR(64) NOT NULL,
    complex_id INT NOT NULL,
        FOREIGN KEY(complex_id)
        REFERENCES complexs(complex_id)
        ON DELETE CASCADE
);

INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 700, 55, 'Chorsu1', 1);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 680, 70, 'Chorsu2', 1);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 660, 85, 'Chorsu3', 1);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 640, 100, 'Chorsu4', 1);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 620, 115, 'Chorsu5', 1);
---------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 710, 57, 'Yunisobod1', 2);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 690, 72, 'Yunisobod2', 2);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 670, 87, 'Yunisobod3', 2);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 650, 102, 'Yunisobod4', 2);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 630, 117, 'Yunisobod5', 2);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 720, 59, 'Xadra1', 3);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 700, 74, 'Xadra2', 3);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 680, 89, 'Xadra3', 3);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 660, 104, 'Xadra4', 3);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 640, 119, 'Xadra5', 3);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 730, 61, 'Sirdaryo1', 4);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 710, 76, 'Sirdaryo2', 4);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 690, 91, 'Sirdaryo3', 4);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 670, 106, 'Sirdaryo4', 4);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 650, 121, 'Sirdaryo5', 4);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 740, 63, 'Xorazm1', 5);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 720, 78, 'Xorazm2', 5);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 700, 93, 'Xorazm3', 5);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 680, 108, 'Xorazm4', 5);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 660, 123, 'Xorazm5', 5);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 760, 65, 'Jizzax1', 6);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 740, 80, 'Jizzax2', 6);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 720, 93, 'Jizzax3', 6);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 700, 110, 'Jizzax4', 6);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 680, 125, 'Jizzax5', 6);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 780, 67, 'Toshkent1', 7);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 760, 82, 'Toshkent2', 7);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 740, 95, 'Toshkent3', 7);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 720, 112, 'Toshkent4', 7);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 700, 127, 'Toshkent5', 7);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 800, 69, 'Qashqadaryo1', 8);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 780, 84, 'Qashqadaryo2', 8);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 760, 97, 'Qashqadaryo3', 8);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 740, 114, 'Qashqadaryo4', 8);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 720, 129, 'Qashqadaryo5', 8);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 820, 71, 'Namangan1', 9);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 800, 86, 'Namangan2', 9);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 780, 99, 'Namangan3', 9);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 760, 116, 'Namangan4', 9);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 740, 131, 'Namangan5', 9);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 840, 73, 'Surxandaryo1', 10);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 820, 88, 'Surxandaryo2', 10);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 800, 101, 'Surxandaryo3', 10);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 780, 118, 'Surxandaryo4', 10);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 760, 133, 'Surxandaryo5', 10);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 750, 75, 'Navoiy1', 11);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 760, 90, 'Navoiy2', 11);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 770, 103, 'Navoiy3', 11);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 780, 120, 'Navoiy4', 11);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 790, 135, 'Navoiy5', 11);
-----------------------------------------------------------------------------------------------
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(2, 770, 76, 'Andijon1', 12);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(3, 760, 91, 'Andijon2', 12);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(4, 750, 104, 'Andijon3', 12);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(5, 740, 121, 'Andijon4', 12);
INSERT INTO rooms(room_count, room_price, room_area, room_address, complex_id)
    VALUES(6, 730, 134, 'Andijon5', 12);
-----------------------------------------------------------------------------------------------
CREATE TABLE banks(
    bank_id BIGSERIAL NOT NULL PRIMARY KEY,
    bank_name VARCHAR(64) NOT NULL,
    bank_updo INT NOT NULL,
    bank_img TEXT NOT NULL
);

INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Davr banki', 40000, 'https://logobank.uz:8005/media/logos_png/DAVR_BANK-01.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Milliy bank', 45000, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/NBU_new_logo.jpg/640px-NBU_new_logo.jpg');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Xalq banki', 50000, 'https://logobank.uz:8005/media/logos_png/Xalq_banki-01.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Capital bank', 55000, 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/112012/cb_vh_rgb.png?itok=cY3cBlis');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Aloqa banki', 60000, 'https://logobank.uz:8005/media/logos_png/Aloqabank-01.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Ravnaq banki', 65000, 'https://bank.uz/upload/iblock/3aa/3aa3ef746289fdea63a512c52c207afa.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('SQB banki', 70000, 'https://yt3.ggpht.com/ytc/AKedOLTmBaqHF5ogHcpzH-3feiQF22D2-NCCTZOZOk7Y=s900-c-k-c0x00ffffff-no-rj');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Agro banki', 75000, 'https://logobank.uz:8005/media/logos_png/Agrobank-01.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('TBC banki', 80000, 'https://logobank.uz:8005/media/logos_png/TBC_Bank-01.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Asia Alliance Banki', 100000, 'https://logobank.uz:8005/media/logos_preview/AAB-01.png');
INSERT INTO banks(bank_name, bank_updo, bank_img)
    VALUES('Ipoteka Banki', 200000, 'https://logobank.uz:8005/media/logos_png/ipoteka-01.png');
-----------------------------------------------------------------------------------------------