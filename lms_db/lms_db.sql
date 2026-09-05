-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Sep 2026 pada 10.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `nama_course` varchar(150) NOT NULL,
  `waktu_mengajar` int(11) NOT NULL,
  `kuota` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `course`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `course_category`
--

CREATE TABLE `course_category` (
  `id` int(11) NOT NULL,
  `nama_category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `course_category`
--

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

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

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `course_category`
--
ALTER TABLE `course_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
