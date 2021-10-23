import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../database/product_api.dart';
import '../../../../models/product.dart';
import '../../../../utilities/utilities.dart';
import '../../../../widgets/empty_iconic_widget.dart';
import '../widgets/service_tile_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> _products = <Product>[];
  bool _isLoading = false;
  Timer? searchOnStoppedTyping;
  Future<void> _onChange(String value) async {
    const Duration duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    searchOnStoppedTyping = Timer(
      duration,
      () async {
        setState(() {
          _isLoading = true;
        });
        _products = await ProductAPI().searchProducts(value);
        setState(() {
          _isLoading = false;
        });
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 10),
          Expanded(
            child: (_isLoading)
                ? const Center(child: CircularProgressIndicator())
                : (_products.isEmpty)
                    ? const EmptyIconicWidget(
                        icon: Icons.error_outline,
                        title: 'No service found!!!',
                        subtitle: 'You can checkout all service',
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
