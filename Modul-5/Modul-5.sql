-- NAMA`	:LALU SADAM FADLAN HASAN
-- NIM		:23241044
-- KELAS 	:IV/B
-- Modul 	:JOIN, UNION, LIMIT

USE pti_mart;
SELECT * FROM tr_penjualan;
-- JOIN
-- Menggabungkan 2 buah tabel berdasarkan kolom yang sama

-- Praktek 1
-- Ambil nama pelanggan yang pernah bertransaksi
-- artinya mengambil kolom kode_pelanggan, nama_pelanggan, dan qty dari penggabungan tabel penjualan dan tabel pelanggan
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty 
FROM tr_penjualan as tp 
JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Peraktek 2
-- Menggabungkan 2 tabel tanpa memperhatikan relational key 
-- Ambil nama pelanggan yang pernah bertransaksi beserta qty nya 
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa memperhatikan kolom yang menjadi primary key
SELECT mp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE;

-- INNER JOIN
-- join yang mengambil data dari dua sisi tabel yang berhubungan saja

-- praktek 3
-- ambil kode pelanggan, nama pelanggan nama produk, qty dari hasil join tabel penjualan dan tabel pelanggan
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk,tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;