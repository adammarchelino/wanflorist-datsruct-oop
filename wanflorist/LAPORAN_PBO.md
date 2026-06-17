# LAPORAN SISTEM MANAJEMEN OPERASIONAL UMKM WANFLORIST

**Nama:** Adam Marchelino  
**NIM:** 362558302044  
**Kelas:** TRPL 1C

## Checklist KAD

| KAD | Konsep | Status Implementasi |
| --- | ------ | ------------------- |
| 1 | Minimal 3 class + konstruktor | ✅ Sudah |
| 2 | Minimal 3 class + konstruktor | ✅ Sudah |
| 3 | Encapsulation | ✅ Sudah |
| 4 | Inheritance | ✅ Ditambahkan |
| 5 | Polymorphism | ✅ Ditambahkan |
| 6 | Abstract Class | ✅ Ditambahkan |
| 7 | Interface | ❌ Tidak digunakan |
| 8 | Enumeration | ✅ Ditambahkan |
| 9 | Mixin | ❌ Tidak digunakan |
| 10 | Generic Class | ✅ Sudah (`Node`, `LinkedList`) |

---

## 1. Pendahuluan

Laporan ini membahas pengembangan sistem manajemen operasional untuk UMKM WanFlorist menggunakan pendekatan Struktur Data dan Object-Oriented Programming (OOP). Sistem ini dirancang sebagai solusi untuk masalah pencatatan transaksi, stok, dan pesanan yang selama ini masih dilakukan secara manual dan tradisional menggunakan buku.

## 2. Latar Belakang Masalah

Pada kondisi nyata di UMKM WanFlorist, semua pencatatan operasional masih dilakukan secara manual:

- Pencatatan stok produk memakai buku catatan.
- Pencatatan pesanan tersusun secara terpisah dan tidak terintegrasi.
- Proses pelacakan status pesanan sulit karena hanya dilakukan secara manual.
- Tidak ada satu sistem tunggal yang menggabungkan manajemen produk, antrian pesanan, dan riwayat kerja.

Masalah ini menyebabkan:

- Resiko human error tinggi.
- Waktu pencarian data menjadi lambat.
- Sulit melakukan pemantauan status pesanan secara real-time.
- Integrasi informasi antara produk dan pesanan tidak konsisten.

## 3. Tujuan Sistem

Tujuan utama pengembangan sistem WanFlorist adalah:

- Mengubah pencatatan manual menjadi sistem terkomputerisasi.
- Mengintegrasikan manajemen produk dan pesanan dalam satu aplikasi.
- Menggunakan konsep Struktur Data untuk pengelolaan antrian dan log.
- Memanfaatkan OOP untuk membuat desain kode yang rapi, terstruktur, dan mudah dikembangkan.

## 4. Solusi yang Diterapkan

Solusi dikembangkan dalam bentuk aplikasi Dart dengan modul berikut:

- `Produk` sebagai entitas katalog barang.
- `Pesanan` sebagai entitas antrian pesanan pelanggan.
- `AntrianPesanan` untuk memproses pesanan menggunakan struktur data antrian.
- `StackLog` untuk mencatat riwayat aktivitas.
- `QueuePesanan` dan `Node` sebagai implementasi struktur data generik.

Dengan penerapan OOP dan struktur data, operasi yang sebelumnya manual menjadi lebih teratur, terintegrasi, dan mudah diikuti.

## 5. Desain dan Implementasi

### 5.1. Abstract Class dan Inheritance

Dibuat abstract class `Entitas` dengan kontrak:

- `String get id;`
- `String info();`

Kemudian `Produk` dan `Pesanan` mewarisi (`extends`) class `Entitas`. Ini memastikan kedua entitas memiliki identitas yang konsisten dan menyediakan method `info()` untuk menampilkan ringkasan objek.

### 5.2. Polymorphism

Polymorphism muncul karena `Produk` dan `Pesanan` mengimplementasikan `info()` dengan cara yang berbeda. Meskipun keduanya menggunakan metode yang sama, isi outputnya spesifik untuk masing-masing kelas.

### 5.3. Enumeration

Status pesanan tidak lagi disimpan sebagai `String` biasa. Sistem menggunakan enum `StatusPesanan` dengan nilai:

- `StatusPesanan.antri`
- `StatusPesanan.selesai`

Penggunaan enum membuat validasi status menjadi lebih aman dan mengurangi kesalahan penulisan.

### 5.4. Struktur Data

Sistem memanfaatkan struktur data generik untuk antrian pesanan:

- `Node<T>` sebagai simpul data generik.
- `LinkedList` sebagai dasar struktur data dinamis.
- `QueuePesanan` untuk manajemen antrian FIFO (First In First Out).
- `StackLog` untuk riwayat aktivitas dengan pola LIFO.

### 5.5. Integrasi Modul

Modul-modul utama diintegrasikan melalui aplikasi utama di `bin/main.dart`, sehingga pengguna dapat:

- Mengelola katalog produk.
- Menambahkan dan memproses pesanan.
- Melihat log aktivitas.

## 6. Hasil dan Manfaat

### 6.1. Hasil Pengembangan

Setelah perubahan, aplikasi WanFlorist berhasil:

- Menyimpan data produk dan pesanan secara terstruktur.
- Menggunakan status pesanan berbasis enum.
- Mengelola antrian pesanan secara otomatis.
- Menangani pencatatan riwayat aktivitas dengan stack.

### 6.2. Manfaat bagi UMKM

Manfaat yang diperoleh dari aplikasi ini antara lain:

- Mempercepat proses pencatatan dan pemrosesan pesanan.
- Mengurangi kesalahan manual dalam pencatatan.
- Menyediakan integrasi informasi antara produk dan pesanan.
- Menjadikan operasional lebih terstruktur dan dapat ditinjau kembali.

## 7. Kesimpulan

Penerapan Struktur Data dan OOP pada sistem manajemen operasional WanFlorist memberikan solusi yang tepat untuk masalah pencatatan manual dan tradisional. Dengan konsep entitas, inheritance, polymorphism, dan enumeration, aplikasi ini semakin layak untuk mendukung UMKM dalam manajemen produk dan pesanan.

Sistem ini menunjukkan bahwa penggunaan struktur data dan desain berorientasi objek dapat meningkatkan kualitas dan keandalan proses operasional untuk bisnis kecil.

## 8. Rekomendasi

Untuk pengembangan selanjutnya, saya terfikirkan untuk:

- Mengimplementasikan antarmuka grafis untuk kemudahan penggunaan.
- Menambahkan fitur laporan penjualan dan analisis stok.
- Memperluas penggunaan konsep OOP seperti `interface` dan `mixin` bila diperlukan.
