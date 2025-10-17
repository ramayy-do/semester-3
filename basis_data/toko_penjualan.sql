-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2025 pada 10.19
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jabatan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `jabatan`) VALUES
('K001', 'Lenny Anggraini', 'Kasir'),
('K002', 'Rama Adhi Saputra', 'Owner'),
('K003', 'Zaskya Maula Azmi', 'Kasir'),
('K004', 'Fajar Nugraha', 'Gudang'),
('K005', 'Rani Kusuma', 'Supervisor'),
('K006', 'Cahya', 'Cleaning Servic');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`) VALUES
('P001', 'Budi Karya', 'Semarang'),
('P002', 'Roni Huakbar', 'Demak'),
('P003', 'IKhsan Permana Bunda', 'Purwodadi'),
('P004', 'Siti Aisyah', 'Yogyakarta'),
('P005', 'Andi Wijaya', 'Medan'),
('P006', 'Dewi Lestari', 'Bogor'),
('P007', 'Rizky Hidayat', 'Semarang'),
('P008', 'Lina Anggraini', 'Bali');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(4) NOT NULL,
  `nama_produk` varchar(30) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `stok` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `stok`) VALUES
('B001', 'Laptop Lenovo ThinkPad', 8500000, 10),
('B002', 'Mouse Logitech', 150000, 8),
('B003', 'Keyboard Mechanichal', 450000, 20),
('B004', 'Headset Rexus', 250000, 20),
('B005', 'Monitor Samsung 24\"', 1750000, 8),
('B006', 'Flashdisk 32GB', 75000, 50),
('B007', 'Printer Canon Pixma', 1200000, 5),
('B008', 'Webcam Logitech C270', 350000, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `selling`
--

CREATE TABLE `selling` (
  `id_selling` varchar(4) NOT NULL,
  `id_pelanggan` varchar(4) DEFAULT NULL,
  `id_produk` varchar(4) DEFAULT NULL,
  `id_karyawan` varchar(4) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL,
  `jumlah_brg` int(6) DEFAULT NULL,
  `total_harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `selling`
--

INSERT INTO `selling` (`id_selling`, `id_pelanggan`, `id_produk`, `id_karyawan`, `tgl_jual`, `jumlah_brg`, `total_harga`) VALUES
('S001', 'P002', 'B002', 'K001', '2025-09-03', 1, 150000),
('S002', 'P003', 'B001', 'K003', '2025-09-15', 1, 8500000),
('S003', 'P001', 'B002', 'K001', '2025-09-03', 1, 150000),
('S004', 'P003', 'B004', 'K003', '2025-10-05', 2, 250000),
('S005', 'P003', 'B003', 'K003', '2025-10-05', 1, 450000),
('S006', 'P005', 'B005', 'K004', '2025-09-29', 1, 1750000),
('S007', 'P006', 'B006', 'K001', '2025-09-22', 2, 150000),
('S008', 'P007', 'B007', 'K002', '2025-09-10', 1, 1200000),
('S009', 'P008', 'B008', 'K001', '2025-10-01', 1, 350000),
('S010', 'P002', 'B004', 'K005', '2025-10-10', 3, 750000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `selling`
--
ALTER TABLE `selling`
  ADD PRIMARY KEY (`id_selling`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `selling`
--
ALTER TABLE `selling`
  ADD CONSTRAINT `selling_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `selling_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `selling_ibfk_3` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
