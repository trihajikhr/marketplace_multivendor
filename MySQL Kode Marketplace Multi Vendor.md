---
obsidianUIMode: preview
---

---
# Marketplace Multi Vendor

Untuk kemudahan proses pembuatan database, maka pembuatan table akan didasarkan pada table tanpa FK terlabih dahulu.

## 1 | Table Pengguna

```sql
# 1 | table pengguna
create table pengguna (
	id_user int primary key not null auto_increment,
    email varchar(50) unique key,
    password varchar(255),
    nama_lengkap varchar(50),
    no_hp varchar(15) unique,
    tanggal_lahir date,
    tanggal_regis datetime,
    status_akun enum('aktif', 'nonaktif','ban') default 'nonaktif',
    token_reset varchar(70)
);
desc pengguna;
```

## 2 | Table Bank

```sql
# 2 | table bank
create table bank(
	id_bank int primary key not null auto_increment,
    nama_bank varchar(30),
    kode_bank varchar(10) unique
);
desc bank;
```

## 3 | Table Rekening

```sql
# 3 | table rekening 
create table rekening(
	id_rekening int primary key not null auto_increment,
    id_user int not null,
    id_bank int not null,
    no_rekening varchar(20) unique,
    nama_pemilik varchar(50),
    status_utama boolean default false,
    foreign key (id_user) references pengguna(id_user) 
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
    foreign key (id_bank) references bank(id_bank) 
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc rekening;
```

## 4 | Table Alamat

```sql
# 4 | table alamat
create table alamat (
	id_alamat int primary key not null auto_increment,
    id_user int not null,
    label_alamat varchar(50),
    tipe_alamat enum('pembeli', 'penjual'),
    nama_penerima varchar(100),
    no_hp_penerima varchar(15) unique,
    detail_alamat text,
    kota varchar(30),
    kode_pos varchar(10),
    is_utama boolean default false,
    foreign key (id_user) references pengguna(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc alamat;
```


## 5 | Table Pembeli


```sql
# 5 | table pembeli
create table pembeli(
	id_user int primary key not null auto_increment,
    level_pembeli enum('bronze', 'silver', 'gold', 'platinum') default 'bronze',
    total_transaksi int,
    poin_reward int,
    saldo decimal(15,2),
    foreign key (id_user) references pengguna(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc pembeli;
```


## 6 | Table Penjual

```sql
# 6 | table penjual
create table penjual(
	id_user int primary key not null auto_increment,
    nama_toko varchar(20) unique,
    deskripsi_toko text,
    rerata_rating float,
    jumlah_produk int,
    url_toko varchar(200),
    tipe_toko enum('biasa', 'partner' , 'official'),
    status_verifikasi enum('belum','proses','verif','ditolak'),
    foreign key (id_user) references pengguna(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc penjual;
```

## 7 | Table Voucher Platform

```sql
# 7 | table voucher_platform
create table voucher_platform(
	id_voucher_platform int primary key not null auto_increment,
    nama_voucher varchar(30),
    deskripsi varchar(200),
    tipe_voucher enum('persen','nominal'),
    value decimal(15,2),
    min_value decimal(15,2),
    status enum('aktif','nonaktif'),
    start_date datetime,
    end_date datetime
);
desc voucher_platform;
```


## 8 | Table Voucher Penjual

```sql
# 8 | table voucher_penjual
create table voucher_penjual(
	id_voucher_penjual varchar(10) primary key not null,
    id_penjual int not null,
    nama_voucher varchar(30),
    deskripsi varchar(200),
    tipe_voucher enum('persen', 'nominal'),
    value decimal(15,2),
    min_value decimal(15,2), 
    status enum('aktif','nonaktif'),
    start_date datetime,
    end_date datetime,
    foreign key (id_penjual) references penjual(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc voucher_penjual;
```


## 9 | Table Toko Favorit

```sql
# 9 | table toko_favorit
create table toko_favorit(
	id_pembeli int not null,
    id_penjual int not null,
    tanggal_tambah datetime,
    foreign key (id_pembeli) references pembeli(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_penjual) references penjual(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc toko_favorit;
```


## 10 | Table Voucher Terpakai

```sql
# 10 | table voucher_terpakai
create table voucher_terpakai(
	id_voucher_terpakai int primary key not null auto_increment,
    id_pembeli int not null,
    kategori_voucher enum('platform', 'penjual'),
    id_voucher_platform int not null,
    id_voucher_penjual int not null,
    tanggal_pakai datetime,
    foreign key (id_voucher_platform) references voucher_platform(id_voucher_platform)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_voucher_penjual) references voucher_penjual(id_voucher_penjual)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc voucher_terpakai;
```

## 11 | Table Kategori

```sql
# 11 | table kategori
create table kategori(
	id_kategori int primary key not null auto_increment,
    nama_kategori varchar(15),
    id_kategori_induk int,
    foreign key (id_kategori_induk) references kategori(id_kategori)
);
desc kategori;
```

## 12 | Table Produk

```sql
# 12 | table produk
create table produk(
	id_produk int primary key not null auto_increment,
    id_penjual int not null,
    id_kategori int not null,
    nama_produk varchar(50),
    deskripsi text,
    rerata_rating float,
    jumlah_dibeli int,
    status_jual enum('aktif','nonaktif','draft','habis') default 'draft',
    tanggal_dibuat datetime,
    tanggal_diperbarui datetime,
    foreign key (id_penjual) references penjual(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_kategori) references kategori(id_kategori)
);
desc produk;
```

## 13 | Table Varian

```sql
# 13 | table varian
create table varian(
	id_varian int primary key not null auto_increment,
    id_produk int not null,
    nama_varian varchar(50),
    sku varchar(50) unique,
    harga decimal(15,2),
    stok int,
    berat float,
    status enum('aktif', 'nonaktif'),
    tanggal_dibuat datetime,
    tanggal_diperbarui datetime,
    foreign key (id_produk) references produk(id_produk)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc varian;
```


## 14 | Table Produk Media

```sql
# 14 | table produk_media
create table produk_media(
	id_media_produk int primary key not null auto_increment,
    id_produk int not null,
    url_media varchar(255),
    tipe_media enum('gambar', 'video'),
    no_urut int,
    is_thumbnail boolean,
    alt_text varchar(50),
    foreign key (id_produk) references produk(id_produk)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc produk_media;
```

## 15 | Table Ulasan

```sql
# 15 | table ulasan
create table ulasan(
	id_ulasan int not null primary key auto_increment,
    id_produk int not null,
    id_pembeli int not null,
    rating int,
    komentar text,
    tanggal_ulasan datetime,
    foreign key (id_produk) references produk(id_produk)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_pembeli) references pembeli(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc ulasan;
```

## 16 | Table Ulasan Media

```sql
# 16 | table ulasan_media
create table ulasan_media(
	id_media int not null primary key auto_increment,
    id_ulasan int not null,
    url_media varchar(250),
    tipe_media enum('gambar', 'video'),
    urutan int,
    foreign key (id_ulasan) references ulasan(id_ulasan)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc ulasan_media;
```

## 17 | Table Logistik

```sql
# 17 | table logistik
create table logistik(
	id_logistik int not null primary key auto_increment,
    kode_logistik varchar(10),
    nama_logistik varchar(20),
    kontak_cs varchar(15),
    status enum('aktif', 'nonaktif'),
    keterangan text
);
desc logistik;
```

## 18 | Table Layanan Pengiriman

```sql
# 18 | table layanan_pengiriman
create table layanan_pengiriman(
	id_layanan_pengiriman int not null primary key auto_increment,
    id_logistik int not null,
    nama_layanan varchar(30),
    minimal_jarak float,
    harga_per_km decimal(15,2),
    harga_per_kg decimal(15,2),
    estimasi_perhari_tempuh int,
    foreign key (id_logistik) references logistik(id_logistik)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc layanan_pengiriman;
```

## 19 | Table Wishlist

```sql
# 19 | table wishlist
create table wishlist(
	id_pembeli int not null,
    id_produk int not null,
    tanggal_tambah datetime,
    foreign key (id_pembeli) references pembeli(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_produk) references produk(id_produk)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc wishlist;
```

## 20 | Table Pemesanan

```sql
# 20 | table pemesanan
create table pemesanan(
	id_pemesanan int not null primary key auto_increment,
    id_pembeli int not null,
    id_penjual int not null,
    id_alamat_pembeli int not null,
    id_alamat_penjual int not null,
    id_voucher_terpakai int,
    tanggal_pemesanan datetime,
    catatan_pembeli varchar(200),
    metode_pembayaran enum('transfer', 'cod'),
    tagihan_produk decimal(15,2),
    ongkos_kirim decimal(15,2),
    harga_total decimal(15,2),
    status enum('menunggu_bayar','diproses','dikirim','selesai','dibatalkan','dikembalikan'),
    foreign key (id_pembeli) references pembeli(id_user),
    foreign key (id_penjual) references penjual(id_user),
    foreign key (id_alamat_pembeli) references alamat(id_alamat),
    foreign key (id_alamat_penjual) references alamat(id_alamat),
    foreign key (id_voucher_terpakai) references voucher_terpakai(id_voucher_terpakai)
);
desc pemesanan;
```


## 21 | Table Detail Pemesanan

```sql
# 21 | table detail_pemesanan
create table detail_pemesanan(
	id_pemesanan int not null,
    id_produk int not null,
    id_varian int not null,
    kuantitas int,
    harga_satuan decimal(15,2),
    subtotal_item decimal(15,2),
    foreign key (id_pemesanan) references pemesanan(id_pemesanan),
    foreign key(id_produk) references produk(id_produk),
    foreign key (id_varian) references varian(id_varian)
);
desc detail_pemesanan;
```

## 22 | Table Detail Pengiriman

```sql
# 22 | table detail_pengiriman
create table detail_pengiriman(
	id_detail_pengiriman int primary key not null auto_increment,
    id_pemesanan int not null,
    id_layanan int not null,
    jarak_tempuh int,
    harga_tempuh decimal(15,2),
    harga_berat decimal(15,2),
    total decimal(15,2),
    estimasi_hari int,
    foreign key (id_pemesanan) references pemesanan(id_pemesanan),
    foreign key(id_layanan) references layanan_pengiriman(id_layanan_pengiriman)
);
desc detail_pengiriman;
```


---
# Informasi Tambaha
Untuk membuat suatu atribut menjadi Foreign key, bisa menggunakan contoh syntax seperti berikut:

```sql
alter table pemesanan add constraint fk_pemesanan_pembeli
	foreign key (id_pembeli) references pembeli(id_user);

alter table pemesanan add constraint fk_pemesanan_penjual
	foreign key (id_penjual) references penjual(id_user);

alter table pemesanan add constraint fk_pemesanan_alamat_penjual
	foreign key (id_alamat_penjual) references alamat_penjual(id_alamat);
    
alter table pemesanan add constraint fk_pemesanan_alamat_pembeli
	foreign key (id_alamat_pembeli) references alamat_pembeli(id_alamat);
    
alter table pemesanan add constraint fk_pemesanan_detail_pengiriman
	foreign key (id_detail_pengiriman) references detail_pengiriman(id_detail_pengiriman);
```

Cara hapus hubungan foreign key jika nama constraint diketaui:

```sql
ALTER TABLE nama_tabel
DROP FOREIGN KEY nama_constraint;
```

Jika constraint tidak diketahui:

```sql
SHOW CREATE TABLE pemesanan;
```

Ini akan menghasilkan constraint generate otomatis yang dibuat oleh sql. Jadi kita ambil saja nama yang sesuai, dan:

```sql
ALTER TABLE pemesanan
DROP FOREIGN KEY pemesanan_ibfk_1;
```