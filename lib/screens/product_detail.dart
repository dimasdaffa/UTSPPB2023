import 'package:flutter/material.dart';
import 'package:toko_pertanian/screens/proses.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String description;
  final String imagePath;

  ProductDetailScreen(
      {required this.productName,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath), // Menampilkan gambar produk
            SizedBox(height: 16),
            Text(
              'Deskripsi Produk:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalesScreen(productName: productName),
                  ),
                );
              },
              child: Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
