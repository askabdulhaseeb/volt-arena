import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/models/product.dart';
import 'package:volt_arena_app/providers/products.dart';
import 'package:volt_arena_app/screens/main_screen/pages/widgets/service_tile_widget.dart';
import 'package:volt_arena_app/utilities/utilities.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<void> _onChange(String value) async {}
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
    final List<Product> _products = Provider.of<Products>(context).products;
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
            child: TextFormField(
              onChanged: (String value) => _onChange(value),
              decoration: const InputDecoration(
                hintText: 'Search ...',
                suffixIcon: Icon(CupertinoIcons.search),
                // border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: (_products.isEmpty)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.error_outline, size: 60, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'No service found!!!',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServicesTileWidget(
                        product: _products[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
