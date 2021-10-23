import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cart_attr.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/empty_iconic_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    final Map<String, CartAttr> _cart =
        Provider.of<CartProvider>(context).getCartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: (_cart.isEmpty)
          ? const EmptyIconicWidget(
              icon: Icons.shopping_cart_outlined,
              title: 'Your cart is empty',
              subtitle:
                  '''Looks like you don't\nadd anything in your cart yet''',
            )
          // TODO: Display the list of service tile as shown in search screen
          : const SizedBox(),
    );
  }
}
