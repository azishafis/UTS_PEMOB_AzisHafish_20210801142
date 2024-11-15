# Sistem Informasi Geografis Desa
Aplikasi Sistem Informasi Geografis Desa ini dibangun menggunakan Flutter dan OpenStreetMap untuk menyediakan informasi geospasial mengenai lokasi desa-desa yang ada. Aplikasi ini memungkinkan pengguna untuk melihat peta desa, memperbesar dan memperkecil peta, serta memilih desa dari daftar untuk memindahkan peta ke lokasi desa yang dipilih.

# Fitur Utama
Peta Interaktif: Menggunakan OpenStreetMap untuk menampilkan peta desa dengan kemampuan zoom in dan zoom out.
Daftar Desa: Menampilkan daftar desa yang disertai dengan informasi lokasi (koordinat latitude dan longitude).
Navigasi Antar Layar: Menggunakan BottomNavigationBar untuk berpindah antara layar Daftar Desa dan Peta Desa.
Fitur Pindah Lokasi: Memilih desa dari daftar desa akan memindahkan peta ke lokasi yang dipilih secara otomatis.
Zoom: Pengguna dapat memperbesar dan memperkecil tampilan peta dengan tombol zoom.
# Teknologi
Flutter: Framework untuk pengembangan aplikasi lintas platform.
flutter_map: Package Flutter untuk integrasi dengan OpenStreetMap.
latlong2: Library untuk mengelola koordinat geografis (latitude, longitude).
OpenStreetMap: Penyedia peta gratis yang digunakan untuk menampilkan peta dalam aplikasi.
