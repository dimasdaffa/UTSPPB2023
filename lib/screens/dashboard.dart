import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:toko_pertanian/screens/product_detail.dart';
import 'package:toko_pertanian/screens/update_user.dart'; 

void main() {
  runApp(MaterialApp(
    home: DashboardScreen(),
  ));
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (choice) {
              if (choice == 'Call Center') {
                launch("tel://0857896772");
              } else if (choice == 'SMS Center') {
                launch("sms://0857896772");
              } else if (choice == 'Lokasi/Maps') {
                launchMap();
              } else if (choice == 'Update User & Password') {
                updateUserInfo(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                'Call Center',
                'SMS Center',
                'Lokasi/Maps',
                'Update User & Password'
              ].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductRow(
              product1: ProductItem(
                name: 'Pupuk Kandang',
                description: 'Pupuk organik',
                price: 'Rp 50,000',
                productName: 'Pupuk Kandang',
                imagePath: 'assets/kandang.jpg',
              ),
              product2: ProductItem(
                name: 'Pupuk Cair',
                description: 'Pupuk cair berkualitas',
                price: 'Rp 75,000',
                productName: 'Pupuk Cair',
                imagePath: 'assets/pupukcair.jpeg',
              ),
              product3: ProductItem(
                name: 'Beras',
                description: 'Beras pandan wangi berkualitas',
                price: 'Rp 100,000',
                productName: 'Beras',
                imagePath: 'assets/beras.jpg',
              ),
              product4: ProductItem(
                name: 'Jagung',
                description: 'Jagung berkualitas',
                price: 'Rp 75,000',
                productName: 'Jagung',
                imagePath: 'assets/jagung.jpg',
              ),
              product5: ProductItem(
                name: 'Bibit Kentang',
                description: 'Bibit kentang berkualitas',
                price: 'Rp 120,000',
                productName: 'Bibit Kentang',
                imagePath: 'assets/bibitkentang.jpg',
              ),
              product6: ProductItem(
                name: 'Bibit Wortel',
                description: 'Bibit wortel berkualitas',
                price: 'Rp 140,000',
                productName: 'Bibit Wortel',
                imagePath: 'assets/bibitwortel.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void launchMap() async {
  final double latitude = -6.979639;
  final double longitude = 110.402861;

  final String googleMapsUrl =
      "https://www.google.com/maps?q=$latitude,$longitude";

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}

class ProductRow extends StatelessWidget {
  final ProductItem product1;
  final ProductItem product2;
  final ProductItem product3;
  final ProductItem product4;
  final ProductItem product5;
  final ProductItem product6;

  ProductRow({
    required this.product1,
    required this.product2,
    required this.product3,
    required this.product4,
    required this.product5,
    required this.product6,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [product1, product2],
        ),
        Row(
          children: [product3, product4],
        ),
        Row(
          children: [product5, product6],
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String productName;
  final String imagePath;

  ProductItem({
    required this.name,
    required this.description,
    required this.price,
    required this.productName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  productName: productName,
                  description: description,
                  imagePath: imagePath,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(price),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void updateUserInfo(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UpdateUserPasswordScreen(),
    ),
  );
}
