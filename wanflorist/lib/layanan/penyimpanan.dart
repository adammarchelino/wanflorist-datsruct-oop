import "dart:io";
import "package:wanflorist/entitas/produk.dart";

class Penyimpanan {
  final String namaFile = 'produk.csv';

  void simpanProduk(List<Produk> daftarProduk) {
    File file = File(namaFile);
    List<String> baris = [];
    for (var produk in daftarProduk) {
      baris.add(
        '${produk.id},${produk.nama},${produk.kategori},${produk.harga},${produk.stok}',
      );
    }
    file.writeAsStringSync(baris.join('\n'));
    print('Data produk berhasil disimpan.');
  }

  List<Produk> muatProduk() {
    File file = File(namaFile);
    if (!file.existsSync()) return [];

    List<Produk> daftarProduk = [];
    List<String> baris = file.readAsStringSync().split('\n');
    for (var baris in baris) {
      if (baris.isEmpty) continue;

      List<String> kolom = baris.split(',');
      daftarProduk.add(
        Produk(
          id: kolom[0],
          nama: kolom[1],
          kategori: kolom[2],
          harga: double.parse(kolom[3]),
          stok: int.parse(kolom[4]),
        ),
      );
    }
    return daftarProduk;
  }
}
