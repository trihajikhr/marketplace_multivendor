---
obsidianUIMode: preview
---
> Made by Trihaji Khoerur Rohman
# 1 | Sistem Basis Data

## 1.1 | Pengertian Sistem
Sistem adalah sekelompok unsur atau komponen yang saling berhubungan, berinteraksi, dan terorganisasi untuk mencapai tujuan tertentu. Unsur-unsur ini bisa berupa benda nyata (seperti organ tubuh manusia) atau abstrak (seperti teori atau metode). Sistem memiliki struktur dan proses, serta batasan yang membuatnya fokus pada tujuanya.

> Source: [kurtek.upi.id-Konsep dasar sistem](https://kurtek.upi.edu/konsep-sistem/)

- Sebuah tatanan atau keterpaduan yang terdiri atas sejumlah komponen fungsional (dengan satuan fungsi/tugas khusus) yang saling berhubungan dan secara bersama-sama bertujuan untuk memnuhi suatu proses/pekerjaan tertentu.

<br/>

- Kumpulan dari elemen yang saling berhubungan antara satu sama lain dalam suatu lingkungan kompleks untuk mencapai suatu tujuan tertentu.

> Source: Materi kuliah

## 1.2 | Pengertian Sistem Basis Data

Dalam basis data, sistem basis data adalah gabungan dari perangkat keras, perangkat lunak (terutama Sistem Manajemen Basis Data atau DBMS), dan basis data itu sendiri, yang bekerja sama untuk menyimpan, mengelola, dan memanipulasi data agar dapat diakses dan dimanfaatkan oleh pengguna atau program lain. Komponen utamanya meliputi basis data (kumpulan data), DBMS (perangkat lunak pengelola), dan perangkat keras, sistem operasi, dan pengguna (user).

### Komponen utama sistem basis data

1. **Basis Data (Database):** Kumpulan data terstruktur yang saling berhubungan, seperti teks, gambar, dan suara, yang disimpan dalam komputer.

2. **Sistem Manajemen Basis Data (DBMS):** Perangkat lunak yang memungkinkan pengguna untuk membuat, mengontrol, memelihara, dan mengakses basis data secara efisien. Contohnya adalah MySQL dan PostgreSQL.

3. **Perangkat Keras (Hardware):** Komponen fisik seperti server, penyimpanan (hard disk, penyimpanan cloud), dan jaringan yang mendukung sistem basis data.

4. **Sistem Operasi (Operating System):** Sistem perangkat lunak yang mengelola sumber daya perangkat keras (contoh: Windows, macOS, Linux).

5. **Pengguna (User):** Pihak yang menggunakan sistem basis data, bisa berupa pengguna akhir, pemrogram, atau administrator basis data (DBA).

6. **Aplikasi (Opsional):** Program aplikasi yang menggunakan data dari basis data untuk menyediakan informasi kepada pengguna. 

### Fungsi sistem basis data

1. **Pengumpulan data:** Mengumpulkan data dari berbagai sumber.

2. **Pengolahan data:** Melakukan pembersihan, integrasi, dan transformasi data untuk membuatnya berguna.

3. **Analisis data:** Menganalisis data untuk mendapatkan pemahaman dan insight baru.

4. **Pengambilan keputusan:** Membantu organisasi membuat keputusan yang lebih informatif dan efektif berdasarkan data. 

> Source: [Mengenal Sistem Basis Data dan Fungsinya dalam Kehidupan \| Primakara University](https://primakara.ac.id/blog/info-teknologi/sistem-basis-data)

Sistem basis data adalah sistem yang terdiri atas kumpulan file/table yang saling berhubungan (dalam sebuah basis data di sebuah sistem kumputer) dan sekumpulan program (DBMS) yang memungkinkan beberapa pemakai dan/atau program lain untuk mengakses dan memanipulasi file-file (table-table) tersebut.

> Source: Materi kuliah

<br/>

---
# 2 | Data Base Management System (DBMS)

## 2.1 | Apa itu DBMS

DBMS adalah singkatan dari Database Management System atau dalam bahasa Indonesia disebut Sistem Manajemen Basis Data. DBMS adalah perangkat lunak yang memungkinkan pengguna untuk membuat, mengelola, dan memanipulasi data dalam suatu basis data. Dengan menggunakan DBMS, proses pengorganisasian data menjadi lebih mudah, cepat, dan efisien, terutama ketika harus berhadapan dengan data dalam jumlah besar.

DBMS memungkinkan pengguna untuk melakukan berbagai operasi pada data seperti penyimpanan, pengeditan, penghapusan, dan pencarian data. Sistem ini juga berfungsi sebagai penghubung antara database dan pengguna akhir, sehingga data yang disimpan dapat diakses dan dikelola dengan lebih baik.

## 2.2 | Pengertian DBMS

Database Management System (DBMS) adalah perangkat lunak yang digunakan untuk mengatur dan mengelola database secara terstruktur. DBMS memungkinkan pengguna untuk menyimpan data dalam bentuk tabel, yang memungkinkan data tersebut diakses, diubah, atau dihapus dengan mudah.

Secara sederhana, DBMS berfungsi untuk:

1. **Mengelola Data:** Memungkinkan pengguna untuk menyimpan, mengambil, dan mengubah data.
  
2. **Memastikan Integritas Data:** DBMS membantu menjaga konsistensi dan integritas data agar data yang disimpan tetap valid dan tidak korup.
  
3. **Meningkatkan Keamanan:** Dengan adanya kontrol akses, DBMS memastikan bahwa hanya pengguna yang berwenang yang dapat mengakses data tertentu, sehingga meningkatkan keamanan data.

Database management system adalah solusi yang penting bagi perusahaan yang membutuhkan sistem yang mampu mengatur dan mengelola data dengan lebih terstruktur. DBMS memungkinkan pengelolaan data dalam skala besar dan kompleks dengan akses yang lebih terkontrol.

## 2.3 | Jenis DBMS

Ada beberapa jenis DBMS yang populer dan banyak digunakan, masing-masing dengan kelebihan dan kekurangannya sendiri. Berikut ini adalah beberapa jenis DBMS yang sering digunakan:

1. **Hierarchical DBMS:** DBMS ini mengatur data dalam struktur hirarkis atau pohon. Setiap catatan dalam database memiliki hubungan induk-anak (parent-child). DBMS jenis ini cocok untuk data yang terstruktur dengan baik dan memiliki hubungan hierarkis, seperti struktur organisasi.

2. **Network DBMS:** Network DBMS memungkinkan relasi banyak-ke-banyak antara catatan data. Ini lebih fleksibel dibandingkan dengan hierarchical DBMS, karena satu catatan data dapat memiliki beberapa hubungan dengan catatan data lainnya. Namun, penggunaannya lebih kompleks karena relasi data yang lebih rumit.

3. **Relational DBMS (RDBMS):** RDBMS adalah jenis DBMS yang paling populer saat ini. Sistem ini menyimpan data dalam bentuk tabel yang terdiri dari baris dan kolom. Setiap tabel memiliki primary key yang unik, dan tabel-tabel tersebut dapat dihubungkan satu sama lain. RDBMS mendukung bahasa SQL (Structured Query Language), yang memungkinkan pengguna untuk melakukan query pada data dengan mudah. Contoh RDBMS adalah MySQL, PostgreSQL, dan Oracle.

4. **Object-oriented DBMS (OODBMS):** OODBMS menggabungkan prinsip pemrograman berorientasi objek dengan sistem basis data. Data disimpan dalam bentuk objek, yang memungkinkan kemudahan integrasi dengan aplikasi yang berbasis object-oriented. DBMS jenis ini cocok untuk aplikasi yang membutuhkan data dengan struktur yang lebih kompleks.

5. **NoSQL DBMS:** NoSQL adalah jenis DBMS yang didesain untuk mengelola data tidak terstruktur dan semi-terstruktur dalam skala besar. NoSQL sangat cocok digunakan untuk big data dan aplikasi web yang membutuhkan kecepatan tinggi dan skalabilitas. Contoh NoSQL DBMS adalah MongoDB, Cassandra, dan CouchDB.

## 2.4 | Contoh DBMS Paling Populer

Berikut ini adalah beberapa contoh DBMS yang paling sering digunakan dalam berbagai aplikasi, baik di perusahaan maupun skala individu:

1. **MySQL:** MySQL adalah salah satu relational database yang paling populer di dunia. MySQL sering digunakan untuk web hosting dan aplikasi berbasis web. Dengan menggunakan SQL sebagai bahasa untuk mengakses data, MySQL menyediakan kinerja yang cepat dan keamanan yang tinggi untuk mengelola data.

2. **PostgreSQL:** PostgreSQL adalah RDBMS yang dikenal dengan fitur-fitur lanjutan dan kemampuannya dalam mengelola data yang lebih kompleks. PostgreSQL mendukung operasi transaksi yang lebih rumit dan sering digunakan untuk aplikasi bisnis yang membutuhkan keandalan data.

3. **Oracle Database:** Oracle Database adalah DBMS yang sering digunakan oleh perusahaan besar karena keandalannya dalam menangani data dalam skala besar. Oracle menawarkan berbagai fitur seperti backup otomatis, replikasi data, dan integrasi dengan aplikasi bisnis lainnya.

4. **MongoDB:** MongoDB adalah contoh dari NoSQL database yang menyimpan data dalam format JSON. MongoDB sering digunakan untuk aplikasi big data karena memiliki kemampuan skalabilitas horizontal yang baik, sehingga cocok untuk proyek-proyek besar yang membutuhkan manajemen data yang dinamis.
   
5. **Microsoft SQL Server:** SQL Server adalah RDBMS buatan Microsoft yang menawarkan kemudahan integrasi dengan produk-produk Microsoft lainnya, seperti Excel dan Power BI. SQL Server sering digunakan dalam lingkungan perusahaan untuk aplikasi bisnis dan manajemen data.

6. **Cassandra:** Cassandra adalah database NoSQL yang dirancang untuk menangani volume data yang besar di banyak server tanpa adanya titik kegagalan tunggal. Cassandra sering digunakan oleh perusahaan besar seperti Netflix dan Facebook untuk manajemen data real-time.

## 2.5 | Memanfaatkan Teknologi Blockchain untuk Keamanan dan Transparansi Data

Seiring dengan berkembangnya kebutuhan akan keamanan data, teknologi blockchain mulai digunakan bersama DBMS untuk meningkatkan keamanan dan transparansi dalam pengelolaan data. Blockchain menyediakan catatan transaksi yang tidak bisa diubah, sehingga setiap perubahan data yang dilakukan tercatat dengan jelas dan dapat diverifikasi.

DBMS yang mengintegrasikan teknologi blockchain memungkinkan data yang disimpan menjadi lebih transparan dan aman. Dengan menggunakan blockchain, setiap log aktivitas yang terjadi pada data akan tercatat dalam sebuah block yang saling terhubung, sehingga perubahan data menjadi sulit untuk dimanipulasi. Ini membuat teknologi ini sangat berguna untuk pengelolaan data sensitif seperti transaksi keuangan dan data kesehatan.

## 2.6 | Kesimpulan

DBMS adalah solusi yang penting dalam mengelola data secara efisien dan terstruktur. Dengan berbagai jenis DBMS yang ada, seperti RDBMS, NoSQL, dan [OODBMS](https://bit.telkomuniversity.ac.id/), pengguna dapat memilih sistem yang paling sesuai dengan kebutuhan mereka. Database Management System tidak hanya memudahkan dalam mengakses dan mengelola data, tetapi juga membantu dalam memastikan keamanan dan integritas data tersebut.

Penggunaan DBMS yang tepat dapat memberikan banyak manfaat bagi perusahaan maupun individu, terutama dalam hal efisiensi kerja dan penyimpanan data. Di era digital saat ini, memiliki pemahaman tentang DBMS sangatlah penting untuk memaksimalkan penggunaan teknologi dalam kehidupan sehari-hari maupun dalam lingkungan bisnis.

<br/>

---
# 3 | Abstraksi Data

## 3.1 | Pengertian Abstraksi Data

Dalam basis data dikenal istilah abstraksi data. Abstraksi data merupakan tingkatan atau level bagaimana pemangku kepentingan (stakeholders) melihat data dalam sebuah sistem basis data.

Penjelasan lain:

DBMS menyediakan fasilitas/interface yntuk melihat data yang user friendly. Sistem basis data biasanya menyembunyikan detail tentang bagaimana data disimpan dan dipelihara. Oleh karena itu, seringkali data yang terlihat oleh pemakai sebenarnya berbeda dengan yang tersimpan secara fisik. Abstraksi data merupakan level dalam bagaimana melihat data dalam sebuah sistem basis data.

## 3.2 | Level Abstraksi

1. **Fisik:** Bagaimana sebuah record disimpan.

2. **Logika:** Menggambarkan data disimpan dalam basis data, dan hubungan antara data.

3. **View:** Program aplikasi menyembunyikan detail tipe data atau data tertentu untul alasan keamanan.

<br/>

---
# 4 | Konseptual Basis Data

## 4.1 | Pengertian Awal

1. Merupakan bentuk representasi dari identifikasi entitas dan relasinya dengan mendefinisikan atribut dan tipe datanya.

2. Dibuat dalam bentuk table.

3. Berisi penjelasan definisi entitas dan relasi beserta atributnya.

> Source: Materi kuliah

Conceptual DB atau desain basis data konseptual adalah tahap awal dalam perancangan basis data yang berfokus pada pemahaman bisnis dan kebutuhan data secara keseluruhan tanpa memperhatikan detail teknis implementasi. Tahap ini menghasilkan model data konseptual yang berisi entitas, atribut, dan hubungan antar entitas secara tingkat tinggi, yang nantinya menjadi dasar untuk desain logis dan fisik database. 

### Gambaran utama

1. **Tingkat abstraksi tertinggi:** Desain konseptual adalah level paling awal dan abstrak dalam perancangan basis data. 

2. **Fokus pada bisnis:** Tujuannya adalah mendefinisikan struktur dasar kebutuhan bisnis dan data yang diperlukan. 

3. **Independen dari teknologi:** Model ini dirancang tanpa terikat pada software manajemen basis data (DBMS) atau detail implementasi fisik tertentu. 

4. **Output:** Menghasilkan model data konseptual yang berisi entitas, atributnya, dan hubungan antar entitas, serta batasan (constraints) data. 

5. **Representasi visual:** Seringkali divisualisasikan menggunakan diagram konseptual, yang merupakan pendahulu dari diagram hubungan entitas (ERD). 

### Komponen utama

1. **Entitas:** Objek atau konsep dalam dunia nyata yang datanya ingin disimpan (misalnya, Pelanggan, Produk, Pesanan). 

2. **Atribut:** Karakteristik atau properti dari sebuah entitas (misalnya, untuk entitas Pelanggan, atributnya bisa Nama, Alamat, Nomor Telepon). 

3. **Hubungan (Relationship):** Keterkaitan antara dua entitas atau lebih (misalnya, hubungan antara Pelanggan dan Pesanan adalah "membuat" atau "melakukan"). 

4. **Batasan (Constraints):** Aturan-aturan yang menentukan integritas dan konsistensi data (misalnya, kunci primer yang harus unik

> Source: [Database Design: Conceptual Design – School of Information Systems](https://sis.binus.ac.id/2020/07/07/database-design-conceptual-design/#:~:text=Conceptual%20Design%20Database%20adalah%20tahapan,Distributed%20database%20design)

## 4.2 | Bentuk Konseptual Basis Data

Sering disebut dengan kamus data.

Contoh kasus:

Identifikasilah kebutuhan pemodelan data dari kasus berikut ini, tentukan atribut, tipe data dan table-table yang diperlukan:
- Sebuah klinik kesehatan akan membuat sebuah sistem informasi pendaftaran berbasis Mobile.
- Sistem diharapkan dapat menangani: proses pendaftaran, memiliki jadwal praktek doketer, hasil diagnose.
- Setelah diagnose selesai maka pasien memperoleh resep obat.

Berdasarkan contoh kasus tersebut, dapat dibuat kamus data langkah-langkahnya sebagai berikut:

1. Tahap 1:
   - Definisikan data apa saja yang perlu disimpan. 
   - Identifikasi mana entitas dan nama relasi

2. Tahap 2:
	- Definisikan setiap atribut untuk entitas dan relasi
	- Tentukan tipe data dan lebar data untuk setiap atribut

3. Tahap 3:
	- Tentukan atribut kunci (*primary key*)
	- Tentukan atribut tamu (*foreign key*)

### Hasil Analisis Kasus

Dari kasus tersebut, maka dapat diidentifikasi kebutuhan table untuk menampung data tersebut sebagai berikut:
1. Table pendaftaran
2. Table pasien
3. Table dokter
4. Table jadwal
5. Table hasil-resep

Dari kasus tersebut, maka dapat diidentifikasi kebutuhan table untuk menampung data tersebut sebagai berikut:

| Nama Table        | Deskripsi Table                                                                    |
| ----------------- | ---------------------------------------------------------------------------------- |
| Table pendaftaran | Untuk menyimpan data transaksi pasien mendaftar (*sebagai relasi*)                 |
| Table pasien      | Untuk menyimpan data pasien (*sebagai entitas*)                                    |
| Table dokter      | Untuk menyimpan data dokter (*sebagai entitas*)                                    |
| Table jadwal      | Untuk menyimpan data jadwal berisi: dokter, tanggal & hari, jam (*sebagai relasi*) |
| Table hasil-resep | Untuk menyimpan data resep obat untuk pasien (*sebagai relasi*)                    |
| Table obat        | Untuk menyimpan data obat (*sebagai entitas*)                                      |
Kamus data dari kasus tersebut:

| Tipe Entitas | Atribut                                                                             | Tipe data                                                        | Lebar data                        | Keterangan |
| ------------ | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------- | --------------------------------- | ---------- |
| Pasien       | ID-pasien<br>Nama<br>Berat-badan<br>Tinggi-badan<br>Usia<br>Jenis kelamin<br>Alamat | teks<br>teks<br>integer<br>integer<br>integer<br>boolean<br>teks | 6<br>30<br>3<br>3<br>3<br>1<br>50 | PK         |
| Dokter       | ID-Dokter<br>Nama<br>Spesialisasi                                                   | teks<br>teks<br>teks                                             | 6<br>30<br>20                     | PK         |
| Obat         | ID-Obat<br>Nama<br>Jenis                                                            | teks<br>teks<br>teks                                             | 6<br>30<br>30                     | PK         |

Hasil identifikasi relasi:

| Tipe Relasi | Atribut                                          | Tipe data                            | Lebar data            | Keterangan |
| ----------- | ------------------------------------------------ | ------------------------------------ | --------------------- | ---------- |
| Pendaftaran | ID-Pasien<br>ID-Dokter<br>Tanggal<br>hari<br>jam | teks<br>teks<br>date<br>date<br>date | 6<br>6<br>-<br>-<br>- | FK<br>FK   |
| Jadwal      | ID-Dokter<br>hari<br>tanggal<br>jam              | teks<br>date<br>date<br>date         | 6<br>-<br>-<br>-      | FK         |
| Hasil-resep | ID-Pasien<br>ID-Obat<br>diagnosa                 | teks<br>teks<br>teks                 | 6<br>6<br>100         | FK<br>FK   |


