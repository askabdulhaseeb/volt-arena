import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class OrdersAttr with ChangeNotifier {
  final String? orderId;
  final String? userId;
  final String? productId;
  final String? title;
  final String? price;
  final String? imageUrl;
  final String? quantity;
  final Timestamp? orderDate;

  OrdersAttr({
    this.orderId,
    this.userId,
    this.productId,
    this.title,
    this.price,
    this.imageUrl,
    this.quantity,
    this.orderDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'productId': productId,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'orderDate': orderDate!.toDate().toString(),
    };
  }

  factory OrdersAttr.FromDocument(DocumentSnapshot<Map<String, dynamic>> docs) {
    return OrdersAttr(
      orderId: docs.data()!['orderId'].toString(),
      userId: docs.data()!['userId'].toString(),
      productId: docs.data()!['productId'].toString(),
      title: docs.data()!['title'].toString(),
      price: docs.data()!['price'].toString(),
      imageUrl: docs.data()!['imageUrl'].toString(),
      quantity: docs.data()!['quantity'].toString(),
      orderDate: Timestamp.fromDate(docs.data()!['orderDate']),
    );
  }
}
