import 'package:flutter/material.dart';
import 'package:toko_pertanian/screens/payment.dart';

class SalesScreen extends StatefulWidget {
  final String productName;

  SalesScreen({required this.productName});

  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  int quantity = 1;
  double productPrice = 100.0; // Harga produk

  double getTotalPrice() {
    return productPrice * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proses Penjualan - ${widget.productName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Produk: ${widget.productName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Jumlah: $quantity',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Total Harga: Rp ${getTotalPrice().toStringAsFixed(3)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      productName: widget.productName,
                      quantity: quantity,
                      price: productPrice, // Harga produk
                    ),
                  ),
                );
              },
              child: Text('Lanjutkan ke Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
