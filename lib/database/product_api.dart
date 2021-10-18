import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volt_arena_app/models/product.dart';

class ProductAPI {
  static const String _collection = 'products';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // functions
  Future<void> addProduct(Product product) async {
    await _instance
        .collection(_collection)
        .doc(product.productId)
        .set(product.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() async {
    return await _instance.collection(_collection).get();
  }
}
