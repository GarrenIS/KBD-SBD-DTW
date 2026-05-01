CREATE DATABASE BantuKasir;

# TABLES
CREATE TABLE Category (
     categoryID INT PRIMARY KEY AUTO_INCREMENT,
     categoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Member (
     memberTier INT PRIMARY KEY AUTO_INCREMENT,
     Tiername ENUM ('Bronze', 'Silver', 'Gold'),
     discountRate INT NOT NULL,
     totalPoints INT DEFAULT 0
);

CREATE TABLE Employee (
     empID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     empFname VARCHAR(150),
     empLname VARCHAR(150),
     empAddress TEXT NOT NULL,
     Storecode VARCHAR(20) NOT NULL,
     Email VARCHAR(200) NOT NULL,
     Phone VARCHAR(15) NOT NULL
);

CREATE TABLE Supplier (
     supplierID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     supplierName VARCHAR(150) NOT NULL,
     supplierContact VARCHAR(150) NOT NULL,
     supplierAddress TEXT NOT NULL
);

CREATE TABLE Product (
     productID INT PRIMARY KEY AUTO_INCREMENT,
     productName VARCHAR(250) NOT NULL,
     categoryID INT,
     productPrice INT,
     productQuantity INT,
     productExpiry DATE,
     
     FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
);

CREATE TABLE Customer (
     customerID INT PRIMARY KEY AUTO_INCREMENT,
     memberTier INT,
     customerPhone VARCHAR(20),
     customerEmail VARCHAR(250),
    
     FOREIGN KEY (memberTier) REFERENCES Member(memberTier)
);

CREATE TABLE Transaction (
     transactionID INT PRIMARY KEY AUTO_INCREMENT,
     transactionDate DATETIME,
     customerID INT,
     empID INT,
     totalDiscount INT,
     transactionAmount INT,
    
     FOREIGN KEY (customerID) REFERENCES Customer(customerID),
     FOREIGN KEY (empID) REFERENCES Employee(empID)
);

CREATE TABLE Payments (
     paymentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     transactionID INT NOT NULL,
     paymentMethod ENUM ('CASH', 'CASHLESS'),
     paymentDate DATE NOT NULL,
     paymentPaid INT NOT NULL,
     paymentChange INT NOT NULL,
    
    FOREIGN KEY (transactionID) REFERENCES Transaction(transactionID)
);

CREATE TABLE TransactionDetails (
     transactionID INT,
     productID INT,
     productQuantity INT,
     productPrice INT,
     productSubtotal INT,
    
     PRIMARY KEY (transactionID, productID),
     FOREIGN KEY (transactionID) REFERENCES Transaction(transactionID),
    FOREIGN KEY (productID) REFERENCES Product(productID)
);

CREATE TABLE PurchaseSupplier (
 productID INT NOT NULL,
 supplierID INT NOT NULL,
 Price INT NOT NULL,
    
    PRIMARY KEY (productID, supplierID),
    FOREIGN KEY (productID) REFERENCES Product(productID),
    FOREIGN KEY (supplierID) REFERENCES Supplier(supplierID)
);


# DATA DUMMIES
INSERT INTO Category (categoryName) VALUES 
('Makanan'),
('Minuman'),
('Kebutuhan Dapur'),
('Peralatan Mandi'),
('Pembersih Rumah'),
('Perlengkapan Outdoor'),
('Alat Tulis Kantor'),
('Kesehatan'),
('Kecantikan'),
('Pakaian Pria'),
('Pakaian Wanita'),
('Pakaian Anak'),
('Mainan Anak'),
('Olahraga'),
('Dekorasi Rumah'),
('Perlengkapan Bayi'),
('Hobi & Koleksi'),
('Perawatan Hewan'),
('Perkakas'),
('Aksesoris');

INSERT INTO Member (Tiername, discountRate, totalPoints) VALUES 
('Bronze', 0, 0),
('Silver', 5, 500),
('Gold', 10, 1000);

INSERT INTO Employee (empFname, empLname, empAddress, Storecode, Email, Phone) VALUES 
('Budi', 'Santoso', 'Jl. Merdeka No. 10, Jakarta', 'STORE01', 'budi.santoso@email.com', '081234567801'),
('Siti', 'Aminah', 'Jl. Mawar No. 5, Bandung', 'STORE01', 'siti.aminah@email.com', '081234567802'),
('Andi', 'Wijaya', 'Jl. Melati No. 12, Surabaya', 'STORE02', 'andi.wijaya@email.com', '081234567803'),
('Dewi', 'Lestari', 'Jl. Anggrek No. 8, Semarang', 'STORE02', 'dewi.lestari@email.com', '081234567804'),
('Eko', 'Prasetyo', 'Jl. Kenanga No. 3, Yogyakarta', 'STORE03', 'eko.prasetyo@email.com', '081234567805'),
('Rina', 'Sari', 'Jl. Dahlia No. 15, Malang', 'STORE03', 'rina.sari@email.com', '081234567806'),
('Agus', 'Hidayat', 'Jl. Kamboja No. 7, Bekasi', 'STORE01', 'agus.hidayat@email.com', '081234567807'),
('Maya', 'Putri', 'Jl. Flamboyan No. 20, Tangerang', 'STORE02', 'maya.putri@email.com', '081234567808'),
('Iwan', 'Setiawan', 'Jl. Matahari No. 1, Bogor', 'STORE03', 'iwan.setiawan@email.com', '081234567809'),
('Ani', 'Suryani', 'Jl. Teratai No. 9, Depok', 'STORE01', 'ani.suryani@email.com', '081234567810'),
('Rudi', 'Hermawan', 'Jl. Cempaka No. 11, Jakarta', 'STORE02', 'rudi.hermawan@email.com', '081234567811'),
('Lia', 'Permata', 'Jl. Tulip No. 4, Bandung', 'STORE03', 'lia.permata@email.com', '081234567812'),
('Dedi', 'Kusuma', 'Jl. Sakura No. 18, Surabaya', 'STORE01', 'dedi.kusuma@email.com', '081234567813'),
('Yanti', 'Fitriani', 'Jl. Lily No. 6, Semarang', 'STORE02', 'yanti.fitriani@email.com', '081234567814'),
('Hendra', 'Gunawan', 'Jl. Bougenville No. 2, Yogyakarta', 'STORE03', 'hendra.gunawan@email.com', '081234567815'),
('Siska', 'Amalia', 'Jl. Nusa Indah No. 14, Malang', 'STORE01', 'siska.amalia@email.com', '081234567816'),
('Bambang', 'Sutrisno', 'Jl. Pahlawan No. 25, Bekasi', 'STORE02', 'bambang.sutrisno@email.com', '081234567817'),
('Ratna', 'Wulandari', 'Jl. Sudirman No. 30, Tangerang', 'STORE03', 'ratna.wulandari@email.com', '081234567818'),
('Tono', 'Saputra', 'Jl. Gatot Subroto No. 50, Bogor', 'STORE01', 'tono.saputra@email.com', '081234567819'),
('Sari', 'Indah', 'Jl. Rasuna Said No. 5, Depok', 'STORE02', 'sari.indah@email.com', '081234567820'),
('Fajar', 'Nugraha', 'Jl. Thamrin No. 8, Jakarta', 'STORE03', 'fajar.nugraha@email.com', '081234567821'),
('Gita', 'Savitri', 'Jl. Juanda No. 12, Bandung', 'STORE01', 'gita.savitri@email.com', '081234567822'),
('Hadi', 'Mulyono', 'Jl. Diponegoro No. 100, Surabaya', 'STORE02', 'hadi.mulyono@email.com', '081234567823'),
('Indra', 'Kesuma', 'Jl. Pemuda No. 45, Semarang', 'STORE03', 'indra.kesuma@email.com', '081234567824'),
('Joko', 'Susilo', 'Jl. Malioboro No. 1, Yogyakarta', 'STORE01', 'joko.susilo@email.com', '081234567825'),
('Kartika', 'Dewi', 'Jl. Ijen No. 10, Malang', 'STORE02', 'kartika.dewi@email.com', '081234567826'),
('Lutfi', 'Hakim', 'Jl. Ahmad Yani No. 55, Bekasi', 'STORE03', 'lutfi.hakim@email.com', '081234567827'),
('Nana', 'Mulyana', 'Jl. Serpong No. 2, Tangerang', 'STORE01', 'nana.mulyana@email.com', '081234567828'),
('Oki', 'Setiawan', 'Jl. Pajajaran No. 88, Bogor', 'STORE02', 'oki.setiawan@email.com', '081234567829'),
('Putu', 'Gede', 'Jl. Margonda No. 10, Depok', 'STORE03', 'putu.gede@email.com', '081234567830'),
('Qori', 'Hayati', 'Jl. Imam Bonjol No. 3, Jakarta', 'STORE01', 'qori.hayati@email.com', '081234567831'),
('Rahmat', 'Hidayat', 'Jl. Braga No. 15, Bandung', 'STORE02', 'rahmat.hidayat@email.com', '081234567832'),
('Slamet', 'Riyadi', 'Jl. Basuki Rahmat No. 9, Surabaya', 'STORE03', 'slamet.riyadi@email.com', '081234567833'),
('Tati', 'Sumiyati', 'Jl. Gajah Mada No. 22, Semarang', 'STORE01', 'tati.sumiyati@email.com', '081234567834'),
('Ujang', 'Suryana', 'Jl. Parangtritis No. 7, Yogyakarta', 'STORE02', 'ujang.suryana@email.com', '081234567835'),
('Vina', 'Panduwinata', 'Jl. Sukarno Hatta No. 4, Malang', 'STORE03', 'vina.panduwinata@email.com', '081234567836'),
('Wawan', 'Kurniawan', 'Jl. Kalimalang No. 6, Bekasi', 'STORE01', 'wawan.kurniawan@email.com', '081234567837'),
('Xena', 'Gabriella', 'Jl. BSD Raya No. 1, Tangerang', 'STORE02', 'xena.gabriella@email.com', '081234567838'),
('Yayat', 'Ruhiyat', 'Jl. Baranangsiang No. 9, Bogor', 'STORE03', 'yayat.ruhiyat@email.com', '081234567839'),
('Zaki', 'Mubarok', 'Jl. Cinere No. 12, Depok', 'STORE01', 'zaki.mubarok@email.com', '081234567840'),
('Adit', 'Pratama', 'Jl. Kebon Jeruk No. 33, Jakarta', 'STORE02', 'adit.pratama@email.com', '081234567841'),
('Bella', 'Safira', 'Jl. Pasteur No. 5, Bandung', 'STORE03', 'bella.safira@email.com', '081234567842'),
('Candra', 'Kirana', 'Jl. Darmo No. 80, Surabaya', 'STORE01', 'candra.kirana@email.com', '081234567843'),
('Dina', 'Mariana', 'Jl. Pandanaran No. 12, Semarang', 'STORE02', 'dina.mariana@email.com', '081234567844'),
('Erik', 'Thohir', 'Jl. Solo No. 4, Yogyakarta', 'STORE03', 'erik.thohir@email.com', '081234567845'),
('Fanny', 'Fabriana', 'Jl. Borobudur No. 19, Malang', 'STORE01', 'fanny.fabriana@email.com', '081234567846'),
('Gilang', 'Dirga', 'Jl. Tambun No. 2, Bekasi', 'STORE02', 'gilang.dirga@email.com', '081234567847'),
('Hesti', 'Purwadinata', 'Jl. Karawaci No. 55, Tangerang', 'STORE03', 'hesti.purwadinata@email.com', '081234567848'),
('Indra', 'Bekti', 'Jl. Tajur No. 8, Bogor', 'STORE01', 'indra.bekti@email.com', '081234567849'),
('Jihan', 'Fahira', 'Jl. Sawangan No. 1, Depok', 'STORE02', 'jihan.fahira@email.com', '081234567850');

INSERT INTO Supplier (supplierName, supplierContact, supplierAddress) VALUES 
('PT Sumber Makmur', 'Bapak Budi', 'Jl. Industri No. 12, Jakarta'),
('CV Maju Jaya', 'Ibu Siti', 'Jl. Pembangunan No. 45, Surabaya'),
('PT Global Trading', 'Bapak Andi', 'Jl. Gatot Subroto No. 8, Bandung'),
('UD Sejahtera Bersama', 'Ibu Dewi', 'Jl. Merdeka No. 21, Semarang'),
('PT Logistik Nusantara', 'Bapak Eko', 'Jl. Pelabuhan No. 5, Medan'),
('CV Prima Abadi', 'Ibu Rina', 'Jl. Sudirman No. 10, Yogyakarta'),
('PT Multi Barang', 'Bapak Agus', 'Jl. Thamrin No. 3, Makassar'),
('UD Cahaya Baru', 'Ibu Maya', 'Jl. Ahmad Yani No. 15, Palembang'),
('PT Distribusi Utama', 'Bapak Iwan', 'Jl. Diponegoro No. 7, Denpasar'),
('CV Berkah Alam', 'Ibu Ani', 'Jl. KH Ahmad Dahlan No. 9, Malang'),
('PT Sinergi Bangsa', 'Bapak Rudi', 'Jl. Asia Afrika No. 11, Bandung'),
('UD Rejeki Lancar', 'Ibu Lia', 'Jl. Gajah Mada No. 4, Jakarta'),
('PT Indogrosir Jaya', 'Bapak Dedi', 'Jl. Raden Saleh No. 18, Surabaya'),
('CV Mitra Sejati', 'Ibu Yanti', 'Jl. Imam Bonjol No. 6, Semarang'),
('PT Karya Mandiri', 'Bapak Hendra', 'Jl. Pemuda No. 2, Medan'),
('UD Tunas Harapan', 'Ibu Siska', 'Jl. Pahlawan No. 14, Yogyakarta'),
('PT Central Niaga', 'Bapak Bambang', 'Jl. Sukarno Hatta No. 25, Makassar'),
('CV Surya Gemilang', 'Ibu Ratna', 'Jl. Veteran No. 30, Palembang'),
('PT Artha Graha', 'Bapak Tono', 'Jl. Teuku Umar No. 50, Denpasar'),
('UD Makmur Sentosa', 'Ibu Sari', 'Jl. Kartini No. 5, Malang'),
('PT Buana Raya', 'Bapak Fajar', 'Jl. Wahid Hasyim No. 8, Jakarta'),
('CV Mega Persada', 'Ibu Gita', 'Jl. Braga No. 12, Bandung'),
('PT Kencana Wungu', 'Bapak Hadi', 'Jl. Basuki Rahmat No. 100, Surabaya'),
('UD Sumber Laut', 'Ibu Indra', 'Jl. Pandanaran No. 45, Semarang'),
('PT Delta Niaga', 'Bapak Joko', 'Jl. Malioboro No. 1, Yogyakarta'),
('CV Bintang Timur', 'Ibu Kartika', 'Jl. Ijen No. 10, Malang'),
('PT Indo Logistic', 'Bapak Lutfi', 'Jl. Kalimalang No. 55, Bekasi'),
('UD Jaya Abadi', 'Ibu Nana', 'Jl. BSD Boulevard No. 2, Tangerang'),
('PT Borneo Perkasa', 'Bapak Oki', 'Jl. Pajajaran No. 88, Bogor'),
('CV Nusa Indah', 'Ibu Putu', 'Jl. Margonda No. 10, Depok'),
('PT Cahaya Abadi', 'Bapak Qori', 'Jl. Kebon Jeruk No. 3, Jakarta'),
('UD Berkah Jaya', 'Ibu Rahmat', 'Jl. Dago No. 15, Bandung'),
('PT Global Mandiri', 'Bapak Slamet', 'Jl. Darmo No. 9, Surabaya'),
('CV Utama Karya', 'Ibu Tati', 'Jl. Gajah Mada No. 22, Semarang'),
('PT Sentosa Jaya', 'Bapak Ujang', 'Jl. Parangtritis No. 7, Yogyakarta'),
('UD Sari Bumi', 'Ibu Vina', 'Jl. Borobudur No. 4, Malang'),
('PT Inti Pratama', 'Bapak Wawan', 'Jl. Tambun No. 6, Bekasi'),
('CV Fortuna Sejahtera', 'Ibu Xena', 'Jl. Serpong Raya No. 1, Tangerang'),
('PT Eka Jaya', 'Bapak Yayat', 'Jl. Baranangsiang No. 9, Bogor'),
('UD Mandiri Utama', 'Ibu Zaki', 'Jl. Cinere Raya No. 12, Depok'),
('PT Lautan Luas', 'Bapak Adit', 'Jl. Tomang No. 33, Jakarta'),
('CV Serasi Makmur', 'Ibu Bella', 'Jl. Pasteur No. 5, Bandung'),
('PT Bina Karya', 'Bapak Candra', 'Jl. Mayjend Sungkono No. 80, Surabaya'),
('UD Abadi Jaya', 'Ibu Dina', 'Jl. Simpang Lima No. 12, Semarang'),
('PT Teguh Beriman', 'Bapak Erik', 'Jl. Solo-Yogya No. 4, Yogyakarta'),
('CV Cipta Pesona', 'Ibu Fanny', 'Jl. Arjosari No. 19, Malang'),
('PT Anugerah Alam', 'Bapak Gilang', 'Jl. Sultan Agung No. 2, Bekasi'),
('UD Subur Makmur', 'Ibu Hesti', 'Jl. Karawaci No. 55, Tangerang'),
('PT Berkat Melimpah', 'Bapak Indra', 'Jl. Tajur No. 8, Bogor'),
('CV Sukses Bersama', 'Ibu Jihan', 'Jl. Sawangan No. 1, Depok');

INSERT INTO Product (productName, categoryID, productPrice, productQuantity, productExpiry) VALUES 
('Beras 5kg',1,65000,50,'2027-01-01'),('Susu UHT',2,18000,100,'2026-12-01'),('Minyak 2L',3,35000,40,'2026-12-31'),('Sabun Mandi',4,25000,30,'2028-01-01'),('Wipol 800ml',5,15000,25,'2027-05-10'),
('Tenda Dome',6,450000,5,NULL),('Kertas A4',7,55000,20,NULL),('Vit C 500mg',8,45000,60,'2027-03-20'),('Lipstik Merah',9,85000,15,'2027-09-12'),('Kaos Pria',10,50000,40,NULL),
('Gamis Syari',11,150000,20,NULL),('Celana Anak',12,35000,25,NULL),('Mobil RC',13,120000,10,NULL),('Bola Basket',14,200000,8,NULL),('Lampu Meja',15,75000,12,NULL),
('Popok M50',16,60000,50,'2027-11-30'),('Puzzle 1k',17,95000,7,NULL),('Whiskas 1kg',18,55000,30,'2026-10-10'),('Palu Baja',19,45000,15,NULL),('Gelang Perak',20,150000,5,NULL),
('Garam Dapur',1,5000,100,'2028-01-01'),('Teh Kotak',2,5000,200,'2026-06-01'),('Kecap Manis',3,20000,45,'2027-02-15'),('Shampoo 170ml',4,30000,35,'2027-10-10'),('Sapu Lantai',5,25000,15,NULL),
('Carrier 60L',6,850000,3,NULL),('Pulpen Box',7,35000,50,NULL),('Masker Medis',8,25000,100,'2028-01-01'),('Bedak Tabur',9,40000,20,'2027-05-05'),('Kemeja Flanel',10,120000,15,NULL),
('Rok Plisket',11,85000,18,NULL),('Kaos Kaki Anak',12,10000,60,NULL),('Lego Set',13,350000,5,NULL),('Raket Badminton',14,500000,10,NULL),('Bingkai Foto',15,30000,25,NULL),
('Botol Susu',16,45000,20,NULL),('Gitar Akustik',17,1200000,2,NULL),('Pasir Kucing',18,75000,15,NULL),('Gergaji Kayu',19,65000,8,NULL),('Cincin Emas',20,2500000,2,NULL),
('Mie Instan',1,3000,500,'2026-12-20'),('Kopi Sachet',2,1500,1000,'2027-01-01'),('Pasta Gigi',4,12000,50,'2027-08-08'),('Spons Cuci',5,5000,40,NULL),('Kompor Gas',3,350000,5,NULL),
('Matras Yoga',14,150000,10,NULL),('Buku Tulis',7,4000,200,NULL),('Paracetamol',8,10000,100,'2027-01-01'),('Eyeliner',9,55000,12,'2027-02-01'),('Singlet Pria',10,25000,30,NULL),
('Hijab Pashmina',11,35000,50,NULL),('Jaket Anak',12,95000,12,NULL),('Boneka Bear',13,75000,15,NULL),('Dumbbell 5kg',14,125000,6,NULL),('Vas Bunga',15,45000,10,NULL),
('Bedak Bayi',16,20000,30,'2027-01-01'),('Hot Wheels',17,30000,40,NULL),('Shampoo Kucing',18,45000,10,'2027-01-01'),('Kunci Inggris',19,85000,5,NULL),('Jam Tangan',20,350000,8,NULL),
('Roti Tawar',1,15000,20,'2026-04-30'),('Yogurt Drink',2,10000,40,'2026-05-15'),('Blue Band',3,12000,30,'2026-12-01'),('Tissue Antiseptik',4,10000,60,'2027-01-01'),('Pembersih Kaca',5,12000,20,'2027-06-01'),
('Senter LED',6,55000,15,NULL),('Spidol Board',7,10000,40,NULL),('Betadine',8,25000,25,'2027-01-01'),('Foundation',9,120000,10,'2027-01-01'),('Boxer Pria',10,35000,25,NULL),
('Blouse Kerja',11,110000,15,NULL),('Sepatu Anak',12,130000,10,NULL),('Kitchen Set Toy',13,250000,4,NULL),('Sepatu Lari',14,650000,6,NULL),('Wall Sticker',15,15000,50,NULL),
('Gendongan',16,180000,5,NULL),('Kartu Pokemon',17,50000,100,NULL),('Snack Anjing',18,35000,20,'2026-12-01'),('Bor Listrik',19,550000,3,NULL),('Topi Snapback',20,75000,15,NULL),
('Biskuit Kaleng',1,45000,15,'2027-01-01'),('Sirup Marjan',2,22000,50,'2027-10-01'),('Saos Sambal',3,15000,40,'2027-05-01'),('Sikat Gigi',4,8000,100,'2028-01-01'),('Karbol 400ml',5,10000,30,'2027-01-01'),
('Sleeping Bag',6,150000,10,NULL),('Map Folio',7,2000,500,NULL),('Antangin Box',8,40000,30,'2027-01-01'),('Blush On',9,65000,15,'2027-01-01'),('Jaket Hoodie',10,180000,10,NULL),
('Tunik Muslim',11,140000,12,NULL),('Piyama Anak',12,55000,20,NULL),('Mainan Pasir',13,45000,15,NULL),('Jersey Bola',14,95000,30,NULL),('Taplak Meja',15,25000,20,NULL),
('Sabun Bayi',16,15000,40,'2027-01-01'),('Action Figure',17,250000,5,NULL),('Kandang Burung',18,150000,3,NULL),('Tang Kombinasi',19,35000,12,NULL),('Anting Hijab',20,25000,50,NULL);

INSERT INTO Customer (memberTier, customerPhone, customerEmail) VALUES 
(1,'0812000001','c1@mail.com'),(2,'0812000002','c2@mail.com'),(3,'0812000003','c3@mail.com'),(1,'0812000004','c4@mail.com'),(2,'0812000005','c5@mail.com'),
(3,'0812000006','c6@mail.com'),(1,'0812000007','c7@mail.com'),(2,'0812000008','c8@mail.com'),(3,'0812000009','c9@mail.com'),(1,'0812000010','c10@mail.com'),
(1,'0812000011','c11@mail.com'),(2,'0812000012','c12@mail.com'),(3,'0812000013','c13@mail.com'),(1,'0812000014','c14@mail.com'),(2,'0812000015','c15@mail.com'),
(3,'0812000016','c16@mail.com'),(1,'0812000017','c17@mail.com'),(2,'0812000018','c18@mail.com'),(3,'0812000019','c19@mail.com'),(1,'0812000020','c20@mail.com'),
(1,'0812000021','c21@mail.com'),(2,'0812000022','c22@mail.com'),(3,'0812000023','c23@mail.com'),(1,'0812000024','c24@mail.com'),(2,'0812000025','c25@mail.com'),
(3,'0812000026','c26@mail.com'),(1,'0812000027','c27@mail.com'),(2,'0812000028','c28@mail.com'),(3,'0812000029','c29@mail.com'),(1,'0812000030','c30@mail.com'),
(1,'0812000031','c31@mail.com'),(2,'0812000032','c32@mail.com'),(3,'0812000033','c33@mail.com'),(1,'0812000034','c34@mail.com'),(2,'0812000035','c35@mail.com'),
(3,'0812000036','c36@mail.com'),(1,'0812000037','c37@mail.com'),(2,'0812000038','c38@mail.com'),(3,'0812000039','c39@mail.com'),(1,'0812000040','c40@mail.com'),
(1,'0812000041','c41@mail.com'),(2,'0812000042','c42@mail.com'),(3,'0812000043','c43@mail.com'),(1,'0812000044','c44@mail.com'),(2,'0812000045','c45@mail.com'),
(3,'0812000046','c46@mail.com'),(1,'0812000047','c47@mail.com'),(2,'0812000048','c48@mail.com'),(3,'0812000049','c49@mail.com'),(1,'0812000050','c50@mail.com'),
(1,'0812000051','c51@mail.com'),(2,'0812000052','c52@mail.com'),(3,'0812000053','c53@mail.com'),(1,'0812000054','c54@mail.com'),(2,'0812000055','c55@mail.com'),
(3,'0812000056','c56@mail.com'),(1,'0812000057','c57@mail.com'),(2,'0812000058','c58@mail.com'),(3,'0812000059','c59@mail.com'),(1,'0812000060','c60@mail.com'),
(1,'0812000061','c61@mail.com'),(2,'0812000062','c62@mail.com'),(3,'0812000063','c63@mail.com'),(1,'0812000064','c64@mail.com'),(2,'0812000065','c65@mail.com'),
(3,'0812000066','c66@mail.com'),(1,'0812000067','c67@mail.com'),(2,'0812000068','c68@mail.com'),(3,'0812000069','c69@mail.com'),(1,'0812000070','c70@mail.com'),
(1,'0812000071','c71@mail.com'),(2,'0812000072','c72@mail.com'),(3,'0812000073','c73@mail.com'),(1,'0812000074','c74@mail.com'),(2,'0812000075','c75@mail.com'),
(3,'0812000076','c76@mail.com'),(1,'0812000077','c77@mail.com'),(2,'0812000078','c78@mail.com'),(3,'0812000079','c79@mail.com'),(1,'0812000080','c80@mail.com'),
(1,'0812000081','c81@mail.com'),(2,'0812000082','c82@mail.com'),(3,'0812000083','c83@mail.com'),(1,'0812000084','c84@mail.com'),(2,'0812000085','c85@mail.com'),
(3,'0812000086','c86@mail.com'),(1,'0812000087','c87@mail.com'),(2,'0812000088','c88@mail.com'),(3,'0812000089','c89@mail.com'),(1,'0812000090','c90@mail.com'),
(1,'0812000091','c91@mail.com'),(2,'0812000092','c92@mail.com'),(3,'0812000093','c93@mail.com'),(1,'0812000094','c94@mail.com'),(2,'0812000095','c95@mail.com'),
(3,'0812000096','c96@mail.com'),(1,'0812000097','c97@mail.com'),(2,'0812000098','c98@mail.com'),(3,'0812000099','c99@mail.com'),(1,'0812000100','c100@mail.com');

INSERT INTO Transaction (transactionDate, customerID, empID, totalDiscount, transactionAmount) VALUES 
('2026-04-01 08:00:00',1,1,0,100000),('2026-04-01 08:30:00',2,2,5000,95000),('2026-04-01 09:00:00',3,3,10000,90000),('2026-04-01 09:30:00',4,4,0,50000),('2026-04-01 10:00:00',5,5,5000,45000),
('2026-04-01 10:30:00',6,6,10000,150000),('2026-04-01 11:00:00',7,7,0,25000),('2026-04-01 11:30:00',8,8,5000,20000),('2026-04-01 12:00:00',9,9,10000,250000),('2026-04-01 12:30:00',10,10,0,15000),
('2026-04-02 08:00:00',11,11,0,30000),('2026-04-02 08:30:00',12,12,2000,18000),('2026-04-02 09:00:00',13,13,5000,45000),('2026-04-02 09:30:00',14,14,0,12000),('2026-04-02 10:00:00',15,15,3000,27000),
('2026-04-02 10:30:00',16,16,8000,72000),('2026-04-02 11:00:00',17,17,0,10000),('2026-04-02 11:30:00',18,18,1000,9000),('2026-04-02 12:00:00',19,19,12000,108000),('2026-04-02 12:30:00',20,20,0,50000),
('2026-04-03 08:00:00',21,21,0,100000),('2026-04-03 08:30:00',22,22,5000,95000),('2026-04-03 09:00:00',23,23,10000,90000),('2026-04-03 09:30:00',24,24,0,50000),('2026-04-03 10:00:00',25,25,5000,45000),
('2026-04-03 10:30:00',26,26,10000,150000),('2026-04-03 11:00:00',27,27,0,25000),('2026-04-03 11:30:00',28,28,5000,20000),('2026-04-03 12:00:00',29,29,10000,250000),('2026-04-03 12:30:00',30,30,0,15000),
('2026-04-04 08:00:00',31,31,0,30000),('2026-04-04 08:30:00',32,32,2000,18000),('2026-04-04 09:00:00',33,33,5000,45000),('2026-04-04 09:30:00',34,34,0,12000),('2026-04-04 10:00:00',35,35,3000,27000),
('2026-04-04 10:30:00',36,36,8000,72000),('2026-04-04 11:00:00',37,37,0,10000),('2026-04-04 11:30:00',38,38,1000,9000),('2026-04-04 12:00:00',39,39,12000,108000),('2026-04-04 12:30:00',40,40,0,50000),
('2026-04-05 08:00:00',41,41,0,100000),('2026-04-05 08:30:00',42,42,5000,95000),('2026-04-05 09:00:00',43,43,10000,90000),('2026-04-05 09:30:00',44,44,0,50000),('2026-04-05 10:00:00',45,45,5000,45000),
('2026-04-05 10:30:00',46,46,10000,150000),('2026-04-05 11:00:00',47,47,0,25000),('2026-04-05 11:30:00',48,48,5000,20000),('2026-04-05 12:00:00',49,49,10000,250000),('2026-04-05 12:30:00',50,50,0,15000),
('2026-04-06 08:00:00',51,1,0,100000),('2026-04-06 08:30:00',52,2,5000,95000),('2026-04-06 09:00:00',53,3,10000,90000),('2026-04-06 09:30:00',54,4,0,50000),('2026-04-06 10:00:00',55,5,5000,45000),
('2026-04-06 10:30:00',56,6,10000,150000),('2026-04-06 11:00:00',57,7,0,25000),('2026-04-06 11:30:00',58,8,5000,20000),('2026-04-06 12:00:00',59,9,10000,250000),('2026-04-06 12:30:00',60,10,0,15000),
('2026-04-07 08:00:00',61,11,0,30000),('2026-04-07 08:30:00',62,12,2000,18000),('2026-04-07 09:00:00',63,13,5000,45000),('2026-04-07 09:30:00',64,14,0,12000),('2026-04-07 10:00:00',65,15,3000,27000),
('2026-04-07 10:30:00',66,16,8000,72000),('2026-04-07 11:00:00',67,17,0,10000),('2026-04-07 11:30:00',68,18,1000,9000),('2026-04-07 12:00:00',69,19,12000,108000),('2026-04-07 12:30:00',70,20,0,50000),
('2026-04-08 08:00:00',71,21,0,100000),('2026-04-08 08:30:00',72,22,5000,95000),('2026-04-08 09:00:00',73,23,10000,90000),('2026-04-08 09:30:00',74,24,0,50000),('2026-04-08 10:00:00',75,25,5000,45000),
('2026-04-08 10:30:00',76,26,10000,150000),('2026-04-08 11:00:00',77,27,0,25000),('2026-04-08 11:30:00',78,28,5000,20000),('2026-04-08 12:00:00',79,29,10000,250000),('2026-04-08 12:30:00',80,30,0,15000),
('2026-04-09 08:00:00',81,31,0,30000),('2026-04-09 08:30:00',82,32,2000,18000),('2026-04-09 09:00:00',83,33,5000,45000),('2026-04-09 09:30:00',84,34,0,12000),('2026-04-09 10:00:00',85,35,3000,27000),
('2026-04-09 10:30:00',86,36,8000,72000),('2026-04-09 11:00:00',87,37,0,10000),('2026-04-09 11:30:00',88,38,1000,9000),('2026-04-09 12:00:00',89,39,12000,108000),('2026-04-09 12:30:00',90,40,0,50000),
('2026-04-10 08:00:00',91,41,0,100000),('2026-04-10 08:30:00',92,42,5000,95000),('2026-04-10 09:00:00',93,43,10000,90000),('2026-04-10 09:30:00',94,44,0,50000),('2026-04-10 10:00:00',95,45,5000,45000),
('2026-04-10 10:30:00',96,46,10000,150000),('2026-04-10 11:00:00',97,47,0,25000),('2026-04-10 11:30:00',98,48,5000,20000),('2026-04-10 12:00:00',99,49,10000,250000),('2026-04-10 12:30:00',100,50,0,15000);

INSERT INTO Payments (transactionID, paymentMethod, paymentDate, paymentPaid, paymentChange) VALUES 
(1,'CASH','2026-04-01',100000,0),(2,'CASHLESS','2026-04-01',95000,0),(3,'CASH','2026-04-01',100000,10000),(4,'CASHLESS','2026-04-01',50000,0),(5,'CASH','2026-04-01',50000,5000),
(6,'CASH','2026-04-01',150000,0),(7,'CASHLESS','2026-04-01',25000,0),(8,'CASH','2026-04-01',50000,30000),(9,'CASHLESS','2026-04-01',250000,0),(10,'CASH','2026-04-01',20000,5000),
(11,'CASH','2026-04-02',30000,0),(12,'CASHLESS','2026-04-02',18000,0),(13,'CASH','2026-04-02',50000,5000),(14,'CASHLESS','2026-04-02',12000,0),(15,'CASH','2026-04-02',30000,3000),
(16,'CASH','2026-04-02',80000,8000),(17,'CASHLESS','2026-04-02',10000,0),(18,'CASH','2026-04-02',10000,1000),(19,'CASHLESS','2026-04-02',108000,0),(20,'CASH','2026-04-02',50000,0),
(21,'CASH','2026-04-03',100000,0),(22,'CASHLESS','2026-04-03',95000,0),(23,'CASH','2026-04-03',100000,10000),(24,'CASHLESS','2026-04-03',50000,0),(25,'CASH','2026-04-03',50000,5000),
(26,'CASH','2026-04-03',150000,0),(27,'CASHLESS','2026-04-03',25000,0),(28,'CASH','2026-04-03',50000,30000),(29,'CASHLESS','2026-04-03',250000,0),(30,'CASH','2026-04-03',20000,5000),
(31,'CASH','2026-04-04',30000,0),(32,'CASHLESS','2026-04-04',18000,0),(33,'CASH','2026-04-04',50000,5000),(34,'CASHLESS','2026-04-04',12000,0),(35,'CASH','2026-04-04',30000,3000),
(36,'CASH','2026-04-04',80000,8000),(37,'CASHLESS','2026-04-04',10000,0),(38,'CASH','2026-04-04',10000,1000),(39,'CASHLESS','2026-04-04',108000,0),(40,'CASH','2026-04-04',50000,0),
(41,'CASH','2026-04-05',100000,0),(42,'CASHLESS','2026-04-05',95000,0),(43,'CASH','2026-04-05',100000,10000),(44,'CASHLESS','2026-04-05',50000,0),(45,'CASH','2026-04-05',50000,5000),
(46,'CASH','2026-04-05',150000,0),(47,'CASHLESS','2026-04-05',25000,0),(48,'CASH','2026-04-05',50000,30000),(49,'CASHLESS','2026-04-05',250000,0),(50,'CASH','2026-04-05',20000,5000),
(51,'CASH','2026-04-06',100000,0),(52,'CASHLESS','2026-04-06',95000,0),(53,'CASH','2026-04-06',100000,10000),(54,'CASHLESS','2026-04-06',50000,0),(55,'CASH','2026-04-06',50000,5000),
(56,'CASH','2026-04-06',150000,0),(57,'CASHLESS','2026-04-06',25000,0),(58,'CASH','2026-04-06',50000,30000),(59,'CASHLESS','2026-04-06',250000,0),(60,'CASH','2026-04-06',20000,5000),
(61,'CASH','2026-04-07',30000,0),(62,'CASHLESS','2026-04-07',18000,0),(63,'CASH','2026-04-07',50000,5000),(64,'CASHLESS','2026-04-07',12000,0),(65,'CASH','2026-04-07',30000,3000),
(66,'CASH','2026-04-07',80000,8000),(67,'CASHLESS','2026-04-07',10000,0),(68,'CASH','2026-04-07',10000,1000),(69,'CASHLESS','2026-04-07',108000,0),(70,'CASH','2026-04-07',50000,0),
(71,'CASH','2026-04-08',100000,0),(72,'CASHLESS','2026-04-08',95000,0),(73,'CASH','2026-04-08',100000,10000),(74,'CASHLESS','2026-04-08',50000,0),(75,'CASH','2026-04-08',50000,5000),
(76,'CASH','2026-04-08',150000,0),(77,'CASHLESS','2026-04-08',25000,0),(78,'CASH','2026-04-08',50000,30000),(79,'CASHLESS','2026-04-08',250000,0),(80,'CASH','2026-04-08',20000,5000),
(81,'CASH','2026-04-09',30000,0),(82,'CASHLESS','2026-04-09',18000,0),(83,'CASH','2026-04-09',50000,5000),(84,'CASHLESS','2026-04-09',12000,0),(85,'CASH','2026-04-09',30000,3000),
(86,'CASH','2026-04-09',80000,8000),(87,'CASHLESS','2026-04-09',10000,0),(88,'CASH','2026-04-09',10000,1000),(89,'CASHLESS','2026-04-09',108000,0),(90,'CASH','2026-04-09',50000,0),
(91,'CASH','2026-04-10',100000,0),(92,'CASHLESS','2026-04-10',95000,0),(93,'CASH','2026-04-10',100000,10000),(94,'CASHLESS','2026-04-10',50000,0),(95,'CASH','2026-04-10',50000,5000),
(96,'CASH','2026-04-10',150000,0),(97,'CASHLESS','2026-04-10',25000,0),(98,'CASH','2026-04-10',50000,30000),(99,'CASHLESS','2026-04-10',250000,0),(100,'CASH','2026-04-10',20000,5000);

INSERT INTO TransactionDetails (transactionID, productID, productQuantity, productPrice, productSubtotal) VALUES 
(1,1,1,65000,65000),(1,41,5,3000,15000),(2,2,2,18000,36000),(3,3,2,35000,70000),(4,4,1,25000,25000),
(5,5,1,15000,15000),(6,6,1,450000,450000),(7,7,1,55000,55000),(8,8,1,45000,45000),(9,9,1,85000,85000),
(10,10,1,50000,50000),(11,11,1,150000,150000),(12,12,1,35000,35000),(13,13,1,120000,120000),(14,14,1,200000,200000),
(15,15,1,75000,75000),(16,16,1,60000,60000),(17,17,1,95000,95000),(18,18,1,55000,55000),(19,19,1,45000,45000),
(20,20,1,150000,150000),(21,21,5,5000,25000),(22,22,5,5000,25000),(23,23,2,20000,40000),(24,24,1,30000,30000),
(25,25,1,25000,25000),(26,26,1,850000,850000),(27,27,1,35000,35000),(28,28,2,25000,50000),(29,29,2,40000,80000),
(30,30,1,120000,120000),(31,31,1,85000,85000),(32,32,1,10000,10000),(33,33,1,350000,350000),(34,34,1,500000,500000),
(35,35,1,30000,30000),(36,36,1,45000,45000),(37,37,1,1200000,1200000),(38,38,1,75000,75000),(39,39,1,65000,65000),
(40,40,1,2500000,2500000),(41,41,10,3000,30000),(42,42,10,1500,15000),(43,43,2,12000,24000),(44,44,2,5000,10000),
(45,45,1,350000,350000),(46,46,1,150000,150000),(47,47,5,4000,20000),(48,48,2,10000,20000),(49,49,1,55000,55000),
(50,50,1,25000,25000),(51,51,2,35000,70000),(52,52,1,95000,95000),(53,53,1,75000,75000),(54,54,1,125000,125000),
(55,55,1,45000,45000),(56,56,1,20000,20000),(57,57,1,30000,30000),(58,58,1,45000,45000),(59,59,1,85000,85000),
(60,60,1,350000,350000),(61,61,1,15000,15000),(62,62,1,10000,10000),(63,63,2,12000,24000),(64,64,1,10000,10000),
(65,65,1,12000,12000),(66,66,1,55000,55000),(67,67,1,10000,10000),(68,68,1,25000,25000),(69,69,1,120000,120000),
(70,70,1,35000,35000),(71,71,1,110000,110000),(72,72,1,130000,130000),(73,73,1,250000,250000),(74,74,1,650000,650000),
(75,75,1,15000,15000),(76,76,1,180000,180000),(77,77,2,50000,100000),(78,78,1,35000,35000),(79,79,1,550000,550000),
(80,80,1,75000,75000),(81,81,1,45000,45000),(82,82,1,22000,22000),(83,83,1,15000,15000),(84,84,2,8000,16000),
(85,85,1,10000,10000),(86,86,1,150000,150000),(87,87,10,2000,20000),(88,88,1,40000,40000),(89,89,1,65000,65000),
(90,90,1,180000,180000),(91,91,1,140000,140000),(92,92,1,55000,55000),(93,93,1,45000,45000),(94,94,1,95000,95000),
(95,95,1,25000,25000),(96,96,1,15000,15000),(97,97,1,250000,250000),(98,98,1,150000,150000),(99,99,1,35000,35000),(100,100,1,25000,25000);

INSERT INTO PurchaseSupplier (productID, supplierID, Price) VALUES 
(1,1,55000),(2,2,15000),(3,3,30000),(4,4,20000),(5,5,12000),(6,6,400000),(7,7,45000),(8,8,35000),(9,9,70000),(10,10,40000),
(11,11,130000),(12,12,28000),(13,13,100000),(14,14,180000),(15,15,60000),(16,16,50000),(17,17,80000),(18,18,45000),(19,19,35000),(20,20,130000),
(21,21,4000),(22,22,4000),(23,23,17000),(24,24,25000),(25,25,20000),(26,26,750000),(27,27,28000),(28,28,20000),(29,29,32000),(30,30,100000),
(31,31,70000),(32,32,8000),(33,33,300000),(34,34,450000),(35,35,25000),(36,36,38000),(37,37,1000000),(38,38,65000),(39,39,55000),(40,40,2200000),
(41,41,2500),(42,42,1200),(43,43,9000),(44,44,4000),(45,45,300000),(46,46,130000),(47,47,3200),(48,48,8000),(49,49,48000),(50,50,20000),
(51,1,28000),(52,2,80000),(53,3,65000),(54,4,100000),(55,5,38000),(56,6,15000),(57,7,25000),(58,8,38000),(59,9,75000),(60,10,300000),
(61,11,12000),(62,12,8000),(63,13,9500),(64,14,8000),(65,15,10000),(66,16,45000),(67,17,8000),(68,18,20000),(69,19,100000),(70,20,28000),
(71,21,90000),(72,22,110000),(73,23,220000),(74,24,580000),(75,25,12000),(76,26,160000),(77,27,42000),(78,28,28000),(79,29,480000),(80,30,65000),
(81,31,38000),(82,32,18000),(83,33,12000),(84,34,6500),(85,35,8500),(86,36,130000),(87,37,1600),(88,38,35000),(89,39,55000),(90,40,160000),
(91,41,125000),(92,42,48000),(93,43,38000),(94,44,80000),(95,45,20000),(96,46,12000),(97,47,220000),(98,48,130000),(99,49,28000),(100,50,20000);


# QUERIES
# 1. Total Revenue (7 Hari)
SELECT SUM(transactionAmount) AS TotalRevenue
FROM Transaction
WHERE transactionDate >= (SELECT MAX(transactionDate) FROM Transaction) - INTERVAL 7 DAY;

# 2. Total transaksi 
SELECT COUNT(*) AS TotalTransactions
FROM Transaction;

# 3. Total produk
SELECT COUNT(*) AS TotalProducts
FROM Product;

# 4. total stock produk rendah beserta jumlah stock terendah  
SELECT COUNT(*) AS LowStockProducts, MIN(productQuantity) AS LowestStock
FROM Product
WHERE productQuantity < 10;

# 5. Top 5 produk terlaris
SELECT product.productName, SUM(transactiondetails.productQuantity) AS totalSold, SUM(transactiondetails.productSubtotal) AS totalRevenue
FROM TransactionDetails JOIN Product ON transactiondetails.productID = product.productID
GROUP BY transactiondetails.productID
ORDER BY totalSold DESC
LIMIT 5;

# 6. Trend Penjualan Harian
SELECT DATE(transactionDate) AS date, SUM(transactionAmount) AS dailyRevenue, COUNT(*) AS totalTransactions
FROM `Transaction`
GROUP BY DATE(transactionDate)
ORDER BY date;

# 7. penjualan per kategori
SELECT 
    category.categoryName, SUM(transactiondetails.productSubtotal) AS TotalSales,
    ROUND(SUM(transactiondetails.productSubtotal) * 100.0 /(SELECT SUM(productSubtotal) FROM TransactionDetails),1) AS Percentage
FROM TransactionDetails JOIN Product ON transactiondetails.productID = product.productID
JOIN Category ON product.categoryID = category.categoryID
GROUP BY category.categoryID, category.categoryName
ORDER BY TotalSales DESC;

# 8. Metode Pembayaran
SELECT paymentMethod, COUNT(*) AS TotalTransactions
FROM Payments GROUP BY paymentMethod;

# 9. Transaksi Terbaru
SELECT 
    CONCAT('#TRX-', LPAD(transaction.transactionID, 3, '0')) AS TransactionCode, transaction.transactionDate,customer.customerEmail,
    CONCAT(employee.empFname, ' ', employee.empLname) AS Cashier, transaction.transactionAmount
FROM Transaction 
LEFT JOIN Customer ON transaction.customerID = customer.customerID
LEFT JOIN Employee ON transaction.empID = employee.empID
ORDER BY transaction.transactionDate DESC
LIMIT 10;

# 10. 5 Produk dengan harga jual termahal
SELECT productName, productPrice FROM Product ORDER BY productPrice DESC LIMIT 5;

# 11. Produk expired tahun 2026 (mengabaikan tanggal dummy 2099)
SELECT productName, productExpiry FROM Product WHERE productExpiry BETWEEN '2026-01-01' AND '2026-12-31' AND productExpiry != '2099-12-31';

# 12. Total nilai aset (Harga x Stok) di gudang
SELECT SUM(productPrice * productQuantity) AS TotalAssetValue FROM Product;

# 13. Active Customer 
SELECT COUNT(DISTINCT customerID) AS ActiveCustomers
FROM Transaction;

# 14. Jumlah pelanggan per tier member
SELECT memberTier, COUNT(*) AS TotalCustomers FROM Customer GROUP BY memberTier;

# 15. Daftar email pelanggan tier Gold (ID 3)
SELECT customerEmail FROM Customer WHERE memberTier = 3;

# 16. Top 5 pelanggan yang paling sering belanja
SELECT customerID, COUNT(*) AS VisitCount FROM Transaction GROUP BY customerID ORDER BY VisitCount DESC LIMIT 5;

# 17. Total pengeluaran (Loyalty Value) per pelanggan
SELECT customerID, SUM(transactionAmount) AS TotalSpent FROM Transaction GROUP BY customerID;

# 18. List rate diskon tiap tier
SELECT Tiername, discountRate FROM Member;

# 19. Jumlah transaksi yang dilayani tiap karyawan
SELECT empID, COUNT(*) AS TransactionsHandled FROM Transaction GROUP BY empID;

# 20. Karyawan yang terdaftar di STORE01
SELECT empFname, empLname FROM Employee WHERE Storecode = 'STORE01';

# 21. Karyawan dengan total nilai penjualan tertinggi
SELECT empID, SUM(transactionAmount) AS TotalSales FROM Transaction GROUP BY empID ORDER BY TotalSales DESC LIMIT 1;

# 22. Daftar produk dan nama supplier penyedianya
SELECT p.productName, s.supplierName FROM Product p JOIN PurchaseSupplier ps ON p.productID = ps.productID JOIN Supplier s ON s.supplierID = ps.supplierID;

# 23. list stock terendah
SELECT 
    productName, CONCAT('SKU-', LPAD(productID, 3, '0')) AS SKU,
    productQuantity AS Stock, 'KRITIS' AS Status
    FROM Product
    WHERE productQuantity < 5
    ORDER BY productQuantity ASC
    LIMIT 5;

# 24. Produk dengan margin keuntungan (Profit) tertinggi
SELECT p.productName, (p.productPrice - ps.Price) AS Margin FROM Product p JOIN PurchaseSupplier ps ON p.productID = ps.productID ORDER BY Margin DESC LIMIT 5;

# 25. Isi keranjang belanja (items) pada Transaksi ID 1
SELECT p.productName, td.productQuantity, td.productSubtotal FROM TransactionDetails td JOIN Product p ON td.productID = p.productID WHERE td.transactionID = 1;

# 26. Daftar produk beserta nama kategorinya
SELECT p.productName, c.categoryName FROM Product p JOIN Category c ON p.categoryID = c.categoryID;

# 27. Total item terjual khusus kategori 'Makanan' (ID 1)
SELECT SUM(td.productQuantity) AS ItemsSold FROM TransactionDetails td JOIN Product p ON td.productID = p.productID WHERE p.categoryID = 1;

# 28. Nominal kembalian (Change) terbesar yang pernah diberikan
SELECT MAX(paymentChange) FROM Payments;

# 29. Transaksi CASH yang dilakukan oleh member Gold
SELECT t.transactionID FROM Transaction t JOIN Customer c ON t.customerID = c.customerID JOIN Payments p ON t.transactionID = p.transactionID WHERE c.memberTier = 3 AND p.paymentMethod = 'CASH';

# 30. Histori pembelian pelanggan
SELECT 
    CONCAT('#TRX-', LPAD(transaction.transactionID, 3, '0')) AS TransactionCode,
    DATE_FORMAT(transaction.transactionDate, '%d %b %H:%i') AS Waktu, customer.customerEmail, product.productName
FROM Transaction
JOIN Customer ON transaction.customerID = customer.customerID
JOIN TransactionDetails ON transaction.transactionID = transactiondetails.transactionID
JOIN Product ON transactiondetails.productID = product.productID
ORDER BY transaction.transactionDate DESC;


# VIEWS
# 1. View untuk melihat katalog produk lengkap dengan nama kategori
CREATE VIEW View_KatalogProduk AS
SELECT product.productID, product.productName, category.categoryName, product.productPrice, product.productQuantity
FROM Product JOIN Category ON product.categoryID = category.categoryID;

# 2. View untuk revenue & transaksi
CREATE VIEW View_Dashboard AS
SELECT 
    SUM(transactionAmount) AS TotalRevenue,
    COUNT(transactionID) AS TotalTransactions
FROM Transaction;

# 3. View untuk daftar member aktif beserta nama tier-nya
CREATE VIEW View_DaftarMember AS
SELECT c.customerID, c.customerEmail, m.Tiername, m.discountRate
FROM Customer c
JOIN Member m ON c.memberTier = m.memberTier;

# 4. View untuk memantau stok produk 
CREATE OR REPLACE VIEW View_Dashboard_Stok AS
SELECT 
    (SELECT COUNT(*) FROM Product) AS TotalProduk,
    (SELECT COUNT(*) FROM Product WHERE productQuantity < 10) AS StokMenipis;

# 5. View untuk melihat performa penjualan per kategori
CREATE VIEW View_PerformaKategori AS
SELECT 
    c.categoryName, 
    SUM(td.productSubtotal) AS TotalOmzet,
    ROUND(SUM(td.productSubtotal) * 100.0 / (SELECT SUM(productSubtotal) FROM TransactionDetails), 1) AS Persentase
FROM TransactionDetails td
JOIN Product p ON td.productID = p.productID
JOIN Category c ON p.categoryID = c.categoryID
GROUP BY c.categoryName
ORDER BY TotalOmzet DESC;

# 6. View untuk melihat transaksi terbaru
CREATE VIEW View_Dashboard_TransaksiTerbaru AS
SELECT 
    t.transactionID AS ID, 
    DATE_FORMAT(t.transactionDate, '%d %b %H:%i') AS Waktu, 
    c.customerEmail AS Pelanggan, 
    e.empFname AS Kasir
FROM Transaction t
JOIN Customer c ON t.customerID = c.customerID
JOIN Employee e ON t.empID = e.empID
ORDER BY t.transactionDate DESC
LIMIT 10;

# 7. View untuk melihat profit per produk (Harga Jual - Harga Beli Supplier)
CREATE VIEW View_AnalisisProfit AS
SELECT p.productName, (p.productPrice - MIN(ps.Price)) AS ProfitPerUnit
FROM Product p
JOIN PurchaseSupplier ps ON p.productID = ps.productID
GROUP BY p.productID;

# 8. View untuk memantau barang yang segera kadaluwarsa (6 bulan ke depan)
CREATE VIEW View_MendekatiExpired AS
SELECT productName, productExpiry 
FROM Product 
WHERE productExpiry BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
AND productExpiry != '2099-12-31';

# 9. View untuk melihat rata-rata belanja member vs non-member (asumsi tier 1 adalah Bronze/Basic)
CREATE VIEW View_RataBelanjaMember AS
SELECT m.Tiername, AVG(t.transactionAmount) AS RataRataBelanja
FROM Transaction t
JOIN Customer c ON t.customerID = c.customerID
JOIN Member m ON c.memberTier = m.memberTier
GROUP BY m.Tiername;

# 10. View untuk daftar supplier dan jumlah produk yang mereka pasok
CREATE VIEW View_ProduktivitasSupplier AS
SELECT s.supplierName, COUNT(ps.productID) AS JumlahProduk
FROM Supplier s
JOIN PurchaseSupplier ps ON s.supplierID = ps.supplierID
GROUP BY s.supplierName;

# 11. View untuk melihat proporsi transaksi antara pengunaan CASH dengan penggunaan CASHLESS
CREATE VIEW View_Dashboard_MetodePembayaran AS
SELECT 
    paymentMethod, COUNT(transactionID) AS JumlahTransaksi
FROM Payments
GROUP BY paymentMethod;

# 12. View untuk melihat sebaran karyawan di setiap Store
CREATE VIEW View_DistribusiKaryawan AS
SELECT Storecode, COUNT(empID) AS JumlahKaryawan
FROM Employee
GROUP BY Storecode;

# 13. View untuk melihat produk yang paling sering dibeli (Top 5 Best Seller)
CREATE VIEW View_Top5Produk AS
SELECT 
    p.productName, 
    SUM(td.productQuantity) AS TotalKuantitasTerjual, 
    SUM(td.productSubtotal) AS TotalRevenue
FROM TransactionDetails td
JOIN Product p ON td.productID = p.productID
GROUP BY p.productName
ORDER BY TotalKuantitasTerjual DESC
LIMIT 5;

# 14. View untuk melihat total poin yang dikumpulkan setiap pelanggan
CREATE VIEW View_PoinPelanggan AS
SELECT c.customerID, c.customerEmail, m.totalPoints
FROM Customer c
JOIN Member m ON c.memberTier = m.memberTier;

# 15. View untuk melihat jam-jam sibuk transaksi
CREATE VIEW View_JamSibuk AS
SELECT HOUR(transactionDate) AS Jam, COUNT(*) AS FrekuensiTransaksi
FROM Transaction
GROUP BY Jam;

# 16. View untuk melihat pengeluaran stok berdasarkan kategori (Kuantitas total)
CREATE VIEW View_VolumeKeluarKategori AS
SELECT c.categoryName, SUM(td.productQuantity) AS VolumeKeluar
FROM TransactionDetails td
JOIN Product p ON td.productID = p.productID
JOIN Category c ON p.categoryID = c.categoryID
GROUP BY c.categoryName;

# 17. View untuk melihat kontak darurat seluruh supplier
CREATE VIEW View_KontakSupplier AS
SELECT supplierName, supplierContact, supplierAddress
FROM Supplier;

# 18. View untuk melihat transaksi dengan diskon di atas 5000
CREATE VIEW View_TransaksiDiskonBesar AS
SELECT transactionID, totalDiscount, transactionAmount
FROM Transaction
WHERE totalDiscount > 5000;

# 19. View untuk melihat performa kasir (Total uang yang dikumpulkan)
CREATE VIEW View_OmzetKasir AS
SELECT e.empFname, SUM(t.transactionAmount) AS TotalOmzet
FROM Transaction t
JOIN Employee e ON t.empID = e.empID
GROUP BY e.empFname;

# 20. View untuk melihat daftar produk non-konsumsi (yang expiry date-nya dummy)
CREATE VIEW View_ProdukAwet AS
SELECT productName, productPrice 
FROM Product 
WHERE productExpiry = '2099-12-31';