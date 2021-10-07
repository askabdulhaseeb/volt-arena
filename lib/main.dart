import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/configs/theme.dart';
import 'screens/auth/landing_screen/landing_screen.dart';
import 'screens/auth/login_screen/login_screen.dart';
import 'screens/auth/signup_screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) => MaterialApp(
          title: 'Volt Arena',
          themeMode: theme.themeMode,
          theme: MyThemes.light,
          darkTheme: MyThemes.dark,
          home: const LandingScreen(),
          routes: <String, WidgetBuilder>{
            LandingScreen.routeName: (_) => const LandingScreen(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            SignupScreen.routeName: (_) => const SignupScreen(),
          },
        ),
      ),
    );
  }
}
