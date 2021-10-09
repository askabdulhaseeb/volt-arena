import 'package:flutter/material.dart';
import 'package:volt_arena_app/database/user_local_data.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';
import 'package:volt_arena_app/utilities/utilities.dart';
import 'package:volt_arena_app/widgets/circular_profile_image.dart';
import 'package:volt_arena_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    const Icon forwardArrow = Icon(
      Icons.arrow_forward_ios_rounded,
      size: 16,
    );
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
