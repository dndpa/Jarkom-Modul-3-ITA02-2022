# Jarkom-Modul-3-ITA02-2022

## Hasil Pengerjaan Modul 1 Praktikum Komunikasi Data & Jaringan Komputer 2022

Anggota Kelompok ITA02:
1. Muhammad Faris Anwari (5027201008)
2. Calvindra Laksmono Kumoro (5027201020)
3. Adinda Putri Audyna (5027201073)

Dibuat topologi seperti berikut ini:
![image](https://user-images.githubusercontent.com/58323466/200594801-5f4b654c-329a-4687-ad4f-f77dfb8d0674.png)


### Ini foto screenshot
dhcp relay di ostania
![image](https://user-images.githubusercontent.com/58323466/200593809-a5c8e3ba-1b92-4e4f-bf5d-74280e9b7475.png)

soal 3-4-5-6
![image](https://user-images.githubusercontent.com/58323466/200594157-b4a4b8d0-4eb8-494d-9897-d6bc04214beb.png)

node WISE (DNS server), nano /etc/bind/named.conf.options
![image](https://user-images.githubusercontent.com/58323466/200594257-c5e530b7-c85a-49d8-8a6b-f1c3eba76364.png)

bukti dhcp berhasil di node sss (switch 1), ipnya udh sesuai kriteria 
![image](https://user-images.githubusercontent.com/58323466/200594368-f3e837b2-8d80-46a1-a847-76a70738f8de.png)

bukti dhcp berhasil di node eden (switch 3), ipnya udh sesuai kriteria
![image](https://user-images.githubusercontent.com/58323466/200594536-85e95d27-9f3b-4e7c-b3fe-c91807320cee.png)

fixed address di eden no 7
![image](https://user-images.githubusercontent.com/58323466/200594604-2c54f43e-ccd7-4ab7-a684-289a598cf0f4.png)




### Soal No 1
Loid bersama Franky berencana membuat peta tersebut dengan kriteria WISE sebagai DNS Server, Westalis sebagai DHCP Server, Berlint sebagai Proxy Server (1).

### Jawaban No 1
Pertama pada bagian Wise kita dapat lihat pada cat /etc/dhcp/dhcpd.conf. Dan terdapat ![user.txt](./img/1b.JPG), disitu dapat dilihat  pada option domain-name-servers 192.211.2.2 itu mengarah ke wise karena diminta wise sebagai DNS server
    Pada web console westalis, kita dapat membuat westalis menjadi DHCP Server dengan masukkan terlebih dahulu nano westalis.sh
![user.txt](./img/1a.JPG), kita perlu pastikan kita sudah menginstall dhcp server dan sudah melakukan config terlebih dahulu pada westalis
    Kemudian kita bisa melihat isi dari file tersebut dengan memasukkan cat etc/default/isc-dhcp-server. Bisa dilihat bahwa sudah terisi dengan syntax dan ada f0, dan adanya f0 karena westalis mengakses dari f0 dan yang lain.
Selanjutnya kita juga bisa cek isi file yang lain dengan cat /etc/dhcp/dhcpd.conf, kita perlu membaca syarat-syarat yang diminta oleh soal, yaitu yang terdapat pada nomor 3
    


### Soal No 2
dan Ostania sebagai DHCP Relay (2).


### Jawaban No 2
Kita memasukkan beberapa perintah dan syarat  agar Ostania bisa menjadi DHCP Relay, yaitu kita perlu melakukan konfigurasi terlebih dahulu pada Ostania kemudian melakukan apt-get update -y, apt-get install nano -y, iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.217.0.0/16, setelah itu apt-get install isc-dhcp-relay -y, dan service isc-dhcp-relay restart


### Soal No 3
Loid dan Franky menyusun peta tersebut dengan hati-hati dan teliti. Ada beberapa kriteria yang ingin dibuat oleh Loid dan Franky, yaitu:
1. Semua client yang ada HARUS menggunakan konfigurasi IP dari DHCP Server.
2. Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.50 - [prefix IP].1.88 dan [prefix IP].1.120 - [prefix IP].1.155 (3).

### Jawaban No 3
1. Semua client yang ada harus menggunakan konfigurasi IP dan DHCP Server, kita ambil contoh pada SSS. Kemudian kita perlu ubah di cat /etc/network/interfaces 
2. Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.50 - [prefix IP].1.88 dan [prefix IP].1.120 - [prefix IP].1.155. Bisa kita lihat melalui cat /etc/dhcp/dhcpd.conf pada web console westalis
    ![user.txt](./img/3a.JPG), kita atur subnet 192.211.1.0 merupakan semua yang diatur dalam switch 1.


### Soal No 4
Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.10 - [prefix IP].3.30 dan [prefix IP].3.60 - [prefix IP].3.85 (4).

### Jawaban No 4
Tambahkan ketentuan berikut ini pada file /etc/dhcp/dhcp.conf dengan command `cat  /etc/dhcp/dhcp.conf` di web console westalis:
1. Atur subnet 192.211.3.0 (berarti semua yg diatur di switch 3)
2. Atur range 192.211.3.10 sampai 192.211.3.30 dan 192.211.3.60 sampai 192.211.3.85 sesuai perintah soal
3. Atur options routersnya 192.211.3.1 karna itu merupakan address ke switch 3
4. Atur options broadcast-address 192.211.3.255 karna dalam 1 oktet paling besar 255

<img width="379" alt="image" src="https://user-images.githubusercontent.com/58323466/201472673-200f05e6-9845-43e7-98ca-7310e8a3c3a7.png">


### Soal No 5
Client mendapatkan DNS dari WISE dan client dapat terhubung dengan internet melalui DNS tersebut (5).

### Jawaban No 5
Tambahkan ketentuan berikut ini pada file /etc/dhcp/dhcp.conf dengan command `cat  /etc/dhcp/dhcp.conf` di web console westalis:
1. Atur option domain-name-servers 192.211.2.2 sehingga client mendapatkan DNS dari WISE dan client dapat terhubung dengan internet melalui DNS tersebut

<img width="354" alt="image" src="https://user-images.githubusercontent.com/58323466/201473419-9a40481a-7dab-411e-b0b0-75f82a42de5b.png">


### Soal No 6
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 5 menit sedangkan pada client yang melalui Switch3 selama 10 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 115 menit (6).

### Jawaban No 6
Tambahkan ketentuan berikut ini pada file /etc/dhcp/dhcp.conf dengan command `cat  /etc/dhcp/dhcp.conf` di web console westalis:
1. Atur default-lease-time 600 karna diminta client yang melalui Switch3 selama 10 menit (sama dengan 600 detik) 
2. Atur max-lease-time 6900 karna waktu maksimalnya 115 menit (sama dengan 6900 detik)


<img width="217" alt="image" src="https://user-images.githubusercontent.com/58323466/201473507-5893160a-e45f-41bf-919d-81bfb4fcd75a.png">

Jadi kurang lebih isi dari file `/etc/dhcp/dhcp.conf` pada web console westalis adalah sebagai berikut:

![image](https://user-images.githubusercontent.com/58323466/201473543-6ed8474a-b3bc-48a1-84e2-e26f2f340dea.png)



### Soal No 7
Loid dan Franky berencana menjadikan Eden sebagai server untuk pertukaran informasi dengan alamat IP yang tetap dengan IP [prefix IP].3.13 (7).

### Jawaban No 7
blabla


### Soal No 8
SSS, Garden, dan Eden digunakan sebagai client Proxy agar pertukaran informasi dapat terjamin keamanannya, juga untuk mencegah kebocoran data.
Pada Proxy Server di Berlint, Loid berencana untuk mengatur bagaimana Client dapat mengakses internet. Artinya setiap client harus menggunakan Berlint sebagai HTTP & HTTPS proxy. Adapun kriteria pengaturannya adalah sebagai berikut:
1. Client hanya dapat mengakses internet diluar (selain) hari & jam kerja (senin-jumat 08.00 - 17.00) dan hari libur (dapat mengakses 24 jam penuh)
2. Adapun pada hari dan jam kerja sesuai nomor (1), client hanya dapat mengakses domain loid-work.com dan franky-work.com (IP tujuan domain dibebaskan)
3. Saat akses internet dibuka, client dilarang untuk mengakses web tanpa HTTPS. (Contoh web HTTP: http://example.com)
4. Agar menghemat penggunaan, akses internet dibatasi dengan kecepatan maksimum 128 Kbps pada setiap host (Kbps = kilobit per second; lakukan pengecekan pada tiap host, ketika 2 host akses internet pada saat bersamaan, keduanya mendapatkan speed maksimal yaitu 128 Kbps)
5. Setelah diterapkan, ternyata peraturan nomor (4) mengganggu produktifitas saat hari kerja, dengan demikian pembatasan kecepatan hanya diberlakukan untuk pengaksesan internet pada hari libur

Setelah proxy Berlint diatur oleh Loid, dia melakukan pengujian dan mendapatkan hasil sesuai tabel berikut:
<img width="484" alt="image" src="https://user-images.githubusercontent.com/58323466/200575906-a6228192-44de-412e-bbf2-d6d35908a73c.png">


### Jawaban No 8
blabla
