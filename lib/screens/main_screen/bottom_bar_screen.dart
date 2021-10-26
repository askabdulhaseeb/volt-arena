import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/providers/bottom_navigation_bar_provider.dart';
import 'pages/services_page/services_page.dart';
import 'pages/booking_page/booking_page.dart';
import 'pages/chat_list_page/chat_list_page.dart';
import 'pages/my_booking_page/my_booking_page.dart';
import 'pages/search_page/search_page.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  static const String routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Widget> pages = const <Widget>[
    ServicesPage(),
    SearchPage(),
    MyBookingPage(),
    // CalenderScreen(),
    BookingPage(),
    ChatListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarProvider _page =
        Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: pages[_page.selectedPage],
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          onTap: (int updatedPage) => _page.updateSelectedPage(updatedPage),
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: _page.selectedPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Booking',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.shopping_bag),
            //   label: 'All Users',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined),
              label: 'My Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'Admin Chats',
            ),
          ],
        ),
      ),
    );
  }
}
