# Promo Scraper Line Bot (Prototype)

## Prequisites:
- Ruby 2.4.4 <br>
- Rails

## Description

Nama: Adyaksa Wisanggeni

NIM: 16517351


Projek ini dibuat untuk menyelesaikan tugas SPARTA tentang pembuatan karya

Website ini didesain sebagai webhook yang akan mengirimkan latest promo ke line bot. Untuk saat ini, page yang discrape oleh program ini hanya dari `https://www.tokopedia.com/promo/`.

## Screenshot

![alt text](screenshots/image1.jpg)
![alt text](screenshots/image2.jpg)

## Use

1. Download program
2. Setup environment variable yang dibutuhkan, yaitu
```
channel_secret = ENV["LINE_BOT_CHANNEL_SECRET"]
channel_token = ENV["LINE_BOT_CHANNEL_TOKEN"]
```
3. Atur setting di line console agar mengirimkan webhook ke `/callback`
4. Upload ke hosting yang diinginkan
5. Jalankan program

## Command

Program ini hanya memiliki 1 command, yaitu `!update` untuk mengupdate promo baru dan mengirimkannya ke user. Tipe image yang disupport adalah `.jpg`, sehingga jika image dari promo menggunakan tipe `.png`, bot tidak akan mengeluarkan image tersebut. Penggunaan bot hanya diperbolehkan dengan mengirimkan command `!update` melalui personal message


