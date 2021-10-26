import 'package:flutter/material.dart';
import 'package:volt_arena_app/widgets/empty_iconic_widget.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return const EmptyIconicWidget(
      icon: Icons.favorite_outline,
      title: 'Your Wish List is empty',
      subtitle: '''Looks like you don't\nadd anything in your wish list yet''',
    );
  }
}
