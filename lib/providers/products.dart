import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:volt_arena_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productsSnapshot) {
      _products = [];
      for (var element in productsSnapshot.docs) {
        _products.insert(0, Product.fromDocument(element));
      }
    });
  }

  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular!).toList();
  }

  Product findById(String productId) {
    return _products.firstWhere((element) => element.productId == productId);
  }

  List<Product> findByCategory(String categoryName) {
    List<Product> _categoryList = _products
        .where((element) => element.productCategoryName!
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> searchQuery(String searchText) {
    List<Product> _searchList = _products
        .where((element) =>
            element.title!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }
}
