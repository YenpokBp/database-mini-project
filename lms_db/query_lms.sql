
CREATE DATABASE IF NOT EXISTS `lms_db`;
USE `lms_db`;

-- 1. Tabel course_category 
CREATE TABLE `course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2. Tabel users (Parent table untuk relasi instruktur/pemilik course)
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 3. Tabel course (Child table yang punya Foreign Key ke users dan course_category)
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_course` varchar(150) NOT NULL,
  `waktu_mengajar` int(11) NOT NULL,
  `kuota` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- data dummy untuk tabel `course_category`
INSERT INTO `course_category` (`id`, `nama_category`) VALUES
(1, 'Programming'),
(2, 'Web Development'),
(3, 'Data Science'),
(4, 'Artificial Intelligence'),
(5, 'Database'),
(6, 'Cyber Security'),
(7, 'Mobile Development'),
(8, 'UI/UX Design'),
(9, 'Cloud Computing'),
(10, 'DevOps'),
(11, 'Software Engineering'),
(12, 'Computer Networks'),
(13, 'Game Development'),
(14, 'Digital Marketing'),
(15, 'Information Systems');

--data dummy untuk tabel `users`
INSERT INTO `users` (`id`, `nama`, `email`) VALUES
(1, 'Andi Pratama', 'andi.pratama@gmail.com'),
(2, 'Budi Santoso', 'budi.santoso@gmail.com'),
(3, 'Citra Lestari', 'citra.lestari@gmail.com'),
(4, 'Dimas Saputra', 'dimas.saputra@gmail.com'),
(5, 'Eka Putri', 'eka.putri@gmail.com'),
(6, 'Fajar Ramadhan', 'fajar.ramadhan@gmail.com'),
(7, 'Gita Maharani', 'gita.maharani@gmail.com'),
(8, 'Hendra Wijaya', 'hendra.wijaya@gmail.com'),
(9, 'Intan Permata', 'intan.permata@gmail.com'),
(10, 'Joko Susanto', 'joko.susanto@gmail.com'),
(11, 'Karin Amelia', 'karin.amelia@gmail.com'),
(12, 'Lukman Hakim', 'lukman.hakim@gmail.com'),
(13, 'Maya Sari', 'maya.sari@gmail.com'),
(14, 'Nanda Firmansyah', 'nanda.firmansyah@gmail.com'),
(15, 'Olivia Ananda', 'olivia.ananda@gmail.com'),
(16, 'Raka Pangestu', 'raka.pangestu@gmail.com'),
(17, 'Siti Rahma', 'siti.rahma@gmail.com');

--data dummy untuk tabel `course`
INSERT INTO `course` (`id`, `nama_course`, `waktu_mengajar`, `kuota`, `harga`, `category_id`, `user_id`) VALUES
(1, 'Dasar Pemrograman Python', 24, 30, 150000.00, 1, 1),
(2, 'JavaScript untuk Pemula', 20, 25, 175000.00, 1, 2),
(3, 'Membangun Website dengan HTML CSS', 18, 20, 125000.00, 2, 3),
(4, 'React JS Modern', 30, 25, 350000.00, 2, 4),
(5, 'Data Analysis dengan Python', 32, 20, 450000.00, 3, 5),
(6, 'Machine Learning Dasar', 40, 15, 750000.00, 4, 6),
(7, 'SQL dan Database MySQL', 25, 30, 200000.00, 5, 7),
(8, 'Cyber Security Fundamental', 35, 20, 850000.00, 6, 8),
(9, 'Android Development dengan Kotlin', 40, 15, 650000.00, 7, 9),
(10, 'UI UX Design untuk Pemula', 20, 25, 180000.00, 8, 10),
(11, 'Cloud Computing Fundamental', 30, 20, 550000.00, 9, 11),
(12, 'DevOps dengan Docker', 35, 15, 900000.00, 10, 12),
(13, 'Software Engineering Dasar', 22, 30, 300000.00, 11, 13),
(14, 'Computer Network Fundamental', 28, 20, 275000.00, 12, 14),
(15, 'Game Development dengan Unity', 45, 0, 1250000.00, 13, 15),
(16, 'C++ Object Oriented Programming', 30, 25, 250000.00, 1, 1),
(17, 'Java Programming Fundamental', 35, 20, 400000.00, 1, 2),
(18, 'Pemrograman Go untuk Pemula', 28, 20, 500000.00, 1, 3),
(19, 'Full Stack Web Development', 45, 15, 950000.00, 2, 4),
(20, 'Backend Development dengan Node.js', 35, 20, 600000.00, 2, 5),
(21, 'Frontend Development dengan Vue.js', 30, 25, 325000.00, 2, 6),
(22, 'Golang Advanced Backend', 35, 20, 750000.00, 1, 16),
(23, 'Microservices Architecture', 40, 15, 1100000.00, 10, 16);

-- =========================================
-- SQL Fundamentals
-- =========================================

-- 1. Tampilkan seluruh data course
SELECT *
FROM course;
-- 2. Tampilkan nama course dan harga
SELECT nama_course, harga
FROM course;
-- 3. Tampilkan course dengan harga 50.000 - 200.000
SELECT *
FROM course
WHERE harga BETWEEN 50000 AND 200000;
-- 4. Tampilkan course dengan kuota 0 ATAU harga di atas 500.000
SELECT *
FROM course
WHERE kuota = 0
   OR harga > 500000;
-- 5. Tampilkan 5 course dengan harga tertinggi
SELECT *
FROM course
ORDER BY harga DESC
LIMIT 5;

-- =========================================
-- Aggregate & Conditional Logic
-- =========================================

-- 1. Hitung total user yang terdaftar.
SELECT COUNT(*) AS user_terdaftar FROM `users`;
--
SELECT COUNT(*) AS course_tersedia FROM `course`;
-- 3. Jumlah course per kategori
SELECT category_id, COUNT(*) AS jumlah_course
FROM course
GROUP BY category_id;
-- 4. Rata-rata harga course per kategori
SELECT category_id, AVG(harga) AS rata_rata_harga
FROM course
GROUP BY category_id;
-- 5. kategori yang memiliki lebih dari 3 course.
SELECT
    category_id,
    COUNT(*) AS jumlah_course
FROM
    course
GROUP BY
    category_id
HAVING COUNT(*) > 3

-- =========================================
-- Join Statements
-- =========================================

-- 1.  daftar course beserta nama kategorinya.
SELECT
    c.nama_course,
    nama_category
FROM
    course c
JOIN course_category cc ON
    c.category_id = cc.id
-- 2. semua kategori meskipun belum memiliki course.
SELECT
    cc.nama_category,
    c.nama_course
FROM course_category cc
LEFT JOIN course c
    ON cc.id = c.category_id;
-- 3. semua user meskipun belum pernah mengupload course.
SELECT
    u.nama,
    c.nama_course
FROM users u
LEFT JOIN course c
    ON u.id = c.user_id;
-- 4. aftar course beserta nama instructor yang membuat course tersebut.
SELECT
    c.nama_course,
    u.nama AS nama_instructor
FROM course c
INNER JOIN users u
    ON c.user_id = u.id;
-- 5. jumlah course yang dibuat oleh masing-masing instructor.
SELECT
    COUNT(c.id) AS jumlah_course,
    u.nama AS nama_instructor
FROM
    course c
LEFT JOIN users u ON
    c.user_id = u.id
GROUP BY
    u.nama

-- =========================================
-- OPTIMIZATION
-- =========================================

-- 1. Melihat execution plan sebelum menambahkan index
-- Query ini digunakan untuk mencari course berdasarkan harga.
EXPLAIN
SELECT
    nama_course,
    harga
FROM course
WHERE harga > 500000;


-- 2. Membuat index pada kolom harga
-- Index ini membantu query yang sering melakukan filtering
-- menggunakan WHERE, BETWEEN, atau operator perbandingan.
CREATE INDEX idx_course_harga
ON course(harga);


-- 3. Mengecek index yang sudah dimiliki tabel course
SHOW INDEXES FROM course;


-- 4. Mengecek execution plan setelah menambahkan index
EXPLAIN
SELECT
    nama_course,
    harga
FROM course
WHERE harga > 500000;


-- 5. Analisis query dengan filter harga dan kategori
EXPLAIN
SELECT
    nama_course,
    harga,
    category_id
FROM course
WHERE harga BETWEEN 200000 AND 500000
  AND category_id = 1;


-- 6. Composite index untuk query dengan filter harga dan kategori
CREATE INDEX idx_course_harga_category
ON course(harga, category_id);


-- 7. Cek kembali execution plan setelah composite index
EXPLAIN
SELECT
    nama_course,
    harga,
    category_id
FROM course
WHERE harga BETWEEN 200000 AND 500000
  AND category_id = 1;


-- 8. EXPLAIN untuk query JOIN
-- user_id sudah memiliki index karena merupakan Foreign Key.
EXPLAIN
SELECT
    c.nama_course,
    u.nama AS nama_instructor
FROM course c
INNER JOIN users u
    ON c.user_id = u.id;


-- 9. EXPLAIN untuk query aggregate
-- category_id juga sudah memiliki index karena merupakan Foreign Key.
EXPLAIN
SELECT
    category_id,
    COUNT(*) AS jumlah_course,
    AVG(harga) AS rata_rata_harga
FROM course
GROUP BY category_id;


-- =========================================
-- INTERPRETASI OPTIMIZATION
-- =========================================

/*
1. PRIMARY KEY
   - id pada setiap tabel otomatis memiliki index.
   - Primary Key digunakan untuk identifikasi data secara unik.

2. FOREIGN KEY
   - user_id dan category_id pada tabel course sudah memiliki index.
   - Index tersebut membantu proses JOIN dengan tabel users
     dan course_category.

3. INDEX HARGA
   - idx_course_harga digunakan untuk mempercepat pencarian
     berdasarkan harga.
   - Contoh penggunaan:
       WHERE harga > 500000
       WHERE harga BETWEEN 200000 AND 500000

4. COMPOSITE INDEX
   - idx_course_harga_category digunakan ketika query melakukan
     filtering berdasarkan harga dan category_id secara bersamaan.
   - Urutan kolom pada composite index berpengaruh terhadap
     penggunaan index oleh MySQL.

5. EXPLAIN
   - EXPLAIN digunakan untuk melihat execution plan dari query.
   - key menunjukkan index yang digunakan.
   - type menunjukkan metode akses data.
   - rows menunjukkan perkiraan jumlah row yang diperiksa.
   - Extra memberikan informasi tambahan mengenai proses query.

6. CATATAN
   - Karena tabel course saat ini hanya memiliki sedikit data,
     MySQL masih dapat memilih FULL TABLE SCAN karena bisa lebih
     efisien daripada menggunakan index.
   - Manfaat index akan lebih terasa ketika jumlah data semakin besar.

7. TRADE-OFF INDEX
   - Index dapat mempercepat SELECT dan pencarian data.
   - Namun index membutuhkan storage tambahan dan dapat menambah
     beban pada INSERT, UPDATE, dan DELETE.
*/
```
