import 'package:flutter/material.dart';
import 'screens/auth/landing_screen/landing_screen.dart';
import 'screens/auth/login_screen/login_screen.dart';
import 'screens/auth/signup_screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingScreen(),
      routes: <String, WidgetBuilder>{
        LandingScreen.routeName: (_) => const LandingScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
      },
    );
  }
}
