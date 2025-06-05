-- NAMA`	:LALU SADAM FADLAN HASAN
-- NIM		:23241044
-- KELAS 	:IV/B
-- Modul 	:ORDER BY, FUNGSI AGREGASI, GROUP BY, HAVING

-- ORDER BY (untuk menyususn urutan data sesuai nilai fild atau nilai pengelolaan bebrap fild(kolom))

-- menggunakan Database
USE pti_mart;

-- ORDER BY
-- ambil nama proiduk dan qty dari tabel penjualan dan urutkan qty
SELECT nama_produk,qty FROM tr_penjualan ORDER BY qty;

-- ambil nama produk dan qty dari tb penjualan lalu urutkan qty dan nama produk
SELECT nama_produk,qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- Latihan mandiri 
-- tampilkan semua kolom dari tr penjualan dengan mengurutkan berdasarkan qty dan tanggal transaksi
SELECT * FROM tr_penjualan ORDER BY qty,tgl_transaksi;

-- tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- tampilkan semua koloom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat
SELECT * FROM ms_pelanggan ORDER BY alamat;


-- ORDER BY ASC dan DESC 
-- ambil nama_produk dan qty dari tb penjualan lalu urutkan qty dari besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- ambil nama produk dan qty dari tb penjualan urutkan qty dan nama produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk DESC;
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- Latihan mandiri
-- tampilkan semua kolom dari tabel tr_penjualan  dengan mengurutkan berdasarkan tgl transaksi seccara descending dan qty secara ascending.
SELECT * FROM tr_penjualan ORDER BY qty,tgl_transaksi DESC;

-- tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan secara descending
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;

--  tampilkan semua koloom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat secara descending
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;


-- ORDER BY dari hasil perhitungan 
-- Ambil nama produk, qty, harga, harga*qty dari tb penjualan urutkan harga* qty dengan DESC(besar- kecil)
SELECT nama_produk,harga,qty, harga * qty AS total FROM tr_penjualan ORDER BY total DESC;


-- Latihan Mandiri 
-- cobalah pengurutan dengan ekspresi total_harga menggunakan rumusan jumlah_barang dikali harga barang di kurangi diskon
SELECT nama_produk,qty, harga,diskon_persen (harga* qty-diskon_persen) AS total FROM tr_penjualan ORDER BY total_harga DESC;

-- punya pak adam
SELECT nama_produk,harga,qty,diskon_persen, qty * harga AS total_harga, ((qty*harga) - (diskon_persen/100) * harga) AS total_bayar 
FROM tr_penjualan 
ORDER BY diskon_persen DESC, total_bayar DESC;

-- menggunakan WHERE
SELECT nama_produk,harga,qty,diskon_persen, qty * harga AS total_harga, ((qty*harga) - (diskon_persen/100) * harga) AS total_bayar 
FROM tr_penjualan 
WHERE diskon_persen > 0
ORDER BY diskon_persen DESC, total_bayar DESC;

-- ORDER BY MENGGUNAKAN WHERE
-- Ambil nama produk, qty dari tabel_penjualan yang nama produk berawalan huruf 'f' urutkan qty
Select nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'f%'
ORDER BY qty DESC;

-- Latihan Mandiri
-- tampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan urutkan berdasarkan harga tetinggi.
SELECT * FROM tr_penjualan
WHERE diskon_persen 
ORDER BY harga DESC;

-- tampilkan kolom nama produk, kuantitas pembelian dan harga dari teransaksi penjualan yang memiliki harga minimal-
-- seratus ribu rupiah dan di urutkan berdasarkan harga trtinggi
SELECT * FROM tr_penjualan;

SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- tampilkan kolom nama produk, kuantitas pembelian dan harga dari tr penjualan yang memiliki harga minimal-
-- seratus ribu rupiah atau nama produk berdasarkan karakter "T" dan urutkan berdasarkan diskon tertinggi
SELECT nama_produk, qty, harga, diskon_persen
FROM tr_penjualan
WHERE harga >= 100000
OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;


 