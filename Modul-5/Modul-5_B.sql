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
-- ambil kode pelanggan, nama pelanggan, nama produk, qty dari hasil join tabel penjualan dan tabel pelanggan
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk,tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;


-- LATIHAN MANDIRI
-- 1. Buatlah join untuk ketiga tabel yang terdapat pada dqlabmartbasic dengan INNER JOIN.
SELECT tp.kode_pelanggan, mp.nama_pelanggan, msp.nama_produk
FROM tr_penjualan AS tp, ms_produk AS msp
JOIN ms_pelanggan AS mp
ON TRUE;

-- 2. Buatlah join untuk ketiga tabel dengan urutan ms_pelanggan, tr_penjualan dan ms_produk yang tedapat pada dqlabmartbasic dengan LEFT JOIN,
-- kemudian filter untuk qty yang tidak bernilai NULL dengan oprator IS NOT NULL
SELECT mp.nama_pelanggan, tp.nama_produk, msp.kategori_produk
FROM ms_pelanggan AS mp
LEFT JOIN tr_penjualan AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk AS msp ON tp.kode_produk = msp.kode_produk
WHERE tp.qty IS NOT NULL;

-- 3.Join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk dengan INNER JOIN
SELECT mp.nama_pelanggan, tp.nama_produk, msp.kategori_produk, SUM(tp.qty) AS total_qty
FROM ms_pelanggan AS mp
INNER JOIN tr_penjualan AS tp ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk AS msp ON tp.kode_produk = msp.kode_produk
WHERE tp.qty IS NOT NULL
GROUP BY msp.kategori_produk;

-- 4. join ms_produk dengan table ms_produk dengan colom relationship kode_produk
SELECT mpa.kode_produk, mpb.nama_produk
FROM ms_produk AS mpa
JOIN ms_produk AS mpb ON mpa.kode_produk = mpb.kode_produk;




