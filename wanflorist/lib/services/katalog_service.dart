import 'package:wanflorist/data_structures/linked_list.dart';
import 'package:wanflorist/models/produk.dart';
import 'package:wanflorist/data_structures/node.dart';
import 'package:wanflorist/services/penyimpanan.dart';

class KatalogProduk {
  LinkedList<Produk> daftarProduk = LinkedList();
  Penyimpanan penyimpanan = Penyimpanan();
  int idCounter = 1;

  KatalogProduk() {
    muat();
  }

  void muat() {
    List<Produk> listProduk = penyimpanan.muatProduk();
    for (var produk in listProduk) {
      daftarProduk.insertBack(produk);
      int nomorId = int.tryParse(produk.id.replaceAll('PROD', '')) ?? 0;
      if (nomorId >= idCounter) idCounter = nomorId + 1;
    }
  }

  List<Produk> _keList() {
    List<Produk> hasil = [];
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      hasil.add(sekarang.nodeValue);
      sekarang = sekarang.next;
    }
    return hasil;
  }

  void tambahProduk(String nama, String kategori, double harga, int stok) {
    String id = 'PROD$idCounter';
    idCounter++;
    Produk produkBaru = Produk(
      id: id,
      nama: nama,
      kategori: kategori,
      harga: harga,
      stok: stok,
    );
    daftarProduk.insertBack(produkBaru);
    penyimpanan.simpanProduk(_keList());
    print('Produk "$nama" berhasil ditambahkan.');
  }

  void hapusProduk(String id) {
    if (daftarProduk.isEmpty()) {
      print('Katalog kosong.');
      return;
    }
    if (daftarProduk.head!.nodeValue.id.toLowerCase() == id.toLowerCase()) {
      daftarProduk.deleteFront();
      penyimpanan.simpanProduk(_keList());
      print('Produk berhasil dihapus.');
      return;
    }
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang!.next != null) {
      if (sekarang.next!.nodeValue.id.toLowerCase() == id.toLowerCase()) {
        sekarang.next = sekarang.next!.next;
        penyimpanan.simpanProduk(_keList());
        print('Produk berhasil dihapus.');
        return;
      }
      sekarang = sekarang.next;
    }
    print('Produk tidak ditemukan');
  }

  void editProduk(
    String id,
    String nama,
    String kategori,
    double harga,
    int stok,
  ) {
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      if (sekarang.nodeValue.id.toLowerCase() == id.toLowerCase()) {
        sekarang.nodeValue.nama = nama;
        sekarang.nodeValue.kategori = kategori;
        sekarang.nodeValue.harga = harga;
        sekarang.nodeValue.stok = stok;
        penyimpanan.simpanProduk(_keList());
        print('Produk berhasil diupdate.');
        return;
      }
      sekarang = sekarang.next;
    }
    print('Produk tidak ditemukan.');
  }

  // Sequential Search (berdasarkan nama)
  Produk? cariProduk(String katakunci) {
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      if (sekarang.nodeValue.nama.toLowerCase().contains(
        katakunci.toLowerCase(),
      )) {
        return sekarang.nodeValue;
      }
      sekarang = sekarang.next;
    }
    return null;
  }

  // Cari produk berdasarkan ID (sudah di atasi dengan lowercase)
  Produk? cariProdukById(String id) {
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      if (sekarang.nodeValue.id.toLowerCase() == id.toLowerCase()) {
        return sekarang.nodeValue;
      }
      sekarang = sekarang.next;
    }
    return null;
  }

  // Bubble Sort (Berdasarkan Harga)
  void urutkanByHarga() {
    List<Produk> listProduk = [];
    Node<Produk>? sekarang = daftarProduk.head;
    while (sekarang != null) {
      listProduk.add(sekarang.nodeValue);
      sekarang = sekarang.next;
    }
    for (int i = 0; i < listProduk.length - 1; i++) {
      for (int j = 0; j < listProduk.length - i - 1; j++) {
        if (listProduk[j].harga > listProduk[j + 1].harga) {
          Produk sementara = listProduk[j];
          listProduk[j] = listProduk[j + 1];
          listProduk[j + 1] = sementara;
        }
      }
    }
    print('\n Produk diurutkan berdasarkan harga: ');
    for (var produk in listProduk) {
      print(produk);
    }
  }

  void tampilkanSemuaProduk() {
    daftarProduk.printList();
  }
}
