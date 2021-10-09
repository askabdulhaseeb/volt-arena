import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavsAttr with ChangeNotifier {
  FavsAttr({this.id, this.title, this.price, this.imageUrl});
  final String? id;
  final String? title;
  final double? price;
  final String? imageUrl;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory FavsAttr.fromDocument(DocumentSnapshot<Map<String, dynamic>> docs) {
    return FavsAttr(
      id: docs.data()!['id'].toString(),
      title: docs.data()!['title'].toString(),
      price: double.parse(docs.data()!['price'].toString()),
      imageUrl: docs.data()!['imageUrl'].toString(),
    );
  }
}
