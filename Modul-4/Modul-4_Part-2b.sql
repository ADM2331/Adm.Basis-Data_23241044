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
-- ambil nama_produk danqty dari tb penjualan lalu urutkan qty dari besar ke kecil
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

-- SELASA, 03 JUNI 2025
-- FUNGSI AGREGASI
-- di gunakan untuk mengolah beberapa baris/ raw data untuk menghasilkan nilai baru

-- praktek 7
-- Hitung atau jumlahkan seluruh nilai dari baris qty pada tabel penjualan
SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan;

-- Praktek 8
-- Hitung seluruh baris pada tabel penjualan
SELECT * FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- Praktek 9
-- Menggunakan 2 fungsi agregasi dalam satu query SQL
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- Praktek 10
-- Hitung rata rata penjualan, penjualan tertinggi per transaksi, dan penjualan ter rendah per transaksi
SELECT AVG(qty), MAX(qty), MIN(qty)
FROM tr_penjualan;

-- Praktek 11
-- Mengkombinasikan fungsi agregasi dengan kolom terttentu  (nama produk, kolom tanggal_transaksi)
SELECT tgl_transaksi, nama_produk, MAX(qty) FROM tr_penjualan;

-- COUNT(DISTINCE)
-- di gunakan untuk menghitug nilai yan unik saja
-- menghitung nilai unik yang ada pada nama produk di tabel penjualan

-- Praktek 12
-- tanapa distinct
SELECT COUNT(nama_produk) FROM tr_penjualan;
-- dengan distinct
SELECT COUNT(distinct nama_produk) FROM tr_penjualan;

-- UNTUK MELIHAT KEDUANYA
SELECT COUNT(nama_produk), COUNT(distinct nama_produk) FROM tr_penjualan;

-- GROUP BY
-- mengelompokkan isi data atau beberapa kolom, biasaanya di gabung dengan fungsi agregasi

-- GROUP BY dengan 1 kolom
-- praktek 14
-- mengelompokkan nilai nama produk pada tabel penjualan.alter
SELECT nama_produk FROM tr_penjualan GROUP BY nama_produk;
SELECT nama_produk FROM tr_penjualan;

-- Praktek 15
-- mengelompokkan nilai nama produk dan qty pada tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan GROUP By nama_produk,qty;
SELECT nama_produk, qty FROM tr_penjualan;

-- Praktek 16
-- ambil qty dari nama produk berdasarkan hasil pengelompokkan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk;

-- Praktek 17
-- ambil qty dari nama produk berdasarkan hasil pengelompokkan nama produk urut dari besar ke kecil
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk ORDER BY SUM(qty) DESC;


-- HAVING
-- Di gunakan sebagai filtering untuk GROUP BY dan fungsi agregasi

-- Praktek 18
-- ambil jumlah qty dari nama produk yang jumlah qty > dari 2 berdasarkan hasil pengelompokkan nama produk
SELECT nama_produk,SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 2
ORDER BY SUM(qty) DESC;

-- LATIHAN MANDIRI

-- Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk adalah di ataas nilai 4
SELECT * FROM tr_penjualan;

SELECT nama_produk,SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 4;


-- Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9
SELECT nama_produk,SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) = 9;

-- Melihat daftar kelompok nama produk dan total nilai penjualan (Harga di kalikan jumlah di kurangi diskon)
-- dengan dan urutkan berdasarkan nilai penjualan terbesar.
SELECT * FROM tr_penjualan;

SELECT nama_produk, SUM((harga*qty) - (diskon_persen/100) * harga) AS total_nilai_penjualan
FROM tr_penjualan
GROUP BY nama_produk
ORDER BY total_nilai_penjualan DESC;









 