import 'entitas.dart';

class Produk extends Entitas {
  @override
  String id;
  String nama;
  String kategori;
  double harga;
  int stok;

  Produk({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.stok,
  });

  @override
  String info() {
    return '$id | $nama | $kategori | Rp$harga | Stok: $stok';
  }

  @override
  String toString() {
    return '$id | $nama | $kategori | Rp$harga | Stok: $stok';
  }
}
