import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/providers/bottom_navigation_bar_provider.dart';
import 'package:volt_arena_app/screens/main_screen/pages/widgets/service_tile_widget.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';

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
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.asset(CustomImages.emptyCart),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No Booking found',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '''Looks like you don't\nadd anything in your booking yet''',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Consumer<BottomNavigationBarProvider>(
                    builder: (
                      BuildContext context,
                      BottomNavigationBarProvider page,
                      _,
                    ) =>
                        TextButton(
                      onPressed: () => page.updateSelectedPage(0),
                      child: const Text('SHOP NOW'),
                    ),
                  ),
                ],
              ),
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
