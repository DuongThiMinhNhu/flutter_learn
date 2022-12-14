import 'package:admin/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<Product>> getProducts(){
    return _firebaseFirestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
  Future<void> addProduct(Product product){
    return _firebaseFirestore.collection('products').add(product.toMap());
  }
}