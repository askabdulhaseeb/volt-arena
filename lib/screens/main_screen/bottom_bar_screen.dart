import 'package:flutter/material.dart';
import 'pages/services_page/services_page.dart';
import 'pages/booking_page/booking_page.dart';
import 'pages/calender_page/calender_page.dart';
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
  int _selectedPageIndex = 0;
  final List<Widget> pages = const <Widget>[
    ServicesPage(),
    SearchPage(),
    MyBookingPage(),
    CalenderPage(),
    BookingPage(),
    ChatListPage(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: _selectedPageIndex,
          items: const [
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
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'All Users',
            ),
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
