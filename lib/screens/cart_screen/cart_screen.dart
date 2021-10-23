import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/models/cart_attr.dart';
import 'package:volt_arena_app/providers/bottom_navigation_bar_provider.dart';
import 'package:volt_arena_app/providers/cart_provider.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';

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
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 60,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '''Looks like you don't\nadd anything in your cart yet''',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Consumer<BottomNavigationBarProvider>(
                    builder: (
                      BuildContext context,
                      BottomNavigationBarProvider page,
                      _,
                    ) =>
                        TextButton(
                      onPressed: () {
                        page.updateSelectedPage(0);
                        Navigator.of(context).pop();
                      },
                      child: const Text('SHOP NOW'),
                    ),
                  ),
                ],
              ),
            )
          // TODO: Display the list of service tile as shown in search screen
          : const SizedBox(),
    );
  }
}
