import 'dart:io';

import 'package:wanflorist/console_ui.dart';
import 'package:wanflorist/models/detail_pesanan.dart';
import 'package:wanflorist/models/pesanan.dart';
import 'package:wanflorist/models/produk.dart';
import 'package:wanflorist/services/katalog_service.dart';
import 'package:wanflorist/services/pesanan_service.dart';

class WanFloristApp {
  void jalankan() {
    ConsoleUI ui = ConsoleUI();
    KatalogProduk katalog = KatalogProduk();
    AntrianPesanan antrian = AntrianPesanan();

    bool jalan = true;
    while (jalan) {
      ui.tampilkanHeader();
      ui.tampilkanMenuUtama();
      String pilihan = ui.bacaInput();

      switch (pilihan) {
        case '1':
          _menuKatalog(ui, katalog);
          break;
        case '2':
          _menuPesanan(ui, katalog, antrian);
          break;
        case '3':
          antrian.lihatRiwayat();
          ui.tungguEnter();
          break;
        case '0':
          ui.tampilkanPesan('Terima kasih telah menggunakan WanFlorist!');
          jalan = false;
          break;
        default:
          ui.tampilkanPesan('Pilihan tidak valid.');
      }
    }
  }

  void _menuKatalog(ConsoleUI ui, KatalogProduk katalog) {
    bool kembali = false;
    while (!kembali) {
      ui.tampilkanMenuKatalog();
      String pilihan = ui.bacaInput();

      switch (pilihan) {
        case '1':
          String nama = ui.bacaInputDenganLabel('Nama produk');
          String kategori = ui.bacaInputDenganLabel('Kategori');
          double harga = ui.bacaDoubleWajib('Harga');
          int stok = ui.bacaIntWajib('Stok');
          katalog.tambahProduk(nama, kategori, harga, stok);
          ui.tungguEnter();
          break;
        case '2':
          katalog.tampilkanSemuaProduk();
          String id = ui.bacaInputDenganLabel('ID Produk yang dihapus');
          katalog.hapusProduk(id);
          ui.tungguEnter();
          break;
        case '3':
          katalog.tampilkanSemuaProduk();
          ui.tungguEnter();
          break;
        case '4':
          String katakunci = ui.bacaInputDenganLabel('Nama produk');
          Produk? hasil = katalog.cariProduk(katakunci);
          if (hasil != null) {
            ui.tampilkanPesan('Ditemukan: $hasil');
          } else {
            ui.tampilkanPesan('Produk tidak ditemukan.');
          }
          ui.tungguEnter();
          break;
        case '5':
          katalog.urutkanByHarga();
          ui.tungguEnter();
          break;
        case '6':
          katalog.tampilkanSemuaProduk();
          String idEdit = ui.bacaInputDenganLabel('ID Produk yang diedit');
          Produk? produkLama = katalog.cariProdukById(idEdit);
          if (produkLama == null) {
            ui.tampilkanPesan('Produk tidak ditemukan.');
            ui.tungguEnter();
            break;
          }
          String namaBaru = ui.bacaStringDenganDefault(
            'Nama baru',
            produkLama.nama,
          );
          String kategoriBaru = ui.bacaStringDenganDefault(
            'Kategori baru',
            produkLama.kategori,
          );
          double hargaBaru = ui.bacaDouble('Harga baru', produkLama.harga);
          int stokBaru = ui.bacaInt('Stok baru', produkLama.stok);
          katalog.editProduk(
            idEdit,
            namaBaru,
            kategoriBaru,
            hargaBaru,
            stokBaru,
          );
          ui.tungguEnter();
          break;
        case '0':
          kembali = true;
          break;
        case 'E':
        case 'e':
          kembali = true;
          break;
        case 'C':
        case 'c':
          ui.tampilkanPesan('Terima kasih telah menggunakan WanFlorist!');
          exit(0);
        default:
          ui.tampilkanPesan('Pilihan tidak valid.');
      }
    }
  }

  void _menuPesanan(ConsoleUI ui, KatalogProduk katalog, AntrianPesanan antrian) {
    bool kembali = false;
    while (!kembali) {
      ui.tampilkanMenuPesanan();
      String pilihan = ui.bacaInput();

      switch (pilihan) {
        case '1':
          String nama = ui.bacaInputDenganLabel('Nama pelanggan');
          String alamat = ui.bacaInputDenganLabel('Alamat');
          List<DetailPesanan> details = [];
          bool tambahLagi = true;
          while (tambahLagi) {
            katalog.tampilkanSemuaProduk();
            String idProduk = ui.bacaInputDenganLabel('ID Produk');
            Produk? produk = katalog.cariProdukById(idProduk);
            if (produk != null) {
              int jumlah = ui.bacaIntWajib('Jumlah');
              details.add(DetailPesanan(produk: produk, jumlah: jumlah));
            } else {
              ui.tampilkanPesan('Produk tidak ditemukan.');
            }
            String lanjut = ui.bacaInputDenganLabel('Tambah produk lagi? (y/n)');
            tambahLagi = lanjut == 'y';
          }
          if (details.isNotEmpty) {
            antrian.tambahPesanan(nama, alamat, details);
          }
          ui.tungguEnter();
          break;
        case '2':
          antrian.prosesPesanan();
          ui.tungguEnter();
          break;
        case '3':
          antrian.lihatAntrian();
          ui.tungguEnter();
          break;
        case '4':
          antrian.lihatAntrian();
          String idPesanan = ui.bacaInputDenganLabel('ID Pesanan yang diedit');
          Pesanan? pesananLama = antrian.cariPesananById(idPesanan);
          if (pesananLama == null) {
            ui.tampilkanPesan('Pesanan tidak ditemukan atau sudah selesai.');
            ui.tungguEnter();
            break;
          }
          String namaBaru = ui.bacaStringDenganDefault(
            'Nama pelanggan baru',
            pesananLama.namaPelanggan,
          );
          String alamatBaru = ui.bacaStringDenganDefault(
            'Alamat baru',
            pesananLama.alamat,
          );
          antrian.editPesanan(idPesanan, namaBaru, alamatBaru);
          ui.tungguEnter();
          break;
        case '0':
          kembali = true;
          break;
        case 'E':
        case 'e':
          kembali = true;
          break;
        case 'C':
        case 'c':
          ui.tampilkanPesan('Terima kasih telah menggunakan WanFlorist!');
          exit(0);
        default:
          ui.tampilkanPesan('Pilihan tidak valid.');
      }
    }
  }
}
