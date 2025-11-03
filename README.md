---
obsidianUIMode: preview
---
# Marketplace Multi Vendor
## 1 | Identifikasi Entitias

### 1.1 | Tentang User

Kelompok Entitas User:
1. Pengguna
2. Rekening
3. Bank

Golongan pembeli:
1. Pembeli (sub entitias *pengguna*)
2. Alamat pembeli
3. Wishlist
4. Toko favorit

Golongan Penjual:
1. Penjual (sub entitas *pengguna*)
2. Alamat penjual

Voucher:
1. Voucher platform
2. Voucher penjual
3. Voucher terpakai
### 1.2 | Tentang Produk

1. Produk
2. Varian
3. Kategori
4. Produk Media
5. Ulasan
6. Ulasan Media

### 1.3 | Proses transaksi

1. Pemesanan

Pendukung entitas Pemesanan:
1. Pemesanan voucher
2. Detail pemesanan

Pegiriman paket atau barang:
1. Logistik
2. Layanan_pengiriman
3. Detail_pengiriman

<br/>

---

## 2 | Tentang User

### 2.1 | Kelompok Entitas User

Melihat dari marketplace seperti Tokopedia, satu pengguna bisa memiliki 2 role. Pengguna yang langsung menggunakan tokopedia sebagai tempat shooping akan otomatis dikategorikan sebagai *pembeli*. Tapi ada menu di Tokopedia, dimana kita bisa *buka toko*, atau dengan kata lain: Satu akun bisa digunakan sebagai pembeli dan penjual.

Sehingga dibuat entitas super, dan 2 sub entitias. Ini entitas **pengguna** misal:

| Atribut       | Lebar data | Tipe data                  | Keterangan            |
| ------------- | ---------- | -------------------------- | --------------------- |
| id_user       |            | int                        | PK (*auto increment*) |
| email         | 50         | varchar                    | *unique*              |
| password      | 255        | varchar                    | *hash*                |
| nama_lengkap  | 50         | varchar                    |                       |
| no_hp         | 15         | varchar                    |                       |
| tanggal_lahir |            | date                       |                       |
| tanggal_regis |            | datetime                   |                       |
| status_akun   |            | enum(aktif, nonaktif, ban) |                       |
| token_reset   | 70         | varchar                    |                       |
> Verif: ✅ Pengguna

Lalu, baik itu pembeli maupun penjual bisa memiliki beberapa rekening bank, sehingga dibuat entitas baru yaitu **rekening**, yang akan menyimpan daftar rekening bank dari setiap user. Entah itu user memiliki role sebagai penjual atau pembeli, rekening bank yang mereka tambahkan akan masuk ke entitas yang sama:

| Atribut      | Lebar data | Tipe data               | Keterangan              |
| ------------ | ---------- | ----------------------- | ----------------------- |
| id_rekening  |            | int                     | PK (*auto increment*)   |
| id_user      |            | int                     | FK (pengguna . id_user) |
| id_bank      |            | int                     | FK (bank . id_bank)     |
| no_rekening  | 20         | varchar                 |                         |
| nama_pemilik | 20         | varchar                 |                         |
| status_utama |            | boolean (default false) |                         |
> Verif: ❌ Rekening

Maka akan disiapkan entititas **bank** yang akan menyimpan detail terhadap bank:

| Atribut   | Lebar data | Tipe data | Keterangan            |
| --------- | ---------- | --------- | --------------------- |
| id_bank   |            | int       | PK (*auto increment*) |
| nama_bank | 100        | varchar   |                       |
| kode_bank | 10         | varchar   |                       |
> Verif: ❌ Bank


### 2.2 | Golongan pembeli

Jika pengguna menggunakan Tokopedia sebagai pembeli, maka akan ada data tersimpan sebagai berikut, dimana dibuat entitas **Pembeli**, yang berasal dari super entitas **pengguna**:

| Atribut         | Lebar data | Tipe data                            | Keterangan              |
| --------------- | ---------- | ------------------------------------ | ----------------------- |
| id_user         |            | int                                  | FK (pengguna . id_user) |
| level_pembeli   |            | enum(bronze, silver, gold, platinum) |                         |
| total_transaksi |            | int                                  |                         |
| poin_reward     |            | int                                  |                         |
| saldo           |            | int                                  |                         |
> Verif: ✅ Pembeli

Setiap pembeli bisa memiliki banyak alamat. Ambil contoh dimana pembeli Tokopedia bisa menambahkan beberapa alamat, dimana setiap alamat yang ditambahkan berisi juga nama penerima, no hp penerima, dan label alamat. Maka dibuat entitas **alamat pembeli** sebagai berikut:

| Atribut        | Lebar data | Tipe data                 | Keterangan             |
| -------------- | ---------- | ------------------------- | ---------------------- |
| id_alamat      |            | int                       | PK (*auto increment*)  |
| id_pembeli     |            | int                       | FK (pembeli . id_user) |
| nama_penerima  | 50         | varchar                   |                        |
| no_hp_penerima | 15         | varchar                   |                        |
| label_alamat   | 30         | varchar                   |                        |
| detail_alamat  |            | text                      |                        |
| kota           | 50         | varchar                   |                        |
| kode_pos       | 10         | varchar                   |                        |
| is_utama       |            | boolean (default *false*) |                        |
> Verif: ✅ Alamat pembeli

Ketika bosan, kadang pembeli mencoba mengecek Tokopedia, dan mencari barang bagus, yang barangkali mereka beli. Ketika mereka menyimpan produk tertentu, maka produk tersebut akan disimpan di wishlist. Maka dibuatlah entitas **wishlist** sebagai berikut.

Entitas ini akan menjadi **entitas relasi**, yang terhubung antara pembeli dan produk:

```ad-danger
Karena waktu yang semakin sempit, maka untuk sementara dibuat tanpa kategori. Dengan kata lain, semua produk yang dimasukan di wishlist tidak bisa dikategorikan oleh user.
```

| Atribut        | Lebar data | Tipe data | Keterangan              |
| -------------- | ---------- | --------- | ----------------------- |
| id_pembeli     |            | int       | FK (pembeli . id_user)  |
| id_produk      |            | int       | FK (produk . id_produk) |
| tanggal_tambah |            | datetime  |                         |
> Verif: ❌ Wishlist

Pembeli juga bisa menandai beberapa toko favorit atau kepercayaan mereka. Menu ini ada di Tokopedia, dan bisa ditambahkan dengan cara menfollow suatu toko atau vendor. Maka dibuatlah entitias **toko favorit**.

Entitas ini akan menjadi **entitas relasi**, yang menghubungkan antara pembeli dan penjual:

| Atribut        | Lebar data | Tipe data | Keterangan             |
| -------------- | ---------- | --------- | ---------------------- |
| id_pembeli     |            | int       | FK (pembeli . id_user) |
| id_penjual     |            | int       | FK (penjual . id_user) |
| tanggal_tambah |            | datetime  |                        |
> Verif: ✅ Toko favorit

### 2.3 | Golongan Penjual

Ketika pengguna membuka toko, maka akan ada beberapa data lain yang harus ditambahkan, sehingga dibuat sub entitas **penjual**, yang berasal dari super entitas **pengguna**:

| Atribut           | Lebar data | Tipe data                           | Keterangan              |
| ----------------- | ---------- | ----------------------------------- | ----------------------- |
| id_user           |            | int                                 | FK (pengguna . id_user) |
| nama_toko         | 30         | varchar                             |                         |
| deskripsi_toko    |            | text                                |                         |
| rerata_rating     |            | float                               |                         |
| jumlah_produk     |            | int                                 |                         |
| url_toko          | 200        | varchar                             | *unique*                |
| tipe_toko         |            | enum(biasa, partner, official)      |                         |
| status_verifikasi |            | enum(belum, proses, verif, ditolak) |                         |


> Verif: ✅ Penjual

Penjual akan memiliki alamat yang ditujukan oleh kurir pengangkut barang, sehingga dibuat entitas **alamat penjual**:

| Atribut       | Lebar data | Tipe data                 | Keterangan             |
| ------------- | ---------- | ------------------------- | ---------------------- |
| id_alamat     |            | int                       | PK (*auto increment*)  |
| id_penjual    |            | int                       | FK (penjual . id_user) |
| nama_gudang   | 50         | varchar                   |                        |
| detail_alamat |            | text                      |                        |
| kota          | 50         | varchar                   |                        |
| kode_pos      | 10         | varchar                   |                        |
| is_utama      |            | boolean (default *false*) |                        |
> Verif: ✅ Alamat penjual

### 2.4 | Voucher


Sebuah platform marketplace sering mengadakan event spesial, yang mana kadang memberikan voucher potongan harga untuk banyak pembeli di platformnya. Jadi, akan dibuat voucher global yang akan menangani hal ini, berupa entitias **voucher platform** dengan isi sebagai berikut:

| Atribut             | Lebar data | Tipe data             | Keterangan |
| ------------------- | ---------- | --------------------- | ---------- |
| id_voucher_platform | 10         | varchar               | PK         |
| nama_voucher        | 30         | varchar               |            |
| deskripsi           | 200        | varchar               |            |
| tipe_voucher        |            | enum(persen, nominal) |            |
| value               |            | int                   |            |
| min_value           |            | int                   |            |
| status              |            | enum(aktif, nonaktif) |            |
| start_date          |            | datetime              |            |
| end_date            |            | datetime              |            |
> Verif: ❌ voucher platform


Selain platform yang bisa memberikan voucher, penjual juga bisa membuat voucher yang dikhususkan untuk pembelinya ketika membeli produk dari toko tau marketplacenya. Oleh karena itu dibuatlah entitias **voucher  penjual** sebagai berikut:


| Atribut            | Lebar data | Tipe data             | Keterangan             |
| ------------------ | ---------- | --------------------- | ---------------------- |
| id_voucher_penjual | 10         | varchar               | PK                     |
| id_penjual         |            |                       | FK (penjual . id_user) |
| nama_voucher       | 30         | varchar               |                        |
| deskripsi          | 200        | varchar               |                        |
| tipe_voucher       |            | enum(persen, nominal) |                        |
| value              |            | int                   |                        |
| min_value          |            | int                   |                        |
| status             |            | enum(aktif, nonaktif) |                        |
| start_date         |            | datetime              |                        |
| end_date           |            | datetime              |                        |
> Verif: ❌ voucher penjual

Untuk menandai apakah pembeli tertentu sudah pernah menggunakan voucher tersebut atau belum (pembeli hanya bisa menggunakan voucher satu kali), maka dibuatlah entitias relasi yaitu **voucher terpakai** sebagai berikut:

| Atribut             | Lebar data | Tipe data               | Keterangan                                                                                               |
| ------------------- | ---------- | ----------------------- | -------------------------------------------------------------------------------------------------------- |
| id_voucher_terpakai |            | int                     | PK (*auto increment*)                                                                                    |
| id_pembeli          |            | int                     | FK (pembeli . id_user)                                                                                   |
| kategori_voucher    |            | enum(platform, penjual) |                                                                                                          |
| voucher_ref_id      | 10         | varchar                 | FK (voucher_platform . id_voucher_platform)<br><br>atau<br><br>FK (voucher_penjual . id_voucher_penjual) |
| tanggal_pakai       |            | datetime                |                                                                                                          |

> Verif: ❌ voucher terpakai


<br/>

---
## 3 | Tentang Produk

### 3.1 | Entitas Produk

Penjual bisa menjual beberapa produk pastinya, sehingga setiap penjual pasti akan memiliki banyak produk di marketplacenya. Jelas, perlu dibuat entitias **produk** dengan atribut sebagai berikut.

Karena suatu produk mungkin memiliki beberapa varian, maka beberapa data penting dari produk akan dipisahkan ke entitas terpisah. Disini hanya ditampilkan keterangan umum produk:

| Atribut            | lebar data | Tipe data                            | Keterangan                  |
| ------------------ | ---------- | ------------------------------------ | --------------------------- |
| id_produk          |            | int                                  | PK (*auto increment*)       |
| id_penjual         |            | int                                  | FK (penjual . id_user)      |
| id_kategori        | 5          | varchar                              | FK (kategori . id_kategori) |
| nama_produk        | 30         | varchar                              |                             |
| deskripsi          |            | text                                 |                             |
| rerata_rating      |            | float                                |                             |
| jumlah_dibeli      |            | int                                  |                             |
| status_jual        |            | enum (aktif, nonaktif, draft, habis) | default *draft*             |
| tanggal_dibuat     |            | datetime                             |                             |
| tanggal_diperbarui |            | datetime                             |                             |

> Verif: ❌ Produk

### 3.2 | Entitas Kategori

Mengkategorikan produk akan membuat pengelompokan produk oleh pembeli menjadi lebih mudah. Semisal pembeli mengetik baju, maka kategori pakaian akan keluar. JIka menjadi hanphone, maka barang dengan kategori yang sama akan dikeluarkan. Ini akan memudahkan pencarian dan pengelompokan barang. Oleh karena itu, dibuatlah entitas **kategori**.

Entitas ini akan melakukan *self referencing*, atau berelasi tunggal ke dirinya sendiri (*unary relationship*), sehingga akan ada atribut yang mereference ke Primary Key nya sendiri:

| Atribut           | Lebar data | Tipe data | Keterangan                  |
| ----------------- | ---------- | --------- | --------------------------- |
| id_kategori       |            | int       | PK (*auto increment*)       |
| nama_kategori     | 15         | varchar   |                             |
| id_kategori_induk |            | int       | FK (kategori . id_kategori) |
> Verif: ❌ Kategori
### 3.3 | Entitas Varian

Beberapa produk memiliki beberapa varian. Misalnya keyboard dengan merek yang sama, mungkin memiliki beberapa variann warna dan ukuran, dan beberapa produk lain juga. Oleh karena itu, untuk mengatasi beberapa produk yang memiliki lebih dari satu varian, maka dibuat entitas **varian** sebagai berikut:

| Atribut            | Lebar data | Tipe data             | Keterangan              |
| ------------------ | ---------- | --------------------- | ----------------------- |
| id_varian          |            | int                   | PK (*auto increment*)   |
| id_produk          |            | int                   | FK (produk . id_produk) |
| nama_varian        | 50         | varchar               |                         |
| sku                | 50         | varchar               |                         |
| harga              |            | int                   |                         |
| stok               |            | int                   |                         |
| berat              |            | float                 |                         |
| status             |            | enum(aktif, nonaktif) |                         |
| tanggal_dibuat     |            | datetime              |                         |
| tanggal_diperbarui |            | datetime              |                         |
> Verif: ❌ Varian
### 3.3 | Entitas Produk Media

Apa yang lebih meyakinkan pembeli selain gambar produk yang meyakinkan? Gambar yang bagus dan menarik dari produk berguna untuk menarik perhatian pembeli dan menunjukan seperti apa produk yang penjual jual di marketplacenya. Tanpa gambar, setiap membeli produk pasti akan terasa *membeli kucing dalam karung*.

Oleh karena itu dibuatlah entitas **produk media**, yang akan menyelesaikan masalah ini. Tetapi... walaupun gambar bisa disimpan di databse dengan menggunakan format BLOB, menyimpan jutaan gambar pada databse akan mengambil banyak sekali storage. Belum lagi dengan waktu akses pengguna yang mungkin lebih lambat. Perusahaan tidak mungkin membangun server yang mahal secara mandiri hanya untuk masalah menyimpan gambar ini.

> Aku mencari informasi tentang hal ini. Dan sumbernya berasal dari sini: [Tokopedia -Studi Kasus  \|  Google Cloud Documentation](https://cloud.google.com/customers/tokopedia?hl=id#:~:text=Tokopedia%20menggunakan%20Cloud%20Load%20Balancing,Google%20Cloud%20di%20seluruh%20dunia.)

Ternyata, Tokopedia menggunakan bantuan cloud storage seperti Google Cloud Storage untuk menyimpan data asli dari gambar produk yang diupload oleh para penjualnya. Lalu, ketika gambar-gambar atau video dari produk tersebut berhasil tersimpan, maka Tokopedia hanya mengambil metadata dari file gambar tersebut berupa URL, menyimpanya di database mereka, dan memberikan sedikit keterangan tambahan.

Untuk thumbnail atau urutan slide produk, semuanya tetap dikelola oleh sistem mereka, sementara file asli tetap di cloud.

Maka berikut entitas produk media:

| Atribut         | Lebar data | Tipe data           | Keterangan              |
| --------------- | ---------- | ------------------- | ----------------------- |
| id_media_produk |            | int                 | PK (*auto increment*)   |
| id_produk       |            | int                 | FK (produk . id_produk) |
| url_media       | 250        | varchar             |                         |
| tipe_media      |            | enum(gambar, video) |                         |
| no_urut         |            | int                 |                         |
| is_thumbnail    |            | boolean             |                         |
| alt_text        | 50         | varchar             |                         |
> Verif: ❌ Produk media
### 3.4 | Ulasan

Ulasan suatu produk bisa menjadi tolak ukur kepuasan pembeli, dan seberapa bagus suatu produk. Pembeli yang sudah membeli dan memverifikasi telah menerima barang, bisa memberikan ulasan dan rating terhadap produk tersebut. Pembeli juga bisa memberikan beberapa gambar atau video ulasan sebagai file tambahan.

Oleh karena itu, dibuatlah entitas **ulasan** sebagai berikut:

| Atribut        | Lebar data | Tipe data | Keterangan              |
| -------------- | ---------- | --------- | ----------------------- |
| id_ulasan      |            | int       | PK (*auto increment*)   |
| id_produk      |            | int       | FK (produk . id_produk) |
| id_pembeli     |            | int       | FK (pembeli . id_user)  |
| rating         |            | int       |                         |
| komentar       |            | text      |                         |
| tanggal_ulasan |            | datetime  |                         |
| jumlah_like    |            | int       |                         |
| jumlah_media   |            | int       |                         |

> Verif: ❌ Ulasan

### 3.5 | Ulasan Media

Karena setiap ulasan bisa mengandung media seperti foto atau video, maka dibuatlah entitias baru untuk menampung media yang berasal dari ulasan pembeli, yaitu entitias **ulasan media**:

| Atribut    | Lebar data | Tipe data           | Keterangan              |
| ---------- | ---------- | ------------------- | ----------------------- |
| id_media   |            | int                 | PK (*auto increment*)   |
| id_ulasan  |            | int                 | FK (ulasan . id_ulasan) |
| url_media  | 250        | varchar             |                         |
| tipe_media |            | enum(gambar, video) |                         |
| urutan     |            | int                 |                         |
> Verif: ❌ Ulasan media

<br/>

---

## 4 | Proses Transaksi 

### 4.1 | Entitas Pemesanan

Pembeli bisa saja membeli beberapa produk sekaligus dalam sekali pemesanan. Entah itu pembeli membeli banyak barang dari satu toko, atau banyak barang dari banyak toko sekaligus, maka sistem harus bisa menanganinya.

Maka dibuatlah entitas **pemesanan** sebagai berikut:

| Atribut              | Lebar data | Tipe data                                                                   | Keterangan                                    |
| -------------------- | ---------- | --------------------------------------------------------------------------- | --------------------------------------------- |
| id_pemesanan         |            | int                                                                         | PK (*auto increment*)                         |
| id_pembeli           |            | int                                                                         | FK (pembeli . id_user)                        |
| id_penjual           |            | int                                                                         | FK (penjual . id_user)                        |
| id_alamat_penjual    |            | int                                                                         | FK (alamat_penjual . id_alamat)               |
| id_alamat_pembeli    |            | int                                                                         | FK (alamat_pembeli . id_alamat)               |
| id_detail_pengiriman |            | int                                                                         | FK (detail_pengiriman . id_detail_pengiriman) |
| date_pesan           |            | datetime                                                                    |                                               |
| catatan_pembeli      | 200        | varchar                                                                     |                                               |
| metode_pembayaran    |            | enum (transfer, cod)                                                        |                                               |
| tagihan_produk       |            | int                                                                         |                                               |
| ongkos_kirim         |            | int                                                                         |                                               |
| harga_total          |            | int                                                                         |                                               |
| status               |            | enum (menunggu_bayar, diproses, dikirim, selesai, dibatalkan, dikembalikan) |                                               |


> Verif: ❌ Pemesanan

### 4.2 | Pendukung Entititas Pemesanan

Karena dalam satu pemesanan bisa menggunakan beberapa voucher, misal pembeli menggunakan voucher platform dan voucher penjual diwaktu yang sama, maka dibuat entitas relasi, karena terdapat hubungan many-to-many, sehingga dibuat table **pemesanan voucher** seperti berikut:


| Atribut             | Lebar data | Tipe data | Keterangan                                  |
| ------------------- | ---------- | --------- | ------------------------------------------- |
| id_pemesanan        |            | int       | FK (pemesanan . id_pemesanan)               |
| id_voucher_terpakai | 10         | varchar   | FK (voucher_terpakai . id_voucher_terpakai) |
| potongan_diterapkan |            | int       |                                             |

> Verif: ❌ Pemesanan voucher

Entitas pemesanan hanya akan menyimpan id_pemesanan saja. Aturan normalisasi yang bagus adalah membuat entitas detail pemesanan untuk lebih merincikan produk yang dipesan. Oleh karena itu dibuatlah entitas baru berupa **detail pemesanan**, dengan atribut berikut:

| Atribut       | Lebar data | Tipe data | Keterangan                    |
| ------------- | ---------- | --------- | ----------------------------- |
| id_pemesanan  |            | int       | FK (pemesanan . id_pemesanan) |
| id_produk     |            | int       | FK (produk . id_produk)       |
| id_varian     |            | int       | FK (varian . id_varian)       |
| kuantitas     |            | int       |                               |
| harga_satuan  |            | int       |                               |
| subtotal_item |            | int       |                               |
> Verif: ❌ Detail pemesanan


### 4.3 | Pengiriman Paket atau Barang

Ketika pembeli membeli barang, maka barang tersebut akan diambil dari penjual, dan dikirimkan ke pembeli. Dan... sudah. 

Tidak semudah itu ferguso. Ini bagian yang paling rumit disini 🥲.

```ad-danger
1. Pertama, ketika pembeli membeli barang, pembeli bisa memilih layanan pengiriman yang disediakan oleh beberapa perusahaan logistik seperti JNE, JNT, siCepat, dan semacamnya, yang mana masing-masing jasa pengiriman memiliki layanan yang memiliki harga yang mungkin berbeda

2. Kedua, pembeli harus mengetahui ongkos kirim yang mungkin berlaku. 

3. Ketiga, pembeli mengetahui estimasi hari yang dibutuhkan untuk barang yang ia beli bisa sampai.
```

Untuk mengatasi masalah pertama, maka entitas pemesanan harus memiliki atribut yang berasal dari entitas yang mengerjakan peengiriman. Maka, dibuatlah entitias **logistik** sebagai berikut:


| Atribut       | Lebar data | Tipe data             | Keterangan            |
| ------------- | ---------- | --------------------- | --------------------- |
| id_logistik   |            | int                   | PK (*auto increment*) |
| kode_logistik | 10         | varchar               |                       |
| nama_logistik | 20         | varchar               |                       |
| kontak_cs     | 15         | varchar               |                       |
| status        |            | enum(aktif, nonaktif) |                       |
| keterangan    |            | text                  |                       |
> Verif: ❌ Logistik

Lalu, karena setiap logistik memiliki beberapa layanan, misal JNE memiliki layanan berupa pengiriman regulasi, ekonomi, express, atau instan, maka dibuat entitas **layanan pengiriman** sebagai berikut:


| Atribut                 | Lebar data | Tipe data | Keterangan                  |
| ----------------------- | ---------- | --------- | --------------------------- |
| id_layanan_pengiriman   |            | int       | PK (*auto increment*)       |
| id_logistik             |            | int       | FK (logistik . id_logistik) |
| nama_layanan            | 20         | varchar   |                             |
| minimal_jarak           |            | float     |                             |
| harga_per_km            |            | float     |                             |
| harga_per_kg            |            | float     |                             |
| estimasi_perhari_tempuh |            | int       |                             |

> Verif: ❌ Layanan pengiriman

Karena menaruh detail transaksi di entitias pemesanan, maka akan lebih baik untuk membuat entitias **detail pengiriman**, sehingga entitias pemesanan hanya perlu menyimpan FK dari PK di detail pengiriman, yang kira-kira berisi sebagai berikut:


| Atribut              | Lebar data | Tipe data | Keterangan                                      |
| -------------------- | ---------- | --------- | ----------------------------------------------- |
| id_detail_pengiriman |            | int       | PK (*auto increment*)                           |
| id_pemesanan         |            | int       | FK (pemesanan . id_pemesanan)                   |
| id_layanan           |            | int       | FK (layanan_pengiriman . id_layanan_pengiriman) |
| jarak_tempuh         |            | int       |                                                 |
| harga_tempuh         |            | float     |                                                 |
| harga_berat          |            | float     |                                                 |
| total                |            | int       |                                                 |
| estimasi_hari        |            | int       |                                                 |

> Verif: ❌ Detail pengiriman

Untuk pengisian entitas diatas, didasarkan pada perkiraan rumus berikut:

1. `Jarak tempuh` didapat dari menghitung jarak dari `alamat pembeli` dan `penerima`. 
2. Harga tempuh didapat dari perhitunga `per km` layanan pengiriman dengan `jarak tempuh`.
3. Harga berat didapat dari perhitungan `harga per kg` layanan dikali dengan `berat total produk`.
4. `Total` didapat dari menambahkan hasil dari `harga tempuh` + `harga berat`. 
5. `Estimasi hari` didapat dengan membagi jarak tempuh dengan `estimasi_perhari_tempuh` yang dibulatkan ke atas. 

