import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String productName;
  final int quantity;
  final double price;

  PaymentScreen(
      {required this.productName, required this.quantity, required this.price});

  double getTotalPrice() {
    return price * quantity;
  }

  void completePayment(BuildContext context) {
    // Di sini, Anda dapat menambahkan logika untuk menyelesaikan pembayaran, seperti mengirim pembayaran ke server,
    // memproses transaksi, dan menampilkan pesan konfirmasi atau menavigasi kembali ke halaman dashboard.

    // Misalnya, Anda dapat menambahkan kode berikut untuk menampilkan pesan konfirmasi:
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pembayaran Selesai'),
          content: Text(
              'Terima kasih telah menyelesaikan pembayaran untuk $productName sebanyak $quantity buah. Total harga adalah Rp ${getTotalPrice().toStringAsFixed(3)}'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.of(context).pop(); // Kembali ke halaman dashboard
              },
              child: Text('KEMBALI'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian Pembelian:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text('Nama Produk: $productName', style: TextStyle(fontSize: 16)),
            Text('Jumlah: $quantity', style: TextStyle(fontSize: 16)),
            Text('Total Harga: Rp ${total.toStringAsFixed(3)}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                completePayment(
                    context); // Panggil fungsi untuk menyelesaikan pembayaran
              },
              child: Text('Selesaikan Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
