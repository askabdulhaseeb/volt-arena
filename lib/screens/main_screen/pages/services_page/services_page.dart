import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/screens/wishlist/wishlist.dart';
import '../../../../providers/products.dart';
import '../../../../screens/cart_screen/cart_screen.dart';
import '../../../../utilities/utilities.dart';
import '../../../../providers/cart_provider.dart';
import '../../../../providers/favs_provider.dart';
import '../../../../widgets/custom_drawer.dart';
import '../widgets/service_card_widget.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);
  @override
  State<ServicesPage> createState() => _ServicesPageState();
  static const String routeName = '/ServicesPage';
}

class _ServicesPageState extends State<ServicesPage> {
  Future<void> _getProductsOnRefresh() async {
    await Provider.of<Products>(context, listen: false).fetchProducts();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getProductsOnRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final Products productsProvider = Provider.of<Products>(context);
    return Scaffold(
      appBar: _appBar(context),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(Utilities.padding),
        child: RefreshIndicator(
          onRefresh: _getProductsOnRefresh,
          child: productsProvider.products.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.room_service_outlined,
                        size: 60,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No Service Available',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Look like no service\nis available yet',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: productsProvider.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceCardWidget(
                      product: productsProvider.products[index],
                    );
                  },
                ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Services'),
      centerTitle: true,
      actions: <Widget>[
        Consumer<FavsProvider>(
          builder: (BuildContext context, FavsProvider favs, _) => Badge(
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
                Navigator.of(context).pushNamed(WishListScreen.routeName);
              },
            ),
          ),
        ),
        Consumer<CartProvider>(
          builder: (BuildContext context, CartProvider cart, _) => Badge(
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
              onPressed: () async {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }
}
