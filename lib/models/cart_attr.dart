import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  CartAttr({
    required this.productId,
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.imageUrl,
  });
  final String? id;
  final String? productId;
  final String? title;
  final int? quantity;
  final double? price;
  final String? imageUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'title': title,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // ignore: sort_constructors_first
  factory CartAttr.fromDocument(DocumentSnapshot<Map<String, dynamic>> docs) {
    return CartAttr(
      id: docs.data()!['id'].toString(),
      productId: docs.data()!['productId'].toString(),
      title: docs.data()!['title'].toString(),
      quantity: int.parse(docs.data()!['quantity'].toString()),
      price: double.parse(docs.data()!['price'].toString()),
      imageUrl: docs.data()!['imageUrl'].toString(),
    );
  }
}
