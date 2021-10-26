import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/models/favs_attr.dart';
import 'package:volt_arena_app/providers/favs_provider.dart';
import 'package:volt_arena_app/utilities/global_method.dart';

class WishlistFull extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const WishlistFull({required this.productId});
  final String productId;

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    final FavsAttr favsAttr = Provider.of<FavsAttr>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15))),
                      child: Image.network(
                        favsAttr.imageUrl!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            favsAttr.title!,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '\$ ${favsAttr.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.productId),
      ],
    );
  }

  Widget positionedRemove(String productId) {
    final favsProvider = Provider.of<FavsProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return Positioned(
      top: 20,
      right: 15,
      child: SizedBox(
        height: 30,
        width: 30,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: const EdgeInsets.all(0.0),
            color: Colors.red,
            child: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => {
                  globalMethods.showDialogg(
                      'Remove wish!',
                      'This product will be removed from your wishlist!',
                      () => favsProvider.removeItem(productId),
                      context),
                }),
      ),
    );
  }
}
