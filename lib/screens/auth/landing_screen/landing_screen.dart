import 'package:flutter/material.dart';
import 'package:volt_arena_app/screens/auth/login_screen/login_screen.dart';
import 'package:volt_arena_app/screens/auth/signup_screen/signup_screen.dart';
import 'package:volt_arena_app/utilities/custom_images.dart';
import 'package:volt_arena_app/utilities/utilities.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const String routeName = '/LandingScreen';
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: size.width * 0.6,
              width: size.width * 0.6,
              child: Image.asset(CustomImages.logo),
            ),
          ),
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: Utilities.padding),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Welcome to V⚡lt Arena Online Store',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          _loginButton(context),
          const SizedBox(height: 12),
          _googleSignup(context),
          const SizedBox(height: 12),
          _guestUserButton(context),
          const SizedBox(height: 30),
          _signupLine(),
        ],
      ),
    );
  }

  InkWell _googleSignup(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Utilities.borderRadius),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Utilities.padding / 2,
          horizontal: Utilities.padding * 2.5,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: const Text(
          'Sign in with Google',
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Row _signupLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('''Don't have a account? '''),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SignupScreen.routeName);
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }

  InkWell _guestUserButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Utilities.borderRadius),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Utilities.padding / 2,
          horizontal: Utilities.padding * 3,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: const Text(
          'Sign in as a guest',
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  GestureDetector _loginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(LoginScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Utilities.padding / 2,
          horizontal: Utilities.padding * 7,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
