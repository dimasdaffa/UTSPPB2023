import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageUploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImage(File imageFile, String imageName) async {
    try {
      TaskSnapshot uploadTask =
          await _storage.ref('images/$imageName').putFile(imageFile);

      if (uploadTask.state == TaskState.success) {
        final downloadUrl = await uploadTask.ref.getDownloadURL();
        return downloadUrl;
      }
    } catch (e) {
      print('Error uploading image: $e');
    }

    return null;
  }
}

class FirestoreService {
  // Get Collection
  final CollectionReference barang =
      FirebaseFirestore.instance.collection('barang');

Future<void> createBarang({
    required String namaBarang,
		required String deskripsi,
    required String imageUrl,
		required double harga,
    required int stok,
  }) async {
    // Cek kodeBarang terakhir yang digunakan
    QuerySnapshot querySnapshot =
        await barang.orderBy('createdAt', descending: true).limit(1).get();

    // Default kodeBarang
    String kodeBarang = 'B-0001';

    if (querySnapshot.docs.isNotEmpty) {
      String lastKodeBarang = querySnapshot.docs.first['kodeBarang'];
      int lastNumber = int.parse(lastKodeBarang.split('-')[1]);
      kodeBarang = 'B-${(lastNumber + 1).toString().padLeft(4, '0')}';
    }

    await barang.add({
      'kodeBarang': kodeBarang,
      'namaBarang': namaBarang,
			'deskripsi' : deskripsi,
			'imageUrl': imageUrl,
      'harga': harga,
      'stok': stok,
      'createdAt': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getBarang() {
    return barang.orderBy('createdAt', descending: true).snapshots();
  }
	
  // READ Doc Id
  Stream<DocumentSnapshot> getBarangById({
    required String documentId,
  }) {
    return barang.doc(documentId).snapshots();
  }

  // UPDATE
  Future<void> updateBarang({
    required String documentId,
    required String namaBarang,
		required String deskripsi,
		required String imageUrl,
    required double harga,
    required int stok,
  }) async {
    await barang.doc(documentId).update({
      'namaBarang': namaBarang,
			'deskripsi' : deskripsi,
			'imageUrl': imageUrl,
      'harga': harga,
      'stok': stok,
      'updatedAt': Timestamp.now(),
    });
  }

  // DELETE
  Future<void> deleteBarang({
    required String documentId,
  }) async {
    await barang.doc(documentId).delete();
  }
}