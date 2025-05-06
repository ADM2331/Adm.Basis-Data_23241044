-- Modul    : 3 Nilai Literal, Operator, Fungsi, Date, dan Klausal WHERE
-- Nama     : LALU SADAM FADLAN HASAN
-- NIM      : 23241044
-- Kelas    : PTI IV/B 

-- Menggunakan Database
USE pti_mart;

-- PRAKTEK 1
-- Menggunakan statemen SELECT untuk menampilkan nilai literal, berikut ini perintahnya :
SELECT 77;
SELECT 77 AS angka;

-- PRAKTEK 2
-- Menggunakan `SELECT` Statement untuk menampilkan beberapa nilai literal dengan tipe data yang berbeda.
SELECT 77 AS angka, true AS nilai_logika, 'PTI' AS teks;

-- PRAKTEK 3
-- Menggunakan `SELECT` statemen untuk menampilkan `NULL`
SELECT NULL AS kosong;

-- PRAKTEk 4
-- Menggunakan SELECT Statement untuk melakukan kalkulasi dengan ekspresi matematika.
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- Latihan Mandiri 1 
-- Hitung 4*2 (4 di kali 2)
SELECT 4*2 AS perkalian;
-- Hitung (4*8)%7
SELECT (4*8) % 7;
-- Hitung (4*8)MOD 7
SELECT (4*8)%7;

-- PRAKTEK 5 
-- Menggunakan `SELECT` Statement untuk melakukan kalkulasi *field* *table* dengan ekspresi matematika
SELECT qty*harga AS total_beli FROM tr_penjualan;

-- PRAKTEK 6
-- Menggunakan SELECT Statement untuk melakukan operasi perbandingan.
SELECT 5=5, 5<>5, 5<>4, 5!=5, 5!=4, 5>4;

-- Latihan Mandiri 2
-- Lakukan perbandingan 1 = true
SELECT 1=1;
-- Lakukan Perbandingan 1 = False
SELECT 1=2;
-- Lakukan Perbandingan 5>=5
SELECT 5>=5;
-- lakukan perbandingan 5.2 = 5.20000
SELECT 5.2 = 5.20000;
-- lakukan perbandingan NULL = 1
SELECT NULL = 1;
-- lakukan perbandingan NULL = NULL
SELECT NULL = NULL;

-- PRAKTEK 7
-- Melakukan operasi perbandingan pada field qty table tr_penjualan
SELECT nama_produk, qty>3 FROM tr_penjualan;

-- PRAKTEK 8 
-- Mencoba Menggunakan beragam fungsi dalam satu statemen SELECT
SELECT POW(3,2), ROUND(3.14),ROUND(3.54),ROUND (3.155,1), ROUND(3.155,2), FLOOR(4.28), FLOOR(4.78), CEILING(4.39), CEILING(4.55);

-- PRAKTEK 9
-- Mencoba menggunakan beragam fungsi DATE dalam satu statemen SELECT
SELECT NOW(), YEAR('2022-05-03'), DATEDIFF('2022-07-22', '2022-05-03'), DAY('2022-05-03');

-- Latihan Mandiri 3
-- Hitung selisih tanggal '2022-07-23' dengan tanggal saat ini
SELECT DATEDIFF('2022-7-23', '2025-05-06');
-- Ekstrak elemen tahun dari tanggal ini '2022-07-23'
SELECT YEAR('2022-07-23');
-- Ekstrak eleman bulan dari tanggal ini '2022-07-23'
SELECT MONTH('2022-07-23');
-- Ekstrak elemen hari dari date ini '2022-07-23'
SELECT DAY('2022-07-23');
-- Ekstrak elemen tahun dari tanggal saat ini
SELECT YEAR('2025-05-06');

-- PRAKTEK 10
-- Berapa selisih hari antara semua tanggal transaksi pada tabel tr_penjualan dengan tanggal hari ini.
SELECT DATEDIFF (NOW(), tgl_transaksi) AS jarak_transaksi FROM tr_penjualan;

-- PRAKTEK 11
-- Mengambil data nama_produk, dan qty dari tabel penjualan yang qty lebih dari 3
SELECT nama_produk, qty 
FROM tr_penjualan WHERE qty>3;

-- PRAKTEK 12
-- Mengambil dari nama produk dan qty yang terjual dari tabel penjuapenjualan yang qty lebih dari 3 dan transaksinya terjadi pada bulan Juni
SELECT nama_produk,qty, tgl_transaksi FROM tr_penjualan WHERE qty>3 AND month(tgl_transaksi)=6;

-- PRAKTEK 13
-- Mengambil nama produk, qty, dan tanggal transaksi untuk produk dengan nama 'Flaskdisk 32 GB' dari tabel penjualan
SELECT nama_produk,qty, tgl_transaksi
FROM tr_penjualan
WHERE nama_produk = 'Flashdisk DQLab 32 GB';

-- PRAKTEK 14
-- Mengambil nama produk dari tabel penjualan yang nama produknya memiliki huruf 'f' sebagai awal kata
SELECT nama_produk FROM tr_penjualan WHERE nama_produk LIKE 'f%';
SELECT nama_produk FROM tr_penjualan WHERE nama_produk LIKE 'b%';

-- Latihan Mandiri 4
-- Ambil nama_produk yang memiliki karakter kedua ‘a’ pada table tr_penjualan
SELECT nama_produk FROM tr_penjualan WHERE nama_produk LIKE '_a%';
-- Ambil kategori_produk yang mengandung huruf ‘t’ pada table ms_produk
SELECT kategori_produk FROM ms_produk WHERE kategori_produk LIKE '%t%';
-- Ambil kategori_produk yang mengandung karakter ‘un’ pada table ms_produk
SELECT kategori_produk FROM ms_produk WHERE kategori_produk LIKE 'u%'; -- coba Mencari un
SELECT * FROM ms_produk; -- coba Mencari un
SELECT kategori_produk FROM ms_produk WHERE kategori_produk LIKE 'un_'; -- tidak menemukan karakter un

-- PRAKTEK 15
-- Mengambil nama produk dari table tr_penjualan yang memiliki pola teks berawalan huruf F dan qty penjualan di atas 2
SELECT nama_produk
FROM tr_penjualan
WHERE nama_produk LIKE 'f%' AND qty>2;


