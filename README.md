---
obsidianUIMode: preview
---
# Marketplace Multi Vendor
# 1 | Identifikasi Entitias

1. Pengguna
2. Rekening
3. Bank
4. Alamat
5. Pembeli (sub entitias *pengguna*)
6. Wishlist
7. Toko favorit
8. Penjual (sub entitas *pengguna*)
9. Voucher platform
10. Voucher penjual
11. Voucher terpakai
12. Produk
13. Varian
14. Kategori
15. Produk Media
16. Ulasan
17. Ulasan Media
18. Pemesanan
19. Detail pemesanan
20. Logistik
21. Layanan pengiriman
22. Detail pengiriman

<br/>

---

# 2 | Identifikasi Atribut 

## 2.1 | Entitas pengguna

Melihat dari marketplace seperti Tokopedia, satu pengguna bisa memiliki 2 role. Pengguna akan langsung memiliki role sebagai pembeli ketika pertama kali mendaftar. Pendaftaran dilakukan dengan mendaftarkan email, password, dan nama dari user. Pengguna bisa memiliki akun yang sama untuk berbelanja sebagai pembeli, lalu menggunakan akun yang sama untuk mendaftar sebagai penjual dan membuat toko untuk menjual produk:

| Atribut       | Lebar data | Tipe data                  | Keterangan            |
| ------------- | ---------- | -------------------------- | --------------------- |
| id_user       |            | int                        | PK (*auto increment*) |
| email         | 50         | varchar                    | *unique*              |
| password      | 255        | varchar                    | *hash*                |
| nama_lengkap  | 50         | varchar                    |                       |
| no_hp         | 15         | varchar                    | *unique*              |
| tanggal_lahir |            | date                       |                       |
| tanggal_regis |            | datetime                   |                       |
| status_akun   |            | enum(aktif, nonaktif, ban) | default *nonaktif*    |
| token_reset   | 70         | varchar                    |                       |

## 2.2 | Entititas Rekening 

Baik pembeli maupun penjual dapat mendaftarkan dan memiliki lebih dari satu rekening bank sebagai sumber dana. Oleh karena itu, dibuat entitas baru bernama rekening, yang berfungsi untuk menyimpan daftar rekening bank milik setiap pengguna. Terlepas dari peran pengguna sebagai penjual atau pembeli, seluruh data rekening akan disimpan pada entitas yang sama:

| Atribut      | Lebar data | Tipe data               | Keterangan              |
| ------------ | ---------- | ----------------------- | ----------------------- |
| id_rekening  |            | int                     | PK (*auto increment*)   |
| id_user      |            | int                     | FK (pengguna . id_user) |
| id_bank      |            | int                     | FK (bank . id_bank)     |
| no_rekening  | 20         | varchar                 | *unique*                |
| nama_pemilik | 50         | varchar                 |                         |
| is_utama     |            | boolean (default false) |                         |
## 2.3 | Entitas Bank

Entitas Bank memiliki `id_bank` sebagai primary key untuk identitas unik, `nama_bank` untuk nama bank, dan `kode_bank` unik agar tidak ada duplikasi kode. Desain ini baik karena memisahkan data bank dari rekening, mengurangi duplikasi, mempermudah pemeliharaan, dan memastikan integritas data sekaligus mendukung integrasi dengan sistem perbankan.

| Atribut   | Lebar data | Tipe data | Keterangan            |
| --------- | ---------- | --------- | --------------------- |
| id_bank   |            | int       | PK (*auto increment*) |
| nama_bank | 30         | varchar   |                       |
| kode_bank | 10         | varchar   | *unique*              |

## 2.4 | Entitas Alamat
Entitas Alamat digunakan untuk menyimpan informasi lokasi yang terkait dengan pengguna, baik pembeli maupun penjual. Setiap alamat mencakup detail seperti nama penerima, nomor telepon, label alamat, kota, kode pos, dan tanda apakah alamat tersebut utama. Dengan memisahkan alamat ke entitas tersendiri, sistem dapat mendukung beberapa alamat per pengguna sekaligus menjaga integritas data, memudahkan manajemen pengiriman, dan menghindari duplikasi informasi alamat di entitas pengguna.

| Atribut        | Lebar data | Tipe data              | Keterangan              |
| -------------- | ---------- | ---------------------- | ----------------------- |
| id_alamat      |            | int                    | PK (*auto increment*)   |
| is_user        |            | int                    | FK (pengguna . id_user) |
| label_alamat   | 50         | varchar                |                         |
| tipe_alamat    |            | enum(pembeli, penjual) |                         |
| nama_penerima  | 50         | varchar                |                         |
| no_hp_penerima | 15         | varchar                |                         |
| detail_alamat  |            | text                   |                         |
| kota           | 30         | varchar                |                         |
| kode_pos       | 10         | varchar                |                         |
| is_utama       |            | boolean                | default *false*         |

## 2.5 | Entititas Pembeli

Pengguna akan secara otomatis memiliki role sebagai pembeli, sehingga akan dibuat sub entitas pembeli, yang merupakan entitas turunan dari entitias pengguna. Beberapa data yang berkaitan dengan pembeli akan disimpan di entitas turunan ini.

| Atribut         | Lebar data | Tipe data                            | Keterangan              |
| --------------- | ---------- | ------------------------------------ | ----------------------- |
| id_user         |            | int                                  | FK (pengguna . id_user) |
| level_pembeli   |            | enum(bronze, silver, gold, platinum) | default *bronze*        |
| total_transaksi |            | int                                  |                         |
| poin_reward     |            | int                                  |                         |
| saldo           |            | int                                  |                         |

## 2.6 | Entitas Wishlist
Entitas wishlist digunakan untuk menyimpan daftar produk yang diinginkan oleh pembeli. Setiap catatan menghubungkan satu pembeli dengan satu produk dan mencatat tanggal penambahan ke wishlist. Dengan adanya entitas ini, sistem dapat memudahkan pembeli untuk menandai produk favorit, memantau harga, atau menyusun daftar belanja, sekaligus menjaga integritas data dengan memastikan relasi yang jelas antara pembeli dan produk yang diinginkan.

| Atribut        | Lebar data | Tipe data | Keterangan              |
| -------------- | ---------- | --------- | ----------------------- |
| id_pembeli     |            | int       | FK (pembeli . id_user)  |
| id_produk      |            | int       | FK (produk . id_produk) |
| tanggal_tambah |            | datetime  |                         |
## 2.7 | Entitas Toko Favorit

Entitas toko favorit digunakan untuk menyimpan daftar toko yang ditandai sebagai favorit oleh pembeli. Setiap catatan menghubungkan satu pembeli dengan satu penjual, sehingga sistem dapat melacak toko-toko yang sering dikunjungi atau disukai pembeli. Dengan entitas ini, pembeli dapat dengan mudah mengakses toko favorit mereka, sementara sistem dapat memanfaatkan data ini untuk rekomendasi atau promosi, sekaligus menjaga integritas relasi antara pembeli dan penjual.

| Atribut        | Lebar data | Tipe data | Keterangan             |
| -------------- | ---------- | --------- | ---------------------- |
| id_pembeli     |            | int       | FK (pembeli . id_user) |
| id_penjual     |            | int       | FK (penjual . id_user) |
| tanggal_tambah |            | datetime  |                        |

## 2.8 | Entitas Penjual

Entitas penjual merupakan sub-entitas dari pengguna yang menyimpan informasi khusus terkait peran pengguna sebagai penjual di marketplace. Data yang disimpan mencakup atribut yang relevan untuk aktivitas penjualan, seperti nama toko, profil, dan informasi terkait operasional. Dengan memisahkan data penjual dari entitas pengguna umum, sistem dapat mengelola akun penjual secara lebih terstruktur, memudahkan pengelolaan produk, transaksi, dan pengaturan toko.

| Atribut           | Lebar data | Tipe data                           | Keterangan              |
| ----------------- | ---------- | ----------------------------------- | ----------------------- |
| id_user           |            | int                                 | FK (pengguna . id_user) |
| nama_toko         | 20         | varchar                             | *unique*                |
| deskripsi_toko    |            | text                                |                         |
| rerata_rating     |            | float                               |                         |
| jumlah_produk     |            | int                                 |                         |
| url_toko          | 200        | varchar                             | *unique*                |
| tipe_toko         |            | enum(biasa, partner, official)      |                         |
| status_verifikasi |            | enum(belum, proses, verif, ditolak) |                         |

## 2.9 | Entitas Voucher Platform
Entitas Voucher Platform menyimpan informasi voucher yang diterbitkan oleh platform, termasuk nama, deskripsi, tipe potongan (persen atau nominal), nilai, minimum pembelian, status aktif/nonaktif, dan periode berlaku, sehingga sistem dapat mengelola promosi secara terpusat dan memastikan penggunaan voucher yang konsisten.

| Atribut             | Lebar data | Tipe data             | Keterangan            |
| ------------------- | ---------- | --------------------- | --------------------- |
| id_voucher_platform | 10         | int                   | PK (*auto_increment*) |
| nama_voucher        | 30         | varchar               | *unique*              |
| deskripsi           | 200        | varchar               |                       |
| tipe_voucher        |            | enum(persen, nominal) |                       |
| value               |            | int                   |                       |
| min_value           |            | int                   |                       |
| status              |            | enum(aktif, nonaktif) |                       |
| start_date          |            | datetime              |                       |
| end_date            |            | datetime              |                       |

## 2.10 | Entitas Voucher Penjual

Entitas Voucher Penjual menyimpan informasi voucher yang diterbitkan secara khusus oleh penjual. Pemisahan entitas ini dari Voucher Platform memungkinkan sistem membedakan antara promosi global dari platform dan promosi individual dari penjual, sehingga memudahkan pengelolaan, pelacakan, dan menjaga konsistensi data masing-masing jenis voucher.

| Atribut            | Lebar data | Tipe data             | Keterangan             |
| ------------------ | ---------- | --------------------- | ---------------------- |
| id_voucher_penjual |            | int                   | PK                     |
| id_penjual         |            | int                   | FK (penjual . id_user) |
| nama_voucher       | 30         | varchar               |                        |
| deskripsi          | 200        | varchar               |                        |
| tipe_voucher       |            | enum(persen, nominal) |                        |
| value              |            | int                   |                        |
| min_value          |            | int                   |                        |
| status             |            | enum(aktif, nonaktif) |                        |
| start_date         |            | datetime              |                        |
| end_date           |            | datetime              |                        |

## 2.11 | Entitas Voucher Terpakai

Untuk menandai apakah pembeli tertentu sudah pernah menggunakan voucher tersebut atau belum (pembeli hanya bisa menggunakan voucher satu kali), maka dibuatlah entitias relasi yaitu **voucher terpakai** sebagai berikut:

| Atribut             | Lebar data | Tipe data               | Keterangan                                  |
| ------------------- | ---------- | ----------------------- | ------------------------------------------- |
| id_voucher_terpakai |            | int                     | PK (*auto increment*)                       |
| id_pembeli          |            | int                     | FK (pembeli . id_user)                      |
| kategori_voucher    |            | enum(platform, penjual) |                                             |
| id_voucher_platform |            |                         | FK (voucher_platform . id_voucher_platform) |
| id_voucher_penjual  |            | int                     | FK (voucher_penjual . id_voucher_penjual)   |
| tanggal_pakai       |            | datetime                |                                             |


## 2.12 | Entitas Produk

Penjual bisa menjual beberapa produk pastinya, sehingga setiap penjual pasti akan memiliki banyak produk di marketplacenya. Oleh karena itu, dibuatlah entitas produk. Karena suatu produk mungkin memiliki beberapa varian, maka beberapa data penting dari produk akan dipisahkan ke entitas terpisah. Disini hanya ditampilkan keterangan umum produk:

| Atribut            | lebar data | Tipe data                            | Keterangan                  |
| ------------------ | ---------- | ------------------------------------ | --------------------------- |
| id_produk          |            | int                                  | PK (*auto increment*)       |
| id_penjual         |            | int                                  | FK (penjual . id_user)      |
| id_kategori        |            | int                                  | FK (kategori . id_kategori) |
| nama_produk        | 50         | varchar                              |                             |
| deskripsi          |            | text                                 |                             |
| rerata_rating      |            | float                                |                             |
| jumlah_dibeli      |            | int                                  |                             |
| status_jual        |            | enum (aktif, nonaktif, draft, habis) | default *draft*             |
| tanggal_dibuat     |            | datetime                             |                             |
| tanggal_diperbarui |            | datetime                             |                             |

## 2.13 | Entitas Varian
Entitas Varian digunakan untuk menyimpan detail variasi produk yang ditawarkan oleh penjual, seperti nama varian, SKU, harga, stok, berat, dan status aktif atau nonaktif. Dengan memisahkan varian dari entitas produk utama, sistem dapat mengelola setiap variasi secara spesifik, memudahkan pengaturan stok dan harga, serta menjaga integritas data produk yang memiliki lebih dari satu opsi atau konfigurasi.

| Atribut            | Lebar data | Tipe data             | Keterangan              |
| ------------------ | ---------- | --------------------- | ----------------------- |
| id_varian          |            | int                   | PK (*auto increment*)   |
| id_produk          |            | int                   | FK (produk . id_produk) |
| nama_varian        | 50         | varchar               |                         |
| sku                | 50         | varchar               | *unique*                |
| harga              |            | int                   |                         |
| stok               |            | int                   |                         |
| berat              |            | float                 |                         |
| status             |            | enum(aktif, nonaktif) |                         |
| tanggal_dibuat     |            | datetime              |                         |
| tanggal_diperbarui |            | datetime              |                         |


## 2.14 | Entitas Kategori

Mengkategorikan produk memudahkan pembeli dalam mencari dan mengelompokkan barang. Misalnya, saat pembeli mencari “baju”, sistem akan menampilkan produk dalam kategori pakaian; jika mencari “handphone”, produk dengan kategori yang sama akan ditampilkan. Untuk mendukung hal ini, dibuat entitas Kategori. Entitas ini menggunakan self-referencing (_unary relationship_), di mana setiap kategori dapat memiliki kategori induk yang direferensikan melalui atribut id_kategori_induk. Desain ini memungkinkan struktur kategori bersarang atau hierarkis, sehingga pengelompokan produk menjadi lebih fleksibel dan sistematis.

| Atribut           | Lebar data | Tipe data | Keterangan                  |
| ----------------- | ---------- | --------- | --------------------------- |
| id_kategori       |            | int       | PK (*auto increment*)       |
| nama_kategori     | 15         | varchar   |                             |
| id_kategori_induk |            | int       | FK (kategori . id_kategori) |

## 2.15 | Entitas Produk Media

Apa yang lebih meyakinkan pembeli selain gambar produk yang meyakinkan? Gambar yang bagus dan menarik dari produk berguna untuk menarik perhatian pembeli dan menunjukan seperti apa produk yang penjual jual di marketplacenya. Tanpa gambar, setiap membeli produk pasti akan terasa *membeli kucing dalam karung*.

Oleh karena itu dibuatlah entitas **produk media**, yang akan menyelesaikan masalah ini. Tetapi... walaupun gambar bisa disimpan di databse dengan menggunakan format BLOB, menyimpan jutaan gambar pada databse akan mengambil banyak sekali storage. Belum lagi dengan waktu akses pengguna yang mungkin lebih lambat. Perusahaan tidak mungkin membangun server yang mahal secara mandiri hanya untuk masalah menyimpan gambar ini.

> Aku mencari informasi tentang hal ini. Dan sumbernya berasal dari sini: [Tokopedia -Studi Kasus  \|  Google Cloud Documentation](https://cloud.google.com/customers/tokopedia?hl=id#:~:text=Tokopedia%20menggunakan%20Cloud%20Load%20Balancing,Google%20Cloud%20di%20seluruh%20dunia.)

Ternyata, Tokopedia menggunakan bantuan cloud storage seperti Google Cloud Storage untuk menyimpan data asli dari gambar produk yang diupload oleh para penjualnya. Lalu, ketika gambar-gambar atau video dari produk tersebut berhasil tersimpan, maka Tokopedia hanya mengambil metadata dari file gambar tersebut berupa URL, menyimpanya di database mereka, dan memberikan sedikit keterangan tambahan.

Untuk thumbnail atau urutan slide produk, semuanya tetap dikelola oleh sistem mereka, sementara file asli tetap di cloud.

Maka berikut entitas produk media:

| Atribut         | Lebar data | Tipe data           | Keterangan              |
| --------------- | ---------- | ------------------- | ----------------------- |
| id_produk_media |            | int                 | PK (*auto increment*)   |
| id_produk       |            | int                 | FK (produk . id_produk) |
| url_media       | 250        | varchar             |                         |
| tipe_media      |            | enum(gambar, video) |                         |
| no_urut         |            | int                 |                         |
| is_thumbnail    |            | boolean             |                         |
| alt_text        | 50         | varchar             |                         |

## 2.16 | Entitas Ulasan

Ulasan suatu produk bisa menjadi tolak ukur kepuasan pembeli, dan seberapa bagus suatu produk. Pembeli yang sudah membeli dan memverifikasi telah menerima barang, bisa memberikan ulasan dan rating terhadap produk tersebut. 

| Atribut        | Lebar data | Tipe data | Keterangan              |
| -------------- | ---------- | --------- | ----------------------- |
| id_ulasan      |            | int       | PK (*auto increment*)   |
| id_produk      |            | int       | FK (produk . id_produk) |
| id_pembeli     |            | int       | FK (pembeli . id_user)  |
| rating         |            | int       |                         |
| komentar       |            | varchar   |                         |
| tanggal_ulasan |            | datetime  |                         |


## 2.17 | Entitas Ulasan Media

Karena setiap ulasan dapat menyertakan media seperti foto atau video, dibuat entitas Ulasan Media untuk menampung file media yang terkait dengan ulasan pembeli. Entitas ini menyimpan informasi seperti URL media, tipe media (gambar atau video), dan urutan tampilannya. Dengan memisahkan media dari entitas ulasan, sistem dapat mengelola berbagai jenis media secara terstruktur, memudahkan penambahan atau penghapusan media, serta menjaga integritas dan keterkaitan antara ulasan dan media yang menyertainya.

| Atribut         | Lebar data | Tipe data           | Keterangan              |
| --------------- | ---------- | ------------------- | ----------------------- |
| id_ulasan_media |            | int                 | PK (*auto increment*)   |
| id_ulasan       |            | int                 | FK (ulasan . id_ulasan) |
| url_media       | 250        | varchar             |                         |
| tipe_media      |            | enum(gambar, video) |                         |
| urutan          |            | int                 |                         |

## 2.18 | Entitas Pemesanan

Entitas pemesanan digunakan untuk menyimpan data transaksi yang dilakukan pembeli di marketplace. Setiap pemesanan mencakup informasi seperti pembeli, penjual, alamat pengiriman, metode pembayaran, tagihan produk, ongkos kirim, total harga, dan status pemesanan. Dengan entitas ini, sistem dapat mencatat dan mengelola seluruh proses transaksi secara terstruktur, memudahkan pelacakan pesanan, serta menjaga integritas data antara pembeli, penjual, dan detail pengiriman.

| Atribut             | Lebar data | Tipe data                                                                   | Keterangan                                |
| ------------------- | ---------- | --------------------------------------------------------------------------- | ----------------------------------------- |
| id_pemesanan        |            | int                                                                         | PK (*auto increment*)                     |
| id_pembeli          |            | int                                                                         | FK (pembeli . id_user)                    |
| id_penjual          |            | int                                                                         | FK (penjual . id_user)                    |
| id_alamat_pembeli   |            | int                                                                         | FK (alamat . id_alamat)                   |
| id_alamat_penjual   |            | int                                                                         | FK (alamat . id_alamat)                   |
| id_voucher_terpakai |            | int                                                                         | FK (voucher_terpakai.id_voucher_terpakai) |
| date_pesan          |            | datetime                                                                    |                                           |
| catatan_pembeli     | 200        | varchar                                                                     |                                           |
| metode_pembayaran   |            | enum (transfer, cod)                                                        |                                           |
| tagihan_produk      |            | int                                                                         |                                           |
| ongkos_kirim        |            | int                                                                         |                                           |
| harga_total         |            | int                                                                         |                                           |
| status              |            | enum (menunggu_bayar, diproses, dikirim, selesai, dibatalkan, dikembalikan) |                                           |


## 2.19 | Entititas Detail Pemesanan

Entitas Detail Pemesanan menyimpan informasi rinci mengenai setiap item yang termasuk dalam suatu pemesanan. Setiap catatan menghubungkan pemesanan dengan produk atau varian yang dibeli, serta mencatat kuantitas, harga satuan, dan subtotal item. Dengan memisahkan detail pemesanan dari entitas pemesanan utama, sistem dapat mengelola transaksi dengan lebih terstruktur, mendukung produk dengan variasi.

| Atribut       | Lebar data | Tipe data | Keterangan                    |
| ------------- | ---------- | --------- | ----------------------------- |
| id_pemesanan  |            | int       | FK (pemesanan . id_pemesanan) |
| id_produk     |            | int       | FK (produk . id_produk)       |
| id_varian     |            | int       | FK (varian . id_varian)       |
| kuantitas     |            | int       |                               |
| harga_satuan  |            | int       |                               |
| subtotal_item |            | int       |                               |

## 2.20 | Entitas Logistik

Ketika pembeli membeli barang, maka barang tersebut akan diambil dari penjual, dan dikirimkan ke pembeli. Dan... sudah. 

Tidak semudah itu ferguso. Ini bagian yang paling rumit disini 🥲.

1. Pertama, ketika pembeli membeli barang, pembeli bisa memilih layanan pengiriman yang disediakan oleh beberapa perusahaan logistik seperti JNE, JNT, siCepat, dan semacamnya, yang mana masing-masing jasa pengiriman memiliki layanan yang memiliki harga yang mungkin berbeda

2. Kedua, pembeli harus mengetahui ongkos kirim yang mungkin berlaku. 

3. Ketiga, pembeli mengetahui estimasi hari yang dibutuhkan untuk barang yang ia beli bisa sampai.


Untuk mengatasi masalah pertama, maka entitas pemesanan harus memiliki atribut yang berasal dari entitas yang mengerjakan peengiriman. Maka, dibuatlah entitias **logistik**.

Entitas Logistik berfungsi untuk menampung data penyedia jasa pengiriman yang bekerja sama dengan marketplace. Dengan adanya entitas ini, sistem dapat mengelola penyedia logistik secara terpusat, memudahkan pemeliharaan informasi, dan mendukung kelancaran proses pengiriman pesanan bagi pengguna.

| Atribut       | Lebar data | Tipe data             | Keterangan            |
| ------------- | ---------- | --------------------- | --------------------- |
| id_logistik   |            | int                   | PK (*auto increment*) |
| kode_logistik | 10         | varchar               |                       |
| nama_logistik | 20         | varchar               |                       |
| kontak_cs     | 15         | varchar               |                       |
| status        |            | enum(aktif, nonaktif) |                       |

## 2.21 | Entitas Layanan Pengiriman

Entitas Layanan Pengiriman menyimpan informasi mengenai opsi layanan yang ditawarkan oleh masing-masing penyedia logistik, seperti reguler, ekspres, atau ekonomi. Dengan entitas ini, sistem dapat menampilkan pilihan layanan pengiriman yang tersedia bagi pembeli saat melakukan checkout, memudahkan pembeli memilih layanan sesuai kebutuhan, dan membantu mengelola hubungan antara pesanan dan penyedia logistik secara terstruktur.

| Atribut                 | Lebar data | Tipe data | Keterangan                  |
| ----------------------- | ---------- | --------- | --------------------------- |
| id_layanan_pengiriman   |            | int       | PK (*auto increment*)       |
| id_logistik             |            | int       | FK (logistik . id_logistik) |
| nama_layanan            | 20         | varchar   |                             |
| minimal_jarak           |            | float     |                             |
| harga_per_km            |            | float     |                             |
| harga_per_kg            |            | float     |                             |
| estimasi_perhari_tempuh |            | int       |                             |

## 2.22 | Entitas Detail Pengiriman

Entitas Detail Pengiriman digunakan untuk menyimpan informasi rinci mengenai pengiriman setiap pemesanan. Entitas ini mencakup data terkait layanan pengiriman yang dipilih, jarak tempuh, biaya berdasarkan jarak dan berat, total biaya pengiriman, serta estimasi waktu tiba. Dengan adanya entitas ini, sistem dapat mengelola proses pengiriman secara lebih terstruktur, menghitung biaya pengiriman dengan akurat, dan mendukung pemantauan status pengiriman bagi setiap pesanan.

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


Untuk pengisian entitas diatas, didasarkan pada perkiraan rumus berikut:

1. `Jarak tempuh` didapat dari menghitung jarak dari `alamat pembeli` dan `penerima`. 
2. Harga tempuh didapat dari perhitunga `per km` layanan pengiriman dengan `jarak tempuh`.
3. Harga berat didapat dari perhitungan `harga per kg` layanan dikali dengan `berat total produk`.
4. `Total` didapat dari menambahkan hasil dari `harga tempuh` + `harga berat`. 
5. `Estimasi hari` didapat dengan membagi jarak tempuh dengan `estimasi_perhari_tempuh` yang dibulatkan ke atas. 

