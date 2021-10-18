import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:volt_arena_app/database/product_api.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = <Product>[];
  List<Product> get products {
    return <Product>[..._products];
  }

  Future<void> fetchProducts() async {
    final QuerySnapshot<Map<String, dynamic>> _docs =
        await ProductAPI().getAllProducts();

    _products = <Product>[];
    for (DocumentSnapshot<Map<String, dynamic>> element in _docs.docs) {
      _products.insert(0, Product.fromDocument(element));
      print(products[0].isPopular);
      print(products[0].isFavorite);
      print(products[0].isIndividual);
      print('done');
    }
  }

  List<Product> get popularProducts {
    return _products.where((Product element) => element.isPopular!).toList();
  }

  Product findById(String productId) {
    return _products
        .firstWhere((Product element) => element.productId == productId);
  }

  List<Product> findByCategory(String categoryName) {
    List<Product> _categoryList = _products
        .where((Product element) => element.productCategoryName!
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> searchQuery(String searchText) {
    List<Product> _searchList = _products
        .where((Product element) =>
            element.title!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }
}
