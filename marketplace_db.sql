CREATE TABLE Produk_kategori (
ID INT AUTO_INCREMENT PRIMARY KEY, 
Nama_Kategori VARCHAR(100) NOT NULL);
SELECT * FROM Produk_kategori;
INSERT INTO Produk_kategori (ID, Nama_Kategori)
	VALUES 
    (0101, 'Laptop'),
    (0102, 'Dekstop'),
    (0103, 'Smartphone'),
    (0104, 'Headset'),
    (0105, 'Earphone'),
    (0106, 'Keyboard'),
    (0107, 'Mouse'),
    (0108, 'Speaker'),
    (0109, 'Printer'),
    (0110, 'Accessories');
    
SELECT * FROM Produk_kategori;

CREATE TABLE Produk (
ID INT AUTO_INCREMENT PRIMARY KEY,
Nama_Produk VARCHAR(100) NOT NULL,
Harga INT NOT NULL,
Jumlah_Stok NUMERIC NOT NULL,
Penjualan INT NOT NULL,
User_Id INT NOT NULL,
ID_Produk_kategori INT NOT NULL,
FOREIGN KEY (User_ID) REFERENCES Users(ID),
FOREIGN KEY (ID_Produk_Kategori) REFERENCES Produk_kategori(ID) 
);

INSERT INTO Produk (ID, Nama_Produk, Harga, Jumlah_Stok, Penjualan, User_id, ID_Produk_kategori)
	VALUES 
    (10101, 'Samsung S25 FE', 9500000, 10, 2, 002, 103),
    (10102, 'Xiaomi Redmi 15', 2600000, 8, 1, 004, 103),
    (10103, 'Canon Printer G1010', 1200000, 5, 2, 005, 109),
    (10104, 'Gamen Titan Keyboard', 250000, 10, 3, 001, 106),
    (10105, 'Simbada Speaker', 500000, 5, 2, 006, 108),
    (10106, 'Olike Bluetooth Speaker', 150000, 3, 1, 003, 108),
    (10107, 'Acetech Mousepad', 30000, 10, 2, 008, 110),
    (10108, 'Robot TWS Wireless', 100000, 10, 3, 010, 105),
    (10109, 'Anker R50i Wireless', 250000, 7, 1, 013, 105),
    (10110, 'Lenovo Thinkpad T490', 2800000, 5, 2, 011, 101),
    (10111, 'Acer Aspire Lite AL14', 7800000, 2, 1, 005, 101),
    (10112, 'Asus Vivobook 14', 4200000, 4, 1, 015, 101),
    (10113, 'Advan Dekstop AIO', 7200000, 5, 2, 014, 102),
    (10114, 'Logitech Mouse B175', 105000, 10, 1, 014, 107),
    (10115, 'Rexus Mouse Q50', 50500, 10, 4, 007, 107);
    
SELECT * FROM Users;
SELECT * FROM Produk;
SELECT * FROM Produk_kategori;

SELECT Nama_Produk, Harga FROM Produk;

SELECT Nama_Produk, Harga FROM Produk
WHERE Harga < 200000;


SELECT * FROM Produk;

SELECT Nama_Produk, Harga, Jumlah_Stok FROM Produk
WHERE Jumlah_Stok = 0 OR Harga > 500000;

SELECT Nama_Produk, Harga FROM Produk
ORDER BY Harga DESC
LIMIT 5;

SELECT * FROM Users;

SELECT COUNT(Nama) AS Jumlah_users FROM Users;

SELECT * FROM Produk;
 SELECT SUM(Jumlah_Stok) AS Total_Stok_Tersedia FROM Produk;

UPDATE produk SET Jumlah_Stok = 0 WHERE ID = 10112;

SELECT * FROM Produk;
SELECT COUNT(ID) AS Jumlah_produk_per_kategori
FROM produk_kategori;

SELECT * FROM Produk;
SELECT 
    Produk_kategori.Nama_Kategori,
    ROUND(AVG(Produk.Harga), 0) AS Rata_rata_harga_produk
FROM Produk
JOIN Produk_kategori
ON Produk.ID_Produk_kategori = Produk_kategori.ID
GROUP BY Produk_kategori.Nama_Kategori;

SELECT * FROM Produk;
INSERT INTO Produk (ID, Nama_Produk, Harga, Jumlah_Stok, Penjualan, User_id, ID_Produk_kategori)
VALUES 
(10116, 'Asus TUF Gaming F16', 30000000, 2, 1, 007, 101),
(10117, 'Vivo Y19s Pro', 2000000, 5, 1, 013, 103),
(10118, 'Oppo Reni 5', 2500000, 3, 1, 010, 103);

SELECT * FROM Produk;

SELECT * FROM Users;

SELECT 
    Produk_kategori.Nama_Kategori,
    COUNT(Produk.ID) AS Jumlah_Produk
FROM Produk
JOIN Produk_kategori
ON Produk.ID_Produk_kategori = Produk_kategori.ID
GROUP BY Produk_kategori.Nama_Kategori;


SELECT 
    Produk_kategori.Nama_Kategori,
    COUNT(Produk.ID) AS Jumlah_Produk
FROM Produk
JOIN Produk_kategori
ON Produk.ID_Produk_Kategori = Produk_kategori.ID
GROUP BY Produk_kategori.Nama_Kategori
HAVING COUNT(Produk.ID) > 3;


SELECT 
    Produk.Nama_Produk,
    Produk_kategori.Nama_Kategori
FROM Produk
INNER JOIN Produk_kategori
ON Produk.ID_Produk_Kategori = Produk_kategori.ID;

SELECT 
    Users.Nama,
    Produk.Nama_Produk
FROM Users
LEFT JOIN Produk
ON Users.ID = Produk.User_Id;


CREATE TABLE Transaksi (
    ID_Transaksi INT AUTO_INCREMENT PRIMARY KEY,
    User_Id INT NOT NULL,
    Produk_Id INT NOT NULL,
    Tanggal_Transaksi DATE NOT NULL,
    Jumlah_Beli INT NOT NULL,
    Total_Harga INT NOT NULL,
    Metode_Pembayaran VARCHAR(50) NOT NULL,
    Status_Transaksi VARCHAR(50) NOT NULL,

    FOREIGN KEY (User_Id) REFERENCES Users(ID),
    FOREIGN KEY (Produk_Id) REFERENCES Produk(ID)
);


    
    
   (ID, Nama_Produk, Harga, Jumlah_Stok, Penjualan, User_id, ID_Produk_kategori)
    
    (10111, 'Acer Aspire Lite AL14', 7800000, 2, 1, 005, 101),
    (10112, 'Asus Vivobook 14', 4200000, 4, 1, 015, 101),
    (10113, 'Advan Dekstop AIO', 7200000, 5, 2, 014, 102),
    (10114, 'Logitech Mouse B175', 105000, 10, 1, 014, 107),
    (10115, 'Rexus Mouse Q50', 50500, 10, 4, 007, 107);



INSERT INTO Transaksi
(ID_Transaksi, User_Id, Produk_Id, Tanggal_Transaksi, Jumlah_Beli, Total_Harga, Metode_Pembayaran, Status_Transaksi)
VALUES
(101, 2, 10101, '2026-05-20', 2, 19000000, 'Transfer Bank', 'Selesai'),
(102, 4, 10102, '2026-05-20', 1, 2600000, 'Debit Card', 'Selesai'),
(103, 5, 10103, '2026-05-21', 2, 2400000, 'COD', 'Pending'),
(104, 1, 10104, '2026-05-21', 3, 750000, 'Transfer Bank', 'Selesai'),
(105, 6, 10105, '2026-05-22', 2, 1000000, 'QRIS', 'Diproses'),
(106, 3, 10106, '2026-05-22', 1, 150000, 'QRIS', 'Selesai'),
(107, 8, 10107, '2026-05-22', 2, 60000, 'Transfer Bank', 'Selesai'),
(108, 10, 10108, '2026-05-23', 3, 300000, 'COD', 'Pending'),
(109, 13, 10109, '2026-05-23', 1, 250000, 'QRIS', 'Selesai'),
(110, 11, 10110, '2026-05-23', 2, 5600000, 'Transfer Bank', 'Diproses');

SELECT * FROM Transaksi;

SELECT 
    Transaksi.ID_Transaksi,
    Users.Nama AS Nama_Buyer,
    Transaksi.Total_Harga
FROM Transaksi
INNER JOIN Users
ON Transaksi.User_Id = Users.ID;


CREATE TABLE Jenis_User (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Jenis_User VARCHAR(50) NOT NULL,
    Deskripsi TEXT
);

INSERT INTO Jenis_User (ID, Nama_Jenis_User, Deskripsi)
VALUES
(111,'Admin', 'Pengguna yang memiliki akses penuh ke sistem'),
(112,'Customer', 'Pengguna yang melakukan pembelian produk'),
(113,'Seller', 'Pengguna yang menjual produk');

SELECT 
    Produk.Nama_Produk,
    Users.Nama AS Nama_User
FROM Produk
INNER JOIN Users
ON Produk.User_Id = Users.ID;


