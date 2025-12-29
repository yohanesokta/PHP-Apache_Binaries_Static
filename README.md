# php-apache static binaries

[![Releases](https://img.shields.io/packagist/v/crazywhalecc/static-php-cli?include_prereleases&label=Release&style=flat-square)](https://github.com/yohanesokta/PHP-Apache_Binaries_Static/releases)
[![CI](https://img.shields.io/github/actions/workflow/status/crazywhalecc/static-php-cli/tests.yml?branch=main&label=Build%20Test&style=flat-square)](https://github.com/yohanesokta/PHP-Apache_Binaries_Static/actions/workflows/build-debian.yml)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://github.com/crazywhalecc/static-php-cli/blob/main/LICENSE)

> Didesain untuk memberikan binaries portable di lingkungan dev dan pastkan menggunakanya di lingkungan developer

---
Proyek ini di tujukan untuk project [GajahWeb Service](https://github.com/yohanesokta/WebServices-Gajah) untuk menciptakan lingkungan development php yang super portable. File Size sangat besar karena ini di build menggunakan linked langsung kepada library

> Scripts ini hanya akan berjalan pada lingkungan ( DEBIAN 12 - BOOKWORM ) tidak pada yang lain. sebaiknya di jalankan di vm atau cloud.


## Tujuan

Proyek ini dirancang untuk menciptakan lingkungan pengembangan portabel untuk aplikasi PHP yang memerlukan versi PHP dan Apache tertentu. Ini ideal bagi pengembang yang perlu bekerja di lingkungan yang konsisten yang dapat dengan mudah dipindahkan atau direplikasi.

## Prasyarat

*   **Sistem Operasi:** Debian 12 (bookworm)
*   **Izin:** Anda memerlukan akses `sudo` untuk menginstal dependensi build.

## Versi

*   **Apache:** 2.4.66
*   **PHP:** 8.4.16

## Cara Build

1.  **Clone repositori:**
    ```bash
    git clone https://github.com/yohanesokta/PHP-Apache_Binaries_Static.git
    cd PHP-Apache_Binaries_Static
    ```

2.  **Jalankan skrip setup:**
    ```bash
    ./setup.sh
    ```
    Skrip ini akan mengunduh, mengkompilasi, dan mengkonfigurasi Apache dan PHP. Seluruh proses mungkin memakan waktu cukup lama.

3.  **Bundel dependensi:**
    ```bash
    ./depends.sh
    ```
    Skrip ini akan menyalin semua pustaka bersama yang diperlukan ke dalam direktori runtime.

4.  **Terapkan konfigurasi akhir:**
    ```bash
    ./configuration.sh
    ```
    Skrip ini akan menyalin file `php.ini` dan skrip `start.sh` ke dalam direktori runtime.

## Cara Menjalankan

Setelah build berhasil, distribusi portabel yang lengkap akan berada di direktori `/opt/runtime`. Anda dapat memulai server Apache dengan menjalankan skrip `start.sh`:

```bash
/opt/runtime/start.sh
```

Secara default, server akan berjalan di port 8080. Anda dapat mengujinya dengan membuka browser web dan menavigasi ke `http://localhost:8080`.

## Skrip

*   `setup.sh`: Skrip build utama. Ini mengunduh dan mengkompilasi Apache dan PHP.
*   `depends.sh`: Membundel dependensi pustaka bersama.
*   `configuration.sh`: Menyalin file konfigurasi akhir.
*   `config/start.sh`: Skrip startup untuk server Apache yang dibundel.

## Lisensi

Proyek ini dilisensikan di bawah ketentuan file LICENSE.txt.

---

## English Version

## Purpose

This project is designed to create a portable development environment for PHP applications that require a specific version of PHP and Apache. It's ideal for developers who need to work in a consistent environment that can be easily moved or replicated.

## Prerequisites

*   **Operating System:** Debian 12 (bookworm)
*   **Permissions:** You will need `sudo` access to install the build dependencies.

## Versions

*   **Apache:** 2.4.66
*   **PHP:** 8.4.16

## How to Build

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yohanesokta/PHP-Apache_Binaries_Static.git
    cd PHP-Apache_Binaries_Static
    ```

2.  **Run the setup script:**
    ```bash
    ./setup.sh
    ```
    This script will download, compile, and configure Apache and PHP. The entire process may take some time.

3.  **Bundle the dependencies:**
    ```bash
    ./depends.sh
    ```
    This script will copy all the necessary shared libraries into the runtime directory.

4.  **Apply the final configuration:**
    ```bash
    ./configuration.sh
    ```
    This script will copy the `php.ini` file and the `start.sh` script into the runtime directory.

## How to Run

After a successful build, the complete, portable distribution will be located in the `/opt/runtime` directory. You can start the Apache server by running the `start.sh` script:

```bash
/opt/runtime/start.sh
```

By default, the server will be listening on port 8080. You can test it by opening a web browser and navigating to `http://localhost:8080`.

## Scripts

*   `setup.sh`: The main build script. It downloads and compiles Apache and PHP.
*   `depends.sh`: Bundles the shared library dependencies.
*   `configuration.sh`: Copies the final configuration files.
*   `config/start.sh`: The startup script for the bundled Apache server.

## License

This project is licensed under the terms of the LICENSE.txt file.