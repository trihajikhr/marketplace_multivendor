# 1 | History Syntax

Menyalakan MySQL server:

```bash
net start MySQL80
```

Masuk ke MySQL client, dengan cara masukan password berikut:

```bash
Mysql#Server14
```

Menampilkan semua database:

```sql
show databases;
```

Menggunakan database tertentu:

```sql
use nama_database;
```

## 1. 2 | SQL table 
Melihat daftar table:

```sql
SHOW TABLES;
```

Membuat table:

```sql
CREATE TABLE nama_table();
```

Merubah atribut menjadi NOT NULL:

```sql
ALTER TABLE nama_table
	MODIFY atribut1 tipedata(length) NOT NULL,
	MODIFY atribut2 tipedata(length) NOT NULL;
```
# Membuat table

1. Membuat table pengguna:

```sql
CREATE TABLE pengguna(
    id_user varchar(10) NOT NULL PRIMARY KEY,
    email varchar(50) NOT NULL,
    password varchar(20) NOT NULL,
    nama_lengkap varchar(50),
    no_hp varchar(15),
    id_alamat varchar(10) NOT NULL,
    tanggal_lahir date,
    tanggal_regis date,
    status_akun enum('aktif', 'nonaktif', 'blokir'),
    token_reset varchar(70));
```

2. Membuat table pembeli (sub-entitas):

```sql
CREATE TABLE pembeli(
	id_user varchar(10) NOT NULL,
	level_pembeli enum('silver', 'gold', 'platinum', 'diamond'),
	poin_reward int);
```

3. Membuat table penjual:

```sql
CREATE TABLE penjual(
	id_user varchar(10) NOT NULL,
	nama_toko varchar(10) NOT NULL,
	deskripsi_toko text,
	rerata_rating float,
	url_toko varchar(200) NOT NULL,
	status_verifikasi enum('aktif', 'nonaktif', 'proses'),
	rekening_bank varchar(20));
```

4. Membuat table alamat:

```sql
CREATE TABLE alamat (
	id_alamat varchar(10) NOT NULL PRIMARY KEY,
	is_user varchar(10) NOT NULL,
	nama_penerima varchar(50) NOT NULL,
	no_hp_penerima varchar(15) NOT NULL,
	label_alamat varchar(25) NOT NULL,
	jalan varchar(25),
	kelurahan varchar(25),
	kecamatan varchar(25),
	kota varchar(25),
	provinsi varchar(25),
	kode_pos varchar(10),
	is_utama boolean);
```

5. Membuat table produk:

```sql
CREATE TABLE produk (
	id_produk varchar(10) NOT NULL PRIMARY KEY,
	id_penjual varchar(10) NOT NULL,
	id_kategori varchar(10) NOT NULL,
	nama_produk varchar(30) NOT NULL,
	deskripsi text,
	harga int,
	berat double,
	status_jual enum('aktif', 'draft', 'habis'),
	tanggal_dibuat datetime);
```

6. Membuat table kategori:

```sql
CREATE TABLE kategori (
	id_kategori varchar(10) NOT NULL PRIMARY KEY,
	nama_kategori varchar(15) NOT NULL,
	id_kategori_induk varchar(10));
```

7. Membuat table varian:

```sql
CREATE TABLE varian (
	id_varian varchar(10) NOT NULL PRIMARY KEY,
	id_produk varchar(10) NOT NULL,
	SKU varchar(50) NOT NULL UNIQUE,
	stok int,
	harga_tambah int,
	status_ketersediaan enum('tersedia', 'habis'));
```

8. Membuat table gambar:

```sql
CREATE TABLE gambar (
	id_gambar varchar(10) NOT NULL PRIMARY KEY,
	id_produk varchar(10) NOT NULL,
	url_gambar varchar(250) NOT NULL,
	urutan int NOT NULL,
	is_thumbnail boolean,
	alt_text varchar(20));
```

9. Membuat table ulasan:

```sql
CREATE TABLE ulasan (
	id_produk varchar(10) NOT NULL,
	id_penjual varchar(10) NOT NULL,
	id_pembeli varchar(10) NOT NULL,
	is_terkirim boolean,
	rating float,
	komentar varchar(200),
	tanggal date);
```

10. Membuat table wishlist:

```sql
CREATE TABLE wishlist (
	id_pembeli varchar(10) NOT NULL,
	id_produk varchar(10) NOT NULL,
	tanggal_tambah datetime,
	PRIMARY KEY (id_pembeli, id_produk));
```

11. Membuatt table pemesanan:

```sql
CREATE TABLE pemesanan (
	id_pemesanan varchar(10) NOT NULL PRIMARY KEY,
	id_pembeli varchar(10) NOT NULL,
	id_penjual varchar(10) NOT NULL,
	id_alamat_pembeli varchar(10) NOT NULL,
	date_pesan datetime,
	id_pengiriman varchar(10) NOT NULL,
	catatan_pembeli varchar(200),
	metode_pembayaran enum('transfer', 'cod', 'kredit'),
	total_tagihan int,
	status ENUM('MENUNGGU_PEMBAYARAN', 'DIBATALKAN', 'MENUNGGU_KONFIRMASI_PEMBAYARAN', 'DIBAYAR', 'DIPROSES', 'DIKIRIM', 'TERKIRIM', 'SELESAI', 'PENGEMBALIAN_DANA') NOT NULL);
```


12. Membuat table detail pemesanan:

```sql
CREATE TABLE detail_pemesanan (
	id_pemesanan varchar(10) NOT NULL,
	id_produk varchar(10) NOT NULL,
	id_varian varchar(10) NOT NULL,
	kuantitas int,
	harga_satuan int,
	subtotal_item int);
```