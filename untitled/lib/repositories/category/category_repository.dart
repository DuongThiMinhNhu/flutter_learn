import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/model/model.dart';
import 'package:untitled/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Categorys>> getAllCategroies() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Categorys.fromSnapshot(doc)).toList();
    });
  }
}
