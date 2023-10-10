-- untuk masuk kedatabase postgres
psql -U [username]
psql -U postgres

psql -U [username] -p [port] -h [hostname]

psql -U posgres -p 5432 -h localhost

-- untuk melihat datbase yg sudah pernah dibuat

\l

-- untuk membuat database
-- syntac sql : CREATE DATABASE [nama_database]

CREATE DATABASE pf16;

-- untuk masuk / connect / pilihat DATABASE
-- sintax: \c [nama_dabase]
\c pf16

-- untuk milihat list DATABASE
\dt

-- untuk membuat / create TABLE

-- sintax:

CREATE TABLE products2(
    id INT,
    name VARCHAR(64) NOT NULL,
    decription TEXT,
    price INT,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);




CREATE TABLE users(
    id INT,
    email VARCHAR(64),
    fullname VARCHAR(64),
    password VARCHAR(64),
    phone VARCHAR(16)
);


-- hapus DATABASE

DROP TABLE products2;


-- INSERT / add / tambahakan data 
-- syntac :
-- INSERT INTO [nama table]([field1], [field2], [field3])VALUES([data1], [data2], [data3]);
INSERT INTO users(id, email, fullname, password, phone)VALUES(1, 'risano@gmail.com', 'risano akbar', 'abcd1234', '0812312312');

INSERT INTO users(id, email, fullname, password, phone)VALUES(1, 'budi@gmail.com', 'buditanjung', 'sdfssdf', '0812312312');


-- READ / melihat data di TABLE
-- SELECT [field1], [field2], [field3] FROM users;


SELECT users.id, users.email, users.fullname, users.password, users.phone FROM users;
SELECT id, email, fullname, password, phone FROM users;
SELECT id, fullname FROM users;


-- UPDATE / edit data
-- sintax: ADD
UPDATE [nama_table] SET [nama_field1]='nilai1', [nama_field2] = 'nilai2' WHERE [nama_field3] = 'value3';
UPDATE users SET phone = '08222222', fullname = 'budi tanjung' WHERE id = 2;


-- DELETE / hapus data
-- syntax: 
-- DELETE FROM [table] WHERE [name_field] = 'values'
DELETE FROM users WHERE id = 2;







-- part 2

CREATE TABLE categories(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(64) NOT NULL,
    description TEXT, 
    PRIMARY KEY(id)
);


CREATE TABLE products(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(64) NOT NULL,
    decription TEXT,
    price INT,
    stock INT DEFAULT 0,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

INSERT INTO categories(name, description)VALUES('makanan', 'makan bla bla bla'),('minimun', 'minuman adalah bla bla bla'), ('eletronik', 'eletronik bla bla bla');

INSERT INTO products(name, decription, price, stock, category_id)VALUES('Indomie Ayam Bawang', 'indomie ayam bawang selare ku blba bla', 3000, 100, 1), ('Mie gelas kary ayam', 'mie gelas bla bla', 2000, 150, 1),('sari mie ayam goreng', 'sari mie s bla bla', 4000, 30, 1),('Nutri sari rasa jeruk', 'nutri sari rasa jueruk bla bla', 1000, 130, 2),('jasjus rasa lemon', 'jasjus lemon bla bla', 500, 70, 2),('Kipas anging cosmos', 'kipan angin kosmos bla bla', 300000, 5, 3); 


-- join table
SELECT products.id AS id_product, products.name, products.decription, products.price, products.stock, categories.name AS category_name, categories.description AS category_description FROM products JOIN categories ON products.category_id = categories.id;

SELECT products.*, categories.* FROM products JOIN categories ON products.category_id = categories.id

-- UNTUK SORT
-- ORDER BY -> asc || desc

SELECT * FROM products ORDER BY price asc;


-- untuk filter
-- WHERE [name_field] = value

SELECT * FROM products WHERE category_id = 2;


-- SEARCH key word =  LIKE -> % %

SELECT * FROM products WHERE name ILIKE '%ayam%';

-- pagination

-- rumus pagination  -> limit & OFFSET

limit = 2


offset = (page  - 1) * limit



-- offset halaman 1 = ((1)-1) * 2 = 0
-- offset halmaan 2 = (2 - 1) * 2 = 2
-- offset halaman 3 = (3 - 1) * 2 = 4
-- offset halaman 3 = (4 - 1) * 2 = 6



-- page 1
SELECT * FROM products LIMIT 2 OFFSET 0;
-- page 2
SELECT * FROM products LIMIT 2 OFFSET 2;
-- page 3
SELECT * FROM products LIMIT 2 OFFSET 4;
ALTER TABLE products
  ALTER COLUMN stock TYPE VARCHAR(16);