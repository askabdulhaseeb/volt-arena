import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/providers/bottom_navigation_bar_provider.dart';
import 'package:volt_arena_app/screens/main_screen/pages/widgets/service_tile_widget.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';
import 'package:volt_arena_app/widgets/empty_image_widget.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({Key? key}) : super(key: key);
  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  final List<int> _bookings = <int>[]; // TODO: replace int with booking model
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_bookings.isEmpty)
          ? EmptyImageWidget(
              assetImage: CustomImages.emptyCart,
              title: 'No Booking found',
              subtitle:
                  '''Looks like you don't\nadd anything in your booking yet''',
            )
          : ListView.builder(
              itemCount: _bookings.length,
              itemBuilder: (BuildContext context, int index) {
                return const Text('Show Booking Tile here like search tile');
              },
            ),
    );
  }
}
