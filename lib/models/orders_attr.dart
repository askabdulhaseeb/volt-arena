import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class OrdersAttr with ChangeNotifier {
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
  final String? orderId;
  final String? userId;
  final String? productId;
  final String? title;
  final String? price;
  final String? imageUrl;
  final String? quantity;
  final Timestamp? orderDate;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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

  // ignore: non_constant_identifier_names, sort_constructors_first
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
