import 'package:flutter/material.dart';
import 'package:volt_arena_app/utilities/utilities.dart';
import 'package:volt_arena_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: Utilities.borderRadius,
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          IconButton(
            splashRadius: Utilities.borderRadius,
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
