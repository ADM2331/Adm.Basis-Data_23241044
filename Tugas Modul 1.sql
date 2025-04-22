CREATE DATABASE travel_bus;
USE travel_bus;

-- Membuat tabel Costumer
CREATE TABLE CUSTOMER (
id_customer INT AUTO_INCREMENT PRIMARY KEY,
nama VARCHAR(100),
no_tlp VARCHAR(20),
alamat TEXT
);
-- Membuat tabel Agen
CREATE TABLE AGEN (
nik CHAR(16) PRIMARY KEY,
nama_agen VARCHAR(100),
alamat TEXT,
no_tlp VARCHAR(20),
jenis_kelamin ENUM ('Laki-Laki', 'Perempuan')
);
-- Membuat tabel Bus
CREATE TABLE BUS (
id_bus INT AUTO_INCREMENT PRIMARY KEY,
nama_bus VARCHAR(100),
no_plat VARCHAR(20),
tujuan VARCHAR(100),
warna_bus VARCHAR(50),
nik_agen CHAR(16),
FOREIGN KEY (nik_agen) REFERENCES AGEN(nik)
);
-- Membuat tabel Jadwal
CREATE TABLE JADWAL (
id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
jam TIME,
hari ENUM('Senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu','Minggu'),
tanggal DATE,
id_bus INT,
FOREIGN KEY (id_bus) REFERENCES BUS(id_bus)
);
-- Membuat tabel Kelas
CREATE TABLE KELAS (
    id_kelas INT AUTO_INCREMENT PRIMARY KEY,
    jenis_kelas ENUM ('Executive', 'NonExecutive'),
    harga DECIMAL(10,2)
);
-- Membuat tabel Fasilitas
CREATE TABLE FASILITAS (
id_fasilitas INT AUTO_INCREMENT PRIMARY KEY,
nama_fasilitas VARCHAR(100),
id_kelas INT,
FOREIGN KEY (id_kelas) REFERENCES KELAS(id_kelas)
);

-- MENGISI DATA PADA TABEL--
-- Data CUSTOMER
INSERT INTO CUSTOMER (nama, no_tlp, alamat) VALUES
('Ahmad Ramadhan', '081234567890', 'Mataram'),
('Siti Nurhaliza', '082134567891', 'Lombok Tengah'),
('Budi Santoso', '083134567892', 'Lombok Barat'),
('Dewi Lestari', '084134567893', 'Mataram'),
('Rizki Ananda', '085134567894', 'Praya');
-- Data AGEN
INSERT INTO AGEN (nik, nama_agen, alamat, no_tlp, jenis_kelamin) VALUES
('6201012345678901', 'Agus Subagyo', 'Mataram', '0811111111', 'Laki-laki'),
('6201012345678902', 'Rina Kartika', 'Lombok Barat', '0822222222', 'Perempuan'),
('6201012345678903', 'Joko Purnomo', 'Lombok Timur', '0833333333', 'Laki-laki'),
('6201012345678904', 'Maya Sari', 'Lombok Tengah', '0844444444', 'Perempuan'),
('6201012345678905', 'Hendra Kurniawan', 'Mataram', '0855555555', 'Laki-laki');
-- Data BUS
INSERT INTO BUS (nama_bus, no_plat, tujuan, warna_bus, nik_agen) VALUES
('Lombok Express', 'DR 1234 AB', 'Mataram - Sumbawa', 'Merah', '6201012345678901'),
('NTB Jaya', 'DR 5678 CD', 'Mataram - Dompu', 'Biru', '6201012345678902'),
('Sasambo Trans', 'DR 9101 EF', 'Mataram - Bima', 'Hijau', '6201012345678903'),
('Mandala Bus', 'DR 1122 GH', 'Lombok - Bali', 'Putih', '6201012345678904'),
('NTB Ekspres', 'DR 3344 IJ', 'Lombok - Jakarta', 'Kuning', '6201012345678905');
-- Data JADWAL
INSERT INTO JADWAL (jam, hari, tanggal, id_bus) VALUES
('08:00:00', 'Senin', '2024-04-22', 1),
('10:30:00', 'Selasa', '2024-04-23', 2),
('14:00:00', 'Rabu', '2024-04-24', 3),
('09:00:00', 'Kamis', '2024-04-25', 4),
('07:00:00', 'Jumat', '2024-04-26', 5);
-- Data KELAS
INSERT INTO KELAS (jenis_kelas, harga) VALUES
('Executive', 150000),
('Non Executive', 100000),
('Executive', 160000),
('Non Executive', 90000),
('Executive', 155000);
-- Data FASIILITAS
INSERT INTO FASILITAS (nama_fasilitas, id_kelas) VALUES
('AC', 1),
('WiFi', 1),
('Bantal & Selimut', 2),
('TV', 3),
('Snack & Air Mineral', 5);

-- Mengakses/Melihat isi data pada setiap TABEL
SELECT * FROM CUSTOMER;
SELECT * FROM AGEN;
SELECT * FROM JADWAL;
SELECT * FROM AGEN;
SELECT * FROM KELAS;
SELECT * FROM FASILITAS;










