import 'package:flutter/material.dart';
import 'package:volt_arena_app/screens/main_screen/bottom_bar_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = '/MainScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        children: <Widget>[
          const BottomBarScreen(),
          Container(),
        ],
      ),
    );
  }
}
