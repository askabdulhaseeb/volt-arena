import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  Product({
    this.productId,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.groupMembers,
    this.isIndividual,
    this.gameTime,
    this.isFavorite,
    this.isPopular,
    this.pallets,
    this.productCategoryName,
  });
  final String? productId;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final bool? isIndividual;
  final String? gameTime;
  final bool? isFavorite;
  final bool? isPopular;
  final String? pallets;
  final int? groupMembers;
  final String? productCategoryName;
  // ignore: sort_constructors_first, always_specify_types
  factory Product.fromDocument(DocumentSnapshot<Map<String, dynamic>> docs) {
    return Product(
      productId: docs.data()!['productId'].toString(),
      title: docs.data()!['title'].toString(),
      description: docs.data()!['description'].toString(),
      price: double.parse(docs.data()!['price'].toString()),
      imageUrl: docs.data()!['imageUrl'].toString(),
      groupMembers: int.parse(docs.data()!['groupMembers'].toString()),
      isIndividual:
          bool.fromEnvironment(docs.data()!['isIndividual'].toString()),
      gameTime: docs.data()!['gameTime'].toString(),
      isFavorite: bool.fromEnvironment(docs.data()!['isFavorite'].toString()),
      pallets: docs.data()!['pallets'].toString(),
      productCategoryName: docs.data()!['productCategoryName'].toString(),
      isPopular: bool.fromEnvironment(docs.data()!['isPopular'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isIndividual': isIndividual,
      'gameTime': gameTime,
      'isFavorite': isFavorite,
      'isPopular': isPopular,
      'pallets': pallets,
      'groupMembers': groupMembers,
      'productCategoryName': productCategoryName,
    };
  }
}
