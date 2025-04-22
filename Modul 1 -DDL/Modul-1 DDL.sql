-- Nama : Lalu Sadam Fadlan Hasan
-- Nim	: 23241044
-- Kelas: B

-- Membuat Database
CREATE DATABASE mandalika_mart;

-- menggunakan database 'mandalika_mart
USE mandalika_mart;

-- Membuat Tabel dalam 'mandalika_mart'
CREATE TABLE member (
member_id varchar(10),
username varchar(20),
nama varchar(100),
tanggal_lahir datetime,
angka_favorit int);

-- buat tabel prooduk
CREATE TABLE produk(
id_produk varchar(10),
nama_produk varchar(25),
kategori varchar(15),
harga int,
qty int);

-- membuat tabel transaksi_penjualan

CREATE TABLE transaksi_penjualan(
tgl_jual datetime,
id_produk varchar(10),
member_id varchar(10),
nama_produk varchar(25),
harga int,
qty int);

-- mengupdate primary key tabel member,produk
ALTER TABLE member
ADD PRIMARY KEY (member_id);

ALTER TABLE produk
ADD PRIMARY KEY (id_produk);

-- mengupdate foreign key tabel transaksi_penjualan
ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_memberTransaksi
FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE transaksi_penjualan
ADD CONSTRAINT FK_produkTransaksi
FOREIGN KEY (id_produk) REFERENCES produk(id_produk);

-- Mengisi data pada tabel
INSERT INTO member(member_id, username, nama, tanggal_lahir, angka_favorit)
VALUES ('ID-01', 'wbmaster', 'Admin', '2003-03-23', 15);

-- Mengakss isi data pada tabel member;
SELECT * FROM member;