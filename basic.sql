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





