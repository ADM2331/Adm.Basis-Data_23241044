-- Nama		: LALU SADAM FADLAN HASAN
-- Nim		: 23241044
-- Kelas	: B
-- Modul	: 2 (select)


-- Membuat database
CREATE DATABASE pti_mart;

-- menggunakan  database
USE pti_mart;

-- cek kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT 
-- Menggunakan SELECT untuk 1 tabel
-- mengambil kolom nama produk dari tabel produk (perintahnya seperti "ambilkan mnama produk dari tabel produk")
SELECT nama_produk FROM ms_produk;

-- Mengambil lebih dari datu kolom dari sebuah tabel
SELECT nama_produk,harga FROM ms_produk;

-- Mengambil semua kolom dari sebuah tabel
SELECT  * FROM ms_produk;

-- LATIHAN
-- 1. Mengambil kode_produk dan nama_produk dari tabel_produk
SELECT kode_produk,nama_produk FROM ms_produk;
-- 2. Mengambil seluruuh kollom dari tabel penjualan
SELECT * FROM tr_penjualan;


-- PREFIX dan ALAIAS

-- PREFIX, adalah bagian dari database yang hirarkinya lebih tinggi. (pti_mart.ms_produk.nama_produk)
-- menggunakan PREFIX nama tabel untuk kolom nama_produk dari tabel produk
SELECT ms_produk.nama_produk FROM ms_produk;

-- menggunakan nama database dan nama tabel sebagai prefix untuk kolom nama_produk
SELECT pti_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS,  adalah nama sementara pengganti nama objek
-- mengganti sementara kolom nama produk dengan alias
SELECT nama_produk AS np FROM ms_produk; -- dengan AS
SELECT nama_produk np FROM ms_produk;    -- tidak dengan AS

-- Mengganti semntara tabel dengan ALIAS
SELECT nama_produk FROM ms_produk AS msp;

-- kombinasikan PREFIX dan ALIAS 
SELECT msp.nama_produk FROM ms_produk AS msp;
-- CASE 1:
SELECT nama_pelanggan, alamat FROM ms_pelanggan;
-- CASE 2:
SELECT nama_produk, harga FROM ms_produk;
 









