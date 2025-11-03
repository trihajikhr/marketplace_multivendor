---
obsidianUIMode: preview
---
> Made by Trihaji Khoerur Rohman
# 1 | Entity Relationship Diagram
## 1.1 | Pengertian ERD

ERD adalah singkatan dari Entity Relationship Diagram, sebuah diagram visual yang digunakan untuk merancang dan menggambarkan struktur database relasional. Diagram ini memodelkan hubungan antara "entitas" (objek atau konsep) dalam sebuah sistem dan menunjukkan bagaimana entitas tersebut saling terhubung melalui atributnya. 

> Source: [bse.telkomuniversity.ac.id/entity-relationship-diagram-erd-dalam-rekayasa-perangkat-lunak/](https://bse.telkomuniversity.ac.id/entity-relationship-diagram-erd-dalam-rekayasa-perangkat-lunak/)


## 1.2 | Komponen Utama
Komponen utama ERD (Entity Relationship Diagram) adalah **entitas**, **atribut**, dan **relasi**. Entitas adalah objek atau konsep yang datanya ingin disimpan (misalnya, `Mahasiswa`), atribut adalah karakteristik dari entitas (misalnya, `NIM`, `Nama`), dan relasi adalah hubungan antara entitas (misalnya, `Mahasiswa` mengambil `Mata Kuliah`). 

1. Entitas (Entity)
	- Merupakan objek atau konsep dalam sistem yang datanya akan disimpan.
	- Ditampilkan dalam bentuk persegi panjang.
	- **Contoh:** `Mahasiswa`, `Dosen`, `Produk`. 

2. Atribut (Attribute)
	- Merupakan karakteristik atau properti yang dimiliki oleh entitas.
	- Ditampilkan dalam bentuk elips.
	- **Contoh:** Atribut dari entitas `Mahasiswa` bisa berupa `NIM`, `Nama`, `Alamat`. 

3. Relasi (Relationship)
	- Menjelaskan bagaimana entitas-entitas saling terhubung atau berinteraksi.
	- Ditampilkan dalam bentuk belah ketupat.
	- **Contoh:** `Mahasiswa` mengambil `Mata Kuliah`. 

Komponen Tambahan:

- **Kardinalitas (Cardinality):** Menunjukan jumlah hubungan antar entitas (misalnya $1:1$ (satu ke satu), $1:N$ (satu ke banyak), atau $N:M$ (banyak ke banyak)).

<br/>

- **Atribut kunci (Key attribute):** Atribut unik yang menjadi identitas utama entitas, seperti NIM untuk `Mahasiswa`

<br/>

---
# 2 | Notasi lain Dalam ERD
## 2.1 | Entitas Kuat

Entitas kuat adalah entitas yang **dapat berdiri sendiri** dan memiliki **kunci utama (primary key)** yang unik untuk mengidentifikasinya, sehingga keberadaannya tidak bergantung pada entitas lain dalam sebuah model data. Contohnya adalah entitas "Mahasiswa" dengan "ID Mahasiswa" yang unik, atau entitas "Pegawai" dengan "ID Pegawai". 

Karakteristik entitas kuat:

1. **Mandiri**: Tidak memerlukan entitas lain untuk dikenali atau diidentifikasi.

2. **Memiliki kunci utama**: Memiliki satu atau lebih atribut yang secara unik mengidentifikasi setiap instansinya (misalnya, ID Mahasiswa, Nomor Pelanggan).

3. **Direpresentasikan**: Dalam diagram relasi entitas (ERD), entitas kuat biasanya digambarkan dengan kotak persegi panjang tunggal.

4. **Berhubungan**: Dapat memiliki hubungan dengan entitas lain (baik kuat maupun lemah) dalam model data. 

Contoh dalam basis data universitas:

- **Entitas kuat:**
    - **Mahasiswa**: Memiliki atribut unik seperti ID Mahasiswa, nama, dan alamat.
    - **Mata Kuliah**: Memiliki atribut unik seperti Kode Mata Kuliah.

## 2.2 | Entitas Lemah

Entitas lemah adalah entitas yang **tidak memiliki kunci primer sendiri** dan **keberadaannya bergantung pada entitas lain (entitas kuat)** untuk bisa diidentifikasi secara unik. Kunci identifikasinya adalah **kunci komposit**, yang dibentuk dari gabungan atribut-atributnya dan kunci primer dari entitas kuat yang menjadi "induknya". Contoh umum termasuk entitas "tanggungan" yang bergantung pada entitas "karyawan", atau entitas "ruangan" yang bergantung pada entitas "gedung". 

Karakteristik utama entitas lemah

1. **Bergantung pada entitas kuat:** Entitas lemah tidak bisa berdiri sendiri; ia membutuhkan entitas kuat agar bisa memiliki identitas. Jika entitas kuat dihapus, maka data entitas lemah yang terkait juga akan terhapus.

2. **Tidak punya kunci primer unik:** Entitas lemah tidak memiliki atribut kunci yang bisa mengidentifikasinya secara tunggal.

3. **Menggunakan kunci diskriminator:** Entitas ini memiliki kunci diskriminator, yang merupakan atribut unik dalam entitas lemah (seperti nomor bagian dalam sebuah mata kuliah).

4. **Kunci komposit:** Kunci utama entitas lemah terbentuk dari kombinasi kunci diskriminatornya dan kunci primer dari entitas kuat terkait. 

Representasi dalam diagram

- **Persegi panjang ganda:** Entitas lemah digambarkan dengan persegi panjang bergaris ganda untuk membedakannya dari entitas kuat yang hanya menggunakan satu persegi panjang.

- **Berlian ganda:** Hubungan antara entitas lemah dan entitas kuat digambarkan dengan berlian bergaris ganda, yang disebut sebagai "hubungan identifikasi".

## 2.3 | Hubungan / Relasi

Dalam basis data, **hubungan identifikasi** dan **hubungan biasa** (atau non-identifikasi) adalah cara dua tabel berelasi satu sama lain, terutama terkait bagaimana kunci utama (primary key) dari satu tabel (induk) digunakan di tabel lainnya (anak).

Berikut adalah perbedaan utama antara keduanya:

### 2.3.1 | Hubungan biasa (Non-Identifying Relationship)

1. **Ketergantungan**: Entitas anak (tabel) **bisa berdiri sendiri** secara independen dari entitas induknya. Keberadaannya tidak bergantung pada entitas induk.

2. **Kunci Utama**: Kunci utama dari tabel induk menjadi **kunci asing** (foreign key) di tabel anak, tetapi **bukan bagian dari kunci utama** tabel anak. Kunci asing ini bisa bernilai _null_ jika hubungan tersebut bersifat opsional.

3. **Representasi Visual**: Dalam ERD, hubungan ini digambarkan dengan **garis putus-putus**.

4. **Contoh**:
    - Tabel `Mahasiswa` dan `Proyek`. Seorang mahasiswa bisa ada tanpa harus mengerjakan proyek, dan sebaliknya. Tabel `Proyek` akan memiliki kunci asing `IDMahasiswa` yang merujuk ke tabel `Mahasiswa`, tetapi kunci utamanya tetap `IDProyek`.
    - Tabel `Penulis` dan `Buku`. Sebuah buku bisa ada di basis data meskipun informasi penulisnya belum ada (bernilai _null_). Kunci utama tabel `Buku` tetap unik tanpa harus menyertakan `IDPenulis`

### 2.3.2 | Hubungan identifikasi (Identifying Relationship)

1. **Ketergantungan**: Entitas anak (tabel) **tidak bisa ada tanpa** entitas induknya. Identitas atau keberadaan entitas anak sepenuhnya bergantung pada entitas induk.

2. **Kunci Utama**: Kunci utama dari tabel induk menjadi **bagian dari kunci utama gabungan** (composite primary key) di tabel anak.

3. **Representasi Visual**: Dalam diagram _Entity-Relationship_ (ERD), hubungan ini biasanya ditandai dengan **garis padat**.

4. **Contoh**:
    - Tabel `Pesanan` dan `DetailPesanan`. Sebuah item pesanan (`DetailPesanan`) tidak memiliki makna jika tidak ada pesanan (`Pesanan`) yang memuatnya. Kunci utama tabel `DetailPesanan` akan terdiri dari `IDPesanan` (dari tabel `Pesanan`) dan `IDDetailPesanan`.
    - Tabel `Buku` dan `Bab`. Sebuah bab hanya bisa ada jika ada buku yang memuatnya.

## 2.4 | Entitas Asosiatif

Entitas asosiatif adalah entitas khusus yang digunakan dalam desain basis data untuk memecahkan masalah hubungan banyak-ke-banyak (M:N), dengan bertindak sebagai tabel penghubung atau tabel persimpangan antara dua entitas lainnya. Entitas ini sering disebut juga "tabel asosiatif" atau "tabel persimpangan" dan berisi kunci asing yang merujuk pada kunci utama dari dua entitas yang dihubungkannya, sehingga menyederhanakan struktur data dan meningkatkan integritasnya. 

Fungsi dan Kegunaan

1. **Menyelesaikan hubungan M:N:** Mengatasi kompleksitas hubungan di mana setiap item dari entitas A dapat berhubungan dengan banyak item di entitas B, dan sebaliknya. 

2. **Menyederhanakan desain basis data:** Memecah hubungan M:N yang rumit menjadi dua hubungan satu-ke-banyak (1:M) yang lebih sederhana, seperti memecah hubungan antara "Mahasiswa" dan "Mata Kuliah" menjadi dua hubungan, dengan entitas "Pendaftaran" sebagai penghubung. 

3. **Menyimpan data spesifik:** Entitas asosiatif tidak hanya menghubungkan dua entitas, tetapi juga dapat memiliki atributnya sendiri, seperti tanggal pendaftaran atau nilai pada entitas "Pendaftaran". 

4. **Normalisasi basis data:** Membantu dalam proses normalisasi dengan mengurangi redudansi data dan menjaga integritas data secara keseluruhan. 

Contoh dalam Basis Data

1. **Hubungan "Mahasiswa" dan "Mata Kuliah":** Mahasiswa dapat mengambil banyak mata kuliah, dan mata kuliah dapat diambil oleh banyak mahasiswa. Hubungan ini dapat dipecah dengan entitas asosiatif bernama "Pendaftaran" yang berisi `ID Mahasiswa` dan `ID Mata Kuliah`, serta atribut lainnya seperti "Nilai".
    
2. **Hubungan "Pelanggan" dan "Produk":** Pelanggan dapat membeli banyak produk, dan satu produk dapat dibeli oleh banyak pelanggan. Entitas asosiatif "Pembelian" dapat digunakan untuk melacak hubungan ini, menyimpan `ID Pelanggan` dan `ID Produk` serta informasi seperti jumlah dan tanggal pembelian.

3.  **Hubungan "Penulis" dan "Buku":** Penulis dapat menulis banyak buku, dan buku bisa ditulis oleh banyak penulis. Entitas asosiatif "Penulis Buku" atau "Kontribusi" dapat digunakan untuk menghubungkan kedua entitas ini.

## 2.5 | Atribut

Dalam basis data, atribut adalah karakteristik atau properti yang menjelaskan atau memberikan informasi lebih rinci tentang suatu entitas (objek nyata atau konsep yang disimpan datanya) atau relasi. Atribut sering kali direpresentasikan sebagai kolom (atau _field_) dalam sebuah tabel basis data relasional.

Setiap atribut memiliki:

1. **Nama** yang unik dalam entitas/tabelnya.

2. **Tipe data** (misalnya, teks, angka, tanggal) yang menentukan jenis nilai yang dapat disimpannya.

3. **Domain** (rentang atau kumpulan nilai yang diizinkan untuk atribut tersebut).
    

Contoh: Jika entitasnya adalah "Pegawai," atributnya bisa berupa `Nama_Pegawai`, `Tanggal_Lahir`, `Gaji`, dan `Alamat`.

Atribut dapat diklasifikasikan berdasarkan beberapa kriteria, memberikan variasi fungsionalitas dan struktur data yang berbeda. Jenis-jenis atribut yang umum meliputi:

### 2.5.1 | Berdasarkan Sifat Pembentukannya

| **Jenis Atribut**                   | **Penjelasan**                                                                                                                    | **Contoh**                                                                                                                                         |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atribut Sederhana (_Simple/Atomic_) | Atribut yang **tidak dapat dibagi lagi** menjadi komponen-komponen yang lebih kecil dan bermakna.                                 | `Jenis_Kelamin`, `Harga_Barang`, `NIM` (Nomor Induk Mahasiswa).                                                                                    |
| Atribut Komposit (_Composite_)  | Atribut yang terdiri dari **beberapa sub-atribut** yang lebih kecil, di mana masing-masing sub-atribut memiliki makna tersendiri. | `Alamat` (dapat dipecah menjadi `Jalan`, `Kota`, `Kode_Pos`), `Nama_Lengkap` (dapat dipecah menjadi `Nama_Depan`, `Nama_Tengah`, `Nama_Belakang`). |

### 2.5.2 | Berdasarkan Jumlah Nilai yang Dimiliki

| **Jenis Atribut**                          | **Penjelasan**                                                                                                                                                                                             | **Contoh**                                                                                                                 |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| Atribut Bernilai Tunggal (_Single-Valued_) | Atribut yang hanya dapat memiliki **satu nilai** untuk setiap instans entitas (setiap baris data). Ini adalah jenis atribut yang paling umum.                                                              | `Tanggal_Lahir`, `Nomor_KTP`, `Gaji` seorang pegawai (setiap pegawai hanya memiliki satu nilai untuk atribut-atribut ini). |
| Atribut Bernilai Banyak (_Multi-Valued_)   | Atribut yang dapat memiliki **lebih dari satu nilai** untuk setiap instans entitas. Dalam basis data relasional yang terstruktur dengan baik, atribut ini biasanya diimplementasikan dalam tabel terpisah. | `Nomor_Telepon` seorang pegawai (satu pegawai bisa memiliki beberapa nomor telepon), `Hobi` seorang mahasiswa.             |

### 2.5.3 | Berdasarkan Sumber Nilainya

| **Jenis Atribut**            | **Penjelasan**                                                                                                                    | **Contoh**                                                                                                                                        |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atribut Tersimpan (_Stored_) | Atribut yang nilainya disimpan secara langsung di dalam basis data.                                                               | `Tanggal_Lahir` seorang pegawai, `Tanggal_Peminjaman` buku.                                                                                       |
| Atribut Turunan (_Derived_)  | Atribut yang nilainya dihitung atau diturunkan dari nilai atribut lain (atribut tersimpan) dan tidak perlu disimpan secara fisik. | `Usia` (diturunkan dari `Tanggal_Lahir` dan tanggal saat ini), `Total_Harga` (diturunkan dari `Harga_Satuan` dikali `Jumlah_Beli`), `Masa_Kerja`. |

### 2.5.4 | Berdasarkan Fungsinya (Atribut Kunci)

Atribut kunci (_Key Attributes_) adalah atribut khusus yang digunakan untuk mengidentifikasi entitas secara unik dan membangun hubungan antar tabel.

| **Jenis Atribut Kunci**            | **Penjelasan**                                                                                                                                            | **Contoh**                                                                                           |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Kunci Utama (_Primary Key_)        | Atribut (atau kumpulan atribut) yang **mengidentifikasi secara unik** setiap baris data dalam tabel. Nilainya harus unik dan tidak boleh kosong (_NULL_). | `NIM` pada tabel Mahasiswa, `No_KTP` pada tabel Penduduk.                                            |
| Kunci Calon (_Candidate Key_)      | Kumpulan atribut minimal yang dapat menjadi kunci utama. Salah satunya dipilih menjadi Primary Key.                                                       | Pada tabel Pegawai, mungkin `No_KTP`, `No_Pegawai`, dan `Email` semuanya bisa menjadi Candidate Key. |
| Kunci Alternatif (_Alternate Key_) | Candidate Key yang **tidak terpilih** sebagai Primary Key.                                                                                                | Jika `No_Pegawai` dipilih sebagai Primary Key, maka `No_KTP` dan `Email` menjadi Alternate Key.      |
| Kunci Asing (_Foreign Key_)        | Atribut dalam suatu tabel yang nilainya merujuk ke nilai Primary Key di tabel lain, digunakan untuk **menghubungkan** dua tabel.                          | `Kode_Jurusan` pada tabel Mahasiswa (yang merujuk ke `Kode_Jurusan` Primary Key pada tabel Jurusan). |
| Atribut Deskriptif                 | Atribut yang bukan merupakan kunci, digunakan untuk memberikan informasi tambahan tentang entitas.                                                        | `Nama`, `Alamat`, `Gaji` pada tabel Pegawai.                                                         |
### 2.5.5 | Berdasarkan Ketentuan Nilai

| **Jenis Atribut**                         | **Penjelasan**                                                                                                                                  | **Contoh**                                     |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| Atribut Wajib (_Mandatory_)           | Atribut yang **harus memiliki nilai** dan tidak boleh dikosongkan (_NOT NULL_). Biasanya berlaku untuk Primary Key dan atribut penting lainnya. | `Nomor_KTP`, `Nama_Pegawai`.                   |
| Atribut Bernilai Null (_Null-Valued_) | Atribut yang **diizinkan untuk tidak memiliki nilai** (dikosongkan) karena datanya mungkin tidak berlaku atau tidak diketahui saat itu.         | `Nomor_Faks`, `Email_Pribadi` seorang pegawai. |
## 2.6 | Derajat Hubungan/Relasi


**Derajat Relasi** mengacu pada jumlah entitas yang berpartisipasi dalam satu hubungan (_relationship_) tertentu dalam model basis data. Konsep ini membantu kita memahami kompleksitas interaksi antar objek data. Ada tiga jenis utama derajat relasi:

### 2.6.1 | Derajat Satu (_Unary Relationship_)

Hubungan ini terjadi ketika suatu entitas berelasi dengan dirinya sendiri. Ini berarti instans entitas yang sama mengambil dua peran berbeda dalam satu relasi.

- **Deskripsi:** Satu himpunan entitas terlibat dalam relasi.
    
- **Contoh Jelas:**
    
    - Pegawai Mengawasi Pegawai: Dalam entitas `Pegawai`, ada karyawan yang berperan sebagai Supervisor (mengawasi) dan ada karyawan yang berperan sebagai Bawahan (diawasi). Hubungannya kembali ke entitas yang sama, yaitu `Pegawai`.

### 2.6.2 | Derajat Dua (_Binary Relationship_)

Ini adalah jenis hubungan yang paling umum dan paling banyak digunakan. Hubungan ini melibatkan interaksi antara dua entitas yang berbeda.

- **Deskripsi:** Dua himpunan entitas yang berbeda terlibat dalam relasi.
    
- **Contoh Jelas:**
    
    - **Dosen Mengajar Mata Kuliah:** Entitas `Dosen` berinteraksi dengan entitas `Mata_Kuliah` melalui relasi "Mengajar". Setiap entitas memiliki peran yang jelas dan berbeda.
        
    - **Pelanggan Melakukan Pemesanan:** Entitas `Pelanggan` dan entitas `Pemesanan` dihubungkan oleh relasi "Melakukan".
        

### 2.6.3 | Derajat Tiga (_Ternary Relationship_)

Hubungan ini terjadi ketika **tiga entitas** yang berbeda harus berinteraksi secara bersamaan untuk mendefinisikan suatu relasi secara lengkap.

- **Deskripsi:** Tiga himpunan entitas yang berbeda terlibat dalam satu relasi tunggal.
    
- **Contoh Jelas:**
    
    - **Pemasok Memasok Barang ke Proyek:** Kita tidak cukup hanya mengatakan Pemasok memasok Barang, atau Barang digunakan di Proyek. Kita perlu tiga entitas: **Pemasok**, **Barang**, dan **Proyek**. Relasi "Memasok" menghubungkan ketiganya, karena Pemasok A mungkin memasok Barang X _khusus_ untuk Proyek Y.
        

### 2.6.4 | Derajat-N (_N-ary Relationship_)

Relasi yang melibatkan **empat atau lebih entitas** sekaligus. Jenis ini sangat kompleks dan jarang ditemukan dalam praktik karena sulit untuk diinterpretasikan dan diimplementasikan. Dalam desain basis data yang baik, relasi _N-ary_ biasanya dipecah menjadi serangkaian relasi _binary_ atau _ternary_ yang lebih sederhana dan mudah dikelola.

## 2.7 | Kardinalitas

Kardinalitas Relasi adalah konsep fundamental dalam basis data yang mendefinisikan jumlah maksimum instans dari satu entitas yang dapat terhubung dengan instans dari entitas lain dalam suatu hubungan. Secara sederhana, ini menentukan aturan main dalam interaksi data antar tabel.

Ada tiga jenis kardinalitas utama:

### 2.7.1 | Satu ke Satu (_One-to-One / 1:1_)

Jenis relasi ini menyatakan bahwa setiap instans di Entitas A hanya dapat terhubung dengan satu instans di Entitas B, dan sebaliknya.

- **Aturan:** 1 unit data di Entitas A dipasangkan dengan maksimal 1 unit data di Entitas B.
    
- **Contoh Jelas:**
    
    - **Pegawai dan Paspor:** Setiap Pegawai di sebuah perusahaan (yang memiliki kebijakan paspor) memiliki satu Paspor perusahaan. Sebaliknya, setiap Paspor perusahaan hanya dikeluarkan untuk satu Pegawai.

### 2.7.2 | Satu ke Banyak (_One-to-Many / 1:N_)

Ini adalah jenis relasi yang paling umum. Relasi ini menyatakan bahwa satu instans di Entitas A dapat terhubung dengan banyak instans di Entitas B, tetapi setiap instans di Entitas B hanya dapat terhubung dengan satu instans di Entitas A.

- **Aturan:** 1 unit data di Entitas A dapat dipasangkan dengan banyak unit data di Entitas B.
    
- **Contoh Jelas:**
    
    - **Penulis dan Buku:** Satu Penulis dapat menulis banyak Buku. Namun, setiap Buku (dalam model ini, asumsinya) hanya memiliki satu Penulis utama.
        
- **Implementasi:** Kunci Utama (_Primary Key_) dari tabel sisi "satu" (`Penulis`) akan ditempatkan sebagai Kunci Asing (_Foreign Key_) di tabel sisi "banyak" (`Buku`).
    
### 2.7.3 | Banyak ke Banyak (_Many-to-Many / N:M_)

Relasi ini menyatakan bahwa satu instans di Entitas A dapat terhubung dengan banyak instans di Entitas B, dan sebaliknya, satu instans di Entitas B juga dapat terhubung dengan banyak instans di Entitas A.

- **Aturan:** Banyak unit data di Entitas A dapat dipasangkan dengan banyak unit data di Entitas B.
    
- **Contoh Jelas:**
    
    - **Siswa dan Ekstrakurikuler:** Satu Siswa dapat mengikuti banyak Ekstrakurikuler. Sebaliknya, satu Ekstrakurikuler dapat diikuti oleh banyak Siswa.
        
- **Implementasi:** Relasi N:M **tidak dapat diimplementasikan secara langsung** dalam basis data relasional. Untuk mengatasinya, relasi ini harus dipecah menjadi **dua relasi 1:N** dengan membuat tabel perantara (sering disebut _Junction Table_ atau _Associative Entity_). Dalam contoh di atas, akan dibuat tabel ketiga, misalnya `Pendaftaran`, yang berisi kunci asing dari `Siswa` dan `Ekstrakurikuler`.

## 2.8 | Generalisasi, Agregasi, dan Spesialisasi

### 2.8.1 | Sub Entitas

Sub entitas adalah himpunan entitas yang anggotanya merupakan bagian dari himpunan entitas yang lebih besar dan utama. Ini adalah hasil dekomposisi atau spesialisasi dari entitas utama, di mana sub entitas mewarisi atribut dari entitas utamanya tetapi juga memiliki atribut tambahan yang lebih spesifik. Contohnya adalah "mobil" dan "truk" sebagai sub entitas dari entitas utama "kendaraan". 

Ciri-ciri sub entitas

1. **Spesialisasi dari entitas utama:** Sub entitas adalah entitas yang lebih spesifik dari entitas utama. Contoh: "Karyawan" sebagai entitas utama dapat dibagi menjadi sub entitas seperti "Pengembang" dan "Penguji".

2. **Mewarisi atribut:** Sub entitas mewarisi atribut umum dari entitas utama. Misalnya, entitas "Pengembang" dan "Penguji" akan mewarisi atribut umum seperti `Nama_E` dan `Gaji_E` dari entitas `Karyawan`.

3. **Memiliki atribut khusus:** Selain mewarisi atribut umum, setiap sub entitas juga memiliki atributnya sendiri. Contohnya, atribut `Jenis_Tes` hanya dimiliki oleh sub entitas `Penguji`.

4. **Pendekatan _top-down_:** Proses menciptakan sub entitas dari entitas utama disebut spesialisasi, yang merupakan pendekatan _top-down_ dalam pemodelan data.

5. **Mirip dengan entitas lemah:** Sub entitas kadang-kadang mirip dengan entitas lemah karena tidak memiliki atribut yang dapat ditetapkan sebagai _primary key_. 

Contoh

- **Entitas utama:** `Kendaraan`
    - **Atribut:** `VehicleID`, `Make`, `Model`
- **Sub entitas:** `Mobil` dan `Truk`
    - `Mobil` akan mewarisi atribut `VehicleID`, `Make`, dan `Model`, ditambah atribut khusus seperti `Jumlah_Pintu`.
    - `Truk` akan mewarisi atribut `VehicleID`, `Make`, dan `Model`, ditambah atribut khusus seperti `Kapasitas_Angkut`. 

### 2.8.2 | Spesialisasi

Spesialisasi dalam basis data adalah proses memecah entitas tingkat tinggi menjadi beberapa sub-entitas (entitas tingkat rendah) yang lebih spesifik, berdasarkan karakteristik atau atribut yang berbeda. Pendekatan ini disebut "top-down" karena dimulai dari entitas umum lalu dibagi menjadi bagian-bagian yang lebih spesifik. Spesialisasi sering digunakan untuk memodelkan hierarki dalam basis data, di mana sub-entitas mewarisi atribut dari entitas induknya dan memiliki atribut uniknya sendiri. 

Contoh spesialisasi

- **Entitas tingkat tinggi:** `Karyawan`
- **Sub-entitas (entitas tingkat rendah):** `Manajer`, `Staf`, `Guru`, `Administrator`
- **Penjelasan:** Entitas `Karyawan` dibagi menjadi `Manajer` dan `Staf` berdasarkan peran dan atribut yang berbeda (misalnya, Manajer mungkin memiliki atribut `Departemen` sementara Staf tidak). 

Bagaimana cara kerja spesialisasi

1. **Identifikasi entitas umum:** Tentukan entitas yang memiliki banyak kesamaan, misalnya `Pegawai`.

2. **Identifikasi perbedaan:** Tentukan atribut atau karakteristik yang berbeda antar entitas, misalnya `NIP`, `Nama`, `Tanggal Lahir` adalah atribut umum untuk semua `Pegawai`, tetapi `Gaji` hanya berlaku untuk `Pegawai` dan `Manajer` mungkin memiliki atribut `Departemen`.

3. **Buat sub-entitas:** Buat entitas yang lebih spesifik (sub-entitas) dari entitas umum (super-entitas) berdasarkan perbedaan yang telah diidentifikasi.

4. **Terapkan pewarisan:** Sub-entitas secara otomatis mewarisi semua atribut dan relasi dari entitas induknya (super-entitas).

5. **Tambahkan atribut unik:** Tambahkan atribut unik pada setiap sub-entitas untuk mendeskripsikan karakteristiknya yang spesifik. 

Perbedaan dengan Generalisasi

- **Spesialisasi:** Proses "top-down" yang membagi entitas umum menjadi entitas yang lebih spesifik.
- **Generalisasi:** Proses "bottom-up" yang menggabungkan beberapa entitas spesifik menjadi satu entitas umum berdasarkan karakteristik umum yang sama.
- **Contoh:** Generalisasi akan menggabungkan entitas `Manajer` dan `Staf` kembali menjadi `Karyawan`.

### 2.8.3 | Generalisasi

Generalisasi dalam basis data adalah proses menggabungkan beberapa entitas (entitas tingkat rendah) yang memiliki kesamaan atribut menjadi satu entitas yang lebih umum (entitas tingkat tinggi). Proses ini bersifat _bottom-up_ dan digunakan untuk menyederhanakan model basis data dengan mengidentifikasi karakteristik umum dari entitas-entitas khusus. 

Cara kerja generalisasi

1. **Mengidentifikasi kesamaan:** Pertama, sistem mengidentifikasi atribut dan hubungan umum yang dimiliki oleh beberapa entitas.

2. **Membuat entitas umum:** Kemudian, satu entitas baru yang lebih abstrak atau umum dibuat untuk mewakili kesamaan tersebut.

3. **Contoh:** Dalam basis data akademik, entitas-entitas seperti "Mahasiswa S1", "Mahasiswa S2", dan "Mahasiswa S3" bisa digeneralisasikan menjadi satu entitas "Mahasiswa" karena mereka semua memiliki atribut umum seperti NIP, nama, tanggal lahir, dan status marital. 

Perbedaan dengan spesialisasi

- **Generalisasi:** Proses _bottom-up_ yang menggabungkan beberapa entitas menjadi satu entitas umum.
- **Spesialisasi:** Kebalikan dari generalisasi, yaitu proses _top-down_ yang memecah satu entitas tingkat tinggi menjadi beberapa entitas tingkat rendah yang lebih spesifik. 

Manfaat generalisasi

- **Menyederhanakan model:** Mengurangi kompleksitas basis data dengan mengurangi jumlah entitas yang harus dikelola.
- **Memudahkan pemeliharaan:** Membantu dalam merancang basis data yang lebih modular dan lebih mudah dipelihara.
- **Membangun hierarki data:** Membentuk hierarki yang jelas antara entitas umum dan entitas khusus, yang memfasilitasi pengorganisasian data secara efisien.

### 2.8.4 | Agregasi

Agregasi dalam basis data adalah proses pengumpulan, pengelompokan, dan peringkasan data dari berbagai sumber menjadi satu ringkasan yang lebih sederhana untuk analisis. Ini dilakukan untuk menyederhanakan data mentah yang banyak menjadi informasi yang lebih mudah dipahami, seperti menggunakan fungsi seperti `SUM` (menjumlahkan), `COUNT` (menghitung), dan `AVG` (rata-rata). 

Cara kerja agregasi

1. **Pengumpulan data**: Mengumpulkan data dari satu atau beberapa tabel, spreadsheet, atau sumber lainnya.

2. **Pengelompokan**: Mengelompokkan data berdasarkan kategori tertentu, misalnya mengelompokkan data penjualan berdasarkan lokasi pembelian.

3. **Perhitungan**: Melakukan perhitungan pada data yang telah dikelompokkan menggunakan fungsi agregat untuk menghasilkan satu nilai ringkasan. 

Contoh fungsi agregat

- **`SUM`**: Menjumlahkan semua nilai dalam satu kolom.
- **`COUNT`**: Menghitung jumlah baris atau nilai dalam sebuah kolom.
- **`AVG`**: Menghitung nilai rata-rata dari sekumpulan data.
- **`MIN`**: Menemukan nilai minimum dalam sekumpulan data.
- **`MAX`**: Menemukan nilai maksimum dalam sekumpulan data. 

Tujuan dan manfaat

- **Analisis yang lebih mudah**: Memungkinkan Anda melihat gambaran besar data tanpa harus memeriksa setiap baris data satu per satu.
- **Meningkatkan kinerja**: Dengan menyimpan data pada tingkat ringkasan, agregasi dapat meningkatkan performa kueri.
- **Wawasan yang lebih baik**: Mengubah data mentah yang terpisah-pisah menjadi wawasan yang dapat ditindaklanjuti oleh bisnis.

## 2.9 | Pengkodean Internal

Pengkodean Internal dalam basis data merujuk pada **struktur penyimpanan fisik** data pada tingkat rendah, yang detailnya dikelola oleh sistem manajemen basis data (DBMS). Ini bukan tentang "basis data internal" (data milik perusahaan) atau "kode basis data," melainkan bagaimana data direpresentasikan dan diorganisir dalam penyimpanan fisik seperti hard disk. Pengkodean internal menentukan cara data disimpan, seperti menggunakan pengkodean sekuensial atau blok. 

Detail Pengkodean Internal 

1. **Tingkat Internal (Internal Level):** Ini adalah tingkat terendah dalam arsitektur basis data, yang menggambarkan cara basis data disimpan secara fisik di media penyimpan seperti hard disk.

2. **Tujuan:** Untuk menerangkan struktur penyimpanan fisik dan organisasi file, yang mungkin termasuk detail seperti bagaimana data diorganisir dalam blok atau bagaimana data diurutkan (pengkodean sekuensial).

3. **Fokus pada Mesin:** Pengkodean ini berorientasi pada mesin, bukan pada pemahaman pengguna atau aplikasi tingkat tinggi.

4. **Contoh Pengkodean:**
    - **Sekuensial:** Mengasosiasikan data dengan kode yang berurutan.
    - **Blok:** Menstrukturkan data dalam format blok tertentu. Contohnya adalah kode yang terdiri dari komponen seperti tahun masuk ($YY$), kode jurusan ($ZZZZ$), dan nomor urut ($XXXX$).

5. **Abstraksi:** Tingkat ini menyembunyikan detail implementasi yang kompleks dari tingkat yang lebih tinggi (tingkat konseptual dan eksternal) agar pengguna tidak perlu memikirkan hal-hal fisik tersebut.

<br/>

---

# 3 | Langkah-langkah Membuat ERD

Langkah-langkah ini disusun secara berurutan, mulai dari konsep dasar hingga detail relasional, memastikan model data Anda logis dan lengkap.

### Tahap 1: Identifikasi dan Struktur Entitas

1. **Identifikasi Himpunan Entitas:**
    
    - Tentukan semua objek utama atau konsep (_Entitas_) yang akan terlibat dan datanya perlu disimpan dalam sistem (misalnya: Mahasiswa, Dosen, Mata_Kuliah).
        
2. **Definisi Atribut Dasar:**
    
    - Tentukan semua properti (_Atribut_) yang relevan untuk setiap entitas.
        
3. **Klasifikasi dan Penentuan Kunci:**
    
    - **Klasifikasi Atribut:** Nyatakan jenis setiap atribut (Sederhana, Komposit, Bernilai Banyak, Turunan).
        
    - **Penentuan Kunci:** Identifikasi semua **Kunci Calon** (_Candidate Key_) dan pilih salah satunya sebagai **Kunci Utama** (_Primary Key_) untuk setiap entitas.
        

### Tahap 2: Mendefinisikan Hubungan (Relasi)

4. **Identifikasi Himpunan Relasi:**
    
    - Tentukan hubungan atau interaksi (_Relasi_) apa saja yang ada di antara entitas-entitas yang telah ditetapkan (misalnya: Mahasiswa **Mengambil** Mata_Kuliah).
        
    - Tentukan **Derajat Relasi** (apakah _Unary_, _Binary_, atau _Ternary_).
        
5. **Tentukan Kardinalitas Relasi:**
    
    - Tentukan **Kardinalitas** (_Cardinality Ratio_) untuk setiap relasi (yaitu, jumlah maksimum partisipasi: 1:1, 1:N, atau N:M).
        
6. **Tentukan Kekangan Partisipasi:**
    
    - Tentukan **Opsionalitas** (_Participation Constraint_) untuk setiap sisi relasi—apakah partisipasi entitas dalam hubungan tersebut bersifat **Wajib (Total)** atau **Opsional (Parsial)**.
        

### Tahap 3: Finalisasi Model

7. **Pecahkan Relasi Banyak ke Banyak (N:M):**
    
    - Jika ditemukan relasi N:M, pecahkan relasi tersebut dengan memperkenalkan **Entitas Asosiatif** baru. Entitas baru ini akan menggantikan relasi N:M, mengubahnya menjadi dua relasi 1:N.
        
8. **Verifikasi dan Penggambaran ERD:**
    
    - Pastikan semua atribut deskriptif dan atribut kunci sudah masuk dan diklasifikasikan dengan benar.
        
    - Gambarkan model final Anda menggunakan notasi ERD yang dipilih (misalnya, _Crow's Foot_ atau Chen) dengan mencantumkan entitas, atribut (beserta jenisnya), relasi, kardinalitas, dan kekangan partisipasi.
        

---

**Catatan:** Dalam model ERD konseptual, kita fokus pada entitas dan relasi logis. Penentuan _Foreign Key_ (_FK_) adalah langkah yang terjadi kemudian, saat model ini diterjemahkan ke dalam skema basis data relasional.