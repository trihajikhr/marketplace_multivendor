---
obsidianUIMode: preview
---
---
1. Aku mengikuti tutorial install dari duniailkom cara install mysql, tapi aku menginstall semua paket yang ada.

2. Setelah itu, aku install dan pasang di directori custom, yaitu directory D.

3. Untuk menjalankan, karena tidak menggunakan xampp, maka digunakan cara manual sebaga berikut:

- Masuk ke lokasi Mysql server 8.0, lalu masuk ke folder bin. Pastikan disana ada file bernama `mysqld.exe`.
- Seelah itu, ketika baru pertama install, maka perlu didaftarkan di new service, caranya adalah menjalankan `mysqld.exe` dengan pengaturna `my.ini` yang berada di folder mysql data, contohnya seperti ini:

```bash
"D:\MySQL\MySQL Server 8.0\bin\mysqld.exe" --install MySQL80 --defaults-file="D:\MySQL\MySQL Data\MySQL Server 8.0\my.ini"
```

Jalakan perintah diatas dengan menggunakan cmd mode administrator, hingga mucul notifikasi sebagai berikut:

```bash
Service successfully installed.
```

Setelah berhasil, jalnakn windwos Run dan masukan `services.msc`, lalu cari `MySQL80`, jika sudah ada, maka services siap digunakan!

Jika sudah ada, maka jalankan dengan mengetikan:

```bash
net start mysql
```

atau:

```bash
net start MySQL80
```

> Ganti sesuai dengan nama services.

Dan jika ingin menghentikan services, bisa mengetikan perintah berikut:

```bash
net stop MySQL80
```

Sehingga akan muncul pesan sebagai berikut:

```bash
The MySQL80 service was stopped successfully.
```