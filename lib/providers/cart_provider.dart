import 'package:flutter/cupertino.dart';
import '../models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartAttr> _cartItems = <String, CartAttr> {};
  Map<String, CartAttr> get getCartItems {
    return <String, CartAttr> {..._cartItems};
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((String key, CartAttr value) {
      total += value.price! * value.quantity!;
    });
    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (CartAttr exitingCartItem) => CartAttr(
          id: exitingCartItem.id,
          productId: exitingCartItem.productId,
          title: exitingCartItem.title,
          price: exitingCartItem.price,
          quantity: exitingCartItem.quantity! + 1,
          imageUrl: exitingCartItem.imageUrl,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
          id: DateTime.now().toString(),
          productId: productId,
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void reduceItemByOne(
    String productId,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (CartAttr exitingCartItem) => CartAttr(
          id: exitingCartItem.id,
          productId: exitingCartItem.productId,
          title: exitingCartItem.title,
          price: exitingCartItem.price,
          quantity: exitingCartItem.quantity! - 1,
          imageUrl: exitingCartItem.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
