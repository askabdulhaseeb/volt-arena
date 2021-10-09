import 'package:flutter/material.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage(
      {required this.imageURL, this.radious = 68, Key? key})
      : super(key: key);
  final String imageURL;
  final double radious;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radious,
      backgroundColor: Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: radious - 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: CircleAvatar(
          radius: radious - 8,
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: (imageURL.isEmpty)
              ? AssetImage(CustomImages.icon)
              : NetworkImage(imageURL) as ImageProvider,
        ),
      ),
    );
  }
}
