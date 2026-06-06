import 'detail_pesanan.dart';
import 'status_pesanan.dart';
import 'entitas.dart';

class Pesanan extends Entitas {
  @override
  String id;
  String namaPelanggan;
  String alamat;
  StatusPesanan status;
  List<DetailPesanan> details;

  Pesanan({
    required this.id,
    required this.namaPelanggan,
    required this.alamat,
    this.status = StatusPesanan.antri,
    required this.details,
  });

  double total() {
    double jumlah = 0;
    for (var detail in details) {
      jumlah += detail.subtotal();
    }
    return jumlah;
  }

  @override
  String info() {
    return '$id $namaPelanggan $alamat ${status.name} Rp${total()}';
  }

  @override
  String toString() {
    return '$id $namaPelanggan $alamat ${status.name} Rp${total()}';
  }
}
