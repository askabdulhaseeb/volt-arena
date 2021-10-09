import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/providers/cart_provider.dart';
import 'package:volt_arena_app/providers/favs_provider.dart';
import 'package:volt_arena_app/widgets/custom_drawer.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: const CustomDrawer(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Services'),
      centerTitle: true,
      actions: [
        Consumer<FavsProvider>(
          builder: (_, favs, ch) => Badge(
            animationType: BadgeAnimationType.slide,
            toAnimate: true,
            position: BadgePosition.topEnd(top: 2, end: 5),
            badgeContent: Text(
              favs.getFavsItems.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                // Navigator.of(context).pushNamed(WishlistScreen.routeName);
              },
            ),
          ),
        ),
        Consumer<CartProvider>(
          builder: (_, cart, ch) => Badge(
            badgeColor: Theme.of(context).colorScheme.secondary,
            animationType: BadgeAnimationType.slide,
            toAnimate: true,
            position: BadgePosition.topEnd(top: 2, end: 5),
            badgeContent: Text(
              cart.getCartItems.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                // Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }
}