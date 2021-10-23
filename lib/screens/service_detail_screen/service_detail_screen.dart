import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volt_arena_app/models/product.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';
import 'package:volt_arena_app/utilities/utilities.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({required this.product, Key? key})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _imageSection(context),
            _headerInfoSection(),
            const Divider(),
            _aboutServiceSection(context),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Utilities.padding / 2),
              child: _titleText(context: context, title: 'Reviews'),
            ),
            _reviewSection(context),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.favorite_border_outlined),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add_shopping_cart_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _reviewSection(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding / 2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'No review available',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Be the first reviewer!'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _aboutServiceSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utilities.padding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _titleText(context: context, title: 'About'),
          const SizedBox(height: 4),
          SelectableText(product.description!),
        ],
      ),
    );
  }

  Text _titleText({required BuildContext context, required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Padding _headerInfoSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Text(
            product.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          _richTextInfo(
            title: 'Price: ',
            subtitle: '${product.price}',
          ),
        ],
      ),
    );
  }

  Widget _richTextInfo({String? title, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            TextSpan(
              text: subtitle,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Stack _imageSection(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2 / 1,
          child: (product.imageUrl != null || product.imageUrl!.isEmpty)
              ? Image.asset(CustomImages.icon, fit: BoxFit.cover)
              : Image.network(product.imageUrl!),
        ),
        Positioned(
          child: Container(
            color: Colors.black26,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white24,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // TODO: save services
                  },
                  icon: const Icon(Icons.save),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: share services
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
