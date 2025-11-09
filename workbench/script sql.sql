show databases;
create database marketplace;
use marketplace;
show tables;

# ======>>> PENGGUNA
# table pengguna
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

# table bank
create table bank(
	id_bank int primary key not null auto_increment,
    nama_bank varchar(30),
    kode_bank varchar(10) unique
);
desc bank;

# table rekening 
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
# <<<======


# ======>>> PEMBELI
# table pembeli
create table pembeli(
	id_user int primary key not null auto_increment,
    level_pembeli enum('bronze', 'silver', 'gold', 'platinum') default 'bronze',
    total_transaksi int,
    poin_reward int,
    saldo int,
    foreign key (id_user) references pengguna(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc pembeli;

# table alamat_pembeli
create table alamat_pembeli (
	id_alamat int primary key not null auto_increment,
    id_pembeli int not null,
    nama_penerima varchar(100),
    no_hp_penerima varchar(15) unique,
    label_alamat varchar(30),
    detail_alamat text,
    kota varchar(50),
    kode_pos varchar(10) unique,
    is_utama boolean default false,
    foreign key (id_pembeli) references pembeli(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc alamat_pembeli;

# SEMENTARA
SHOW CREATE TABLE alamat_pembeli;

alter table alamat_pembeli
	drop foreign key alamat_pembeli_ibfk_1;
# SEMENTARA

# table wishlist
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

# table toko_favorit
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



# >>>====== PENJUAL
# table penjual
create table penjual(
	id_user int primary key not null auto_increment,
    nama_toko varchar(30) unique,
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

# table alamat_penjual
create table alamat_penjual(
	id_alamat int primary key not null auto_increment,
    id_penjual int not null,
    nama_gudang varchar(50),
    detail_alamat text,
    kota varchar(50),
    kode_pos varchar(10) unique,
    is_utama boolean default false,
    foreign key (id_penjual) references penjual(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc alamat_penjual;


# >>>====== VOUCHER
# table voucher_platform
create table voucher_platform(
	id_voucher_platform varchar(10) primary key not null,
    nama_voucher varchar(30),
    deskripsi varchar(200),
    tipe_voucher enum('persen','nominal'),
    value int,
    min_value int,
    status enum('aktif','nonaktif'),
    start_date datetime,
    end_date datetime
);
desc voucher_platform;

# table voucher_penjual
create table voucher_penjual(
	id_voucher_penjual varchar(10) primary key not null,
    id_penjual int not null,
    nama_voucher varchar(30),
    deskripsi varchar(200),
    tipe_voucher enum('persen', 'nominal'),
    value int,
    min_value int, 
    status enum('aktif','nonaktif'),
    start_date datetime,
    end_date datetime,
    foreign key (id_penjual) references penjual(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc voucher_penjual;

# table voucher_terpakai
create table voucher_terpakai(
	id_voucher_terpakai int primary key not null auto_increment,
    id_pembeli int not null,
    kategori_voucher enum('platform', 'penjual'),
    voucher_ref_id varchar(10) not null,
    tanggal_pakai datetime,
    foreign key (voucher_ref_id) references voucher_platform(id_voucher_platform)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (voucher_ref_id) references voucher_penjual(id_voucher_penjual)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc voucher_terpakai;


# >>>====== PRODUK
create table produk(
	id_produk int primary key not null auto_increment,
    id_penjual int not null,
    id_kategori varchar(5) not null
);

# table kategori
create table kategori(
	id_kategori int primary key not null auto_increment,
    nama_kategori varchar(15),
    id_kategori_induk int,
    foreign key (id_kategori_induk) references kategori(id_kategori)
);
desc kategori;

# table produk
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

# table varian
create table varian(
	id_varian int primary key not null auto_increment,
    id_produk int not null,
    nama_varian varchar(50),
    sku varchar(50) unique,
    harga int,
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

# table produk_media
create table produk_media(
	id_media_produk int primary key not null auto_increment,
    id_produk int not null,
    url_medua varchar(255),
    tipe_media enum('gambar', 'video'),
    no_urut int,
    is_thumbnail boolean,
    alt_text varchar(50),
    foreign key (id_produk) references produk(id_produk)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc produk_media;

# table ulasan
create table ulasan(
	id_ulasan int not null primary key auto_increment,
    id_produk int not null,
    id_pembeli int not null,
    rating int,
    komentar text,
    tanggal_ulasan datetime,
    jumlah_like int,
    jumlah_media int,
    foreign key (id_produk) references produk(id_produk)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_pembeli) references pembeli(id_user)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc ulasan;

# table ulasan_media
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

# >>>===== TRANSAKSI
# table pemesanan
create table pemesanan(
	id_pemesanan int not null primary key auto_increment,
    id_pembeli int not null,
    id_penjual int not null,
    id_alamat_penjual int not null,
    id_alamat_pembeli int not null,
    id_detail_pengiriman int not null,
    date_pesan datetime,
    catatan_pembeli varchar(200),
    metode_pembayaran enum('transfer', 'cod'),
    tagihan_produk int,
    ongkos_kirim int,
    harga_total int,
    status enum('menunggu_bayar','diproses','dikirim','selesai','dibatalkan','dikembalikan')
);
desc pemesanan;

# edit alter table
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

# table pemesanan_voucher
create table pemesanan_voucher(
	id_pemesanan int not null,
    id_voucher_terpakai int not null,
    potongan_diterapkan int,
    foreign key (id_pemesanan) references pemesanan(id_pemesanan)
		ON DELETE CASCADE 
        ON UPDATE CASCADE,
	foreign key (id_voucher_terpakai) references voucher_terpakai(id_voucher_terpakai)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc pemesanan_voucher;

# table detail_pemesanan
create table detail_pemesanan(
	id_pemesanan int not null,
    id_produk int not null,
    id_varian int not null,
    kuantitas int,
    harga_satuan int,
    subtotal_item int,
    foreign key (id_pemesanan) references pemesanan(id_pemesanan),
    foreign key(id_produk) references produk(id_produk),
    foreign key (id_varian) references varian(id_varian)
);
desc detail_pemesanan;

# >>>====== PENGIRIMAN
# table logistik
create table logistik(
	id_logistik int not null primary key auto_increment,
    kode_logistik varchar(10),
    nama_logistik varchar(20),
    kontak_cs varchar(15),
    status enum('aktif', 'nonaktif'),
    keterangan text
);
desc logistik;

# table layanan_pengiriman
create table layanan_pengiriman(
	id_layanan_pengiriman int not null primary key auto_increment,
    id_logistik int not null,
    nama_layanan varchar(30),
    minimal_jarak float,
    harga_per_km float,
    harga_per_kg float,
    estimasi_perhari_tempuh int,
    foreign key (id_logistik) references logistik(id_logistik)
		ON DELETE CASCADE 
        ON UPDATE CASCADE
);
desc layanan_pengiriman;

# table detail_pengiriman
create table detail_pengiriman(
	id_detail_pengiriman int primary key not null auto_increment,
    id_pemesanan int not null,
    id_layanan int not null,
    jarak_tempuh int,
    harga_tempuh float,
    harga_berat float,
    total int,
    estimasi_hari int,
    foreign key (id_pemesanan) references pemesanan(id_pemesanan),
    foreign key(id_layanan) references layanan_pengiriman(id_layanan_pengiriman)
);
desc detail_pengiriman;
