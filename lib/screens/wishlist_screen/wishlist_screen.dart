import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/favs_attr.dart';
import '../../../providers/favs_provider.dart';
import '../../../widgets/empty_iconic_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = '/WishListScreen';

  @override
  Widget build(BuildContext context) {
    final Map<String, FavsAttr> _wishes =
        Provider.of<FavsProvider>(context).getFavsItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
        centerTitle: true,
      ),
      body: (_wishes.isEmpty)
          ? const EmptyIconicWidget(
              icon: Icons.favorite_outline,
              title: 'Your Wish List is empty',
              subtitle:
                  '''Looks like you don't\nadd anything in your wish list yet''',
            )
          // TODO: Display the list of service tile as shown in search screen
          : const SizedBox(),
    );
  }
}
