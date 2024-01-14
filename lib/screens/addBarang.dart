import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:Tani_Yuk/services/firestore.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({super.key});

  @override
  State<AddBarang> createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  final FirebaseImageUploadService _imageUploadService =
      FirebaseImageUploadService();
  final _formKey = GlobalKey<FormState>();

  File? _imageFile;
  String? _namaBarang;
  String? _deskripsi;
  String? _imageUrl;
  double? _harga;
  int? _stok;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      final imageName = basename(_imageFile!.path);
      final imageUrl =
          await _imageUploadService.uploadImage(_imageFile!, imageName);

      setState(() {
        _imageUrl = imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
				leading: IconButton(
					icon: Icon(Icons.arrow_back),
					onPressed: () {
						Navigator.pop(context);
					},
				),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Barang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product name';
                  }
                  return null;
                },
                onSaved: (value) => _namaBarang = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
                onSaved: (value) => _deskripsi = value,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _imageFile == null
                        ? Text('No image selected.')
                        : Image.file(_imageFile!),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: Text('Pick Image'),
                    ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: Text('Take Photo'),
                    ),
                    ElevatedButton(
                      onPressed: _uploadImage,
                      child: Text('Upload Image'),
                    ),
                    _imageUrl != null
                        ? Image.network(_imageUrl!)
                        : Text('Uploaded Image Preview'),
                  ],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
                onSaved: (value) => _harga = double.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Stok'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the stock';
                  }
                  return null;
                },
                onSaved: (value) => _stok = int.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform further actions with the form data
                    print('Nama Barang: $_namaBarang');
                    print('Deskripsi: $_deskripsi');
                    print('Image URL: $_imageUrl');
                    print('Harga: $_harga');
                    print('Stok: $_stok');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
