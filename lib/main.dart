import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volt_arena_app/providers/bottom_navigation_bar_provider.dart';
import 'package:volt_arena_app/screens/cart_screen/cart_screen.dart';
import 'package:volt_arena_app/screens/wishlist_screen/wishlist_screen.dart';
import 'configs/theme.dart';
import 'database/user_local_data.dart';
import 'providers/cart_provider.dart';
import 'providers/favs_provider.dart';
import 'providers/orders_provider.dart';
import 'providers/products.dart';
import 'screens/main_screen/main_screen.dart';
import 'screens/auth/landing_screen/landing_screen.dart';
import 'screens/auth/login_screen/login_screen.dart';
import 'screens/auth/signup_screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  UserLocalData.init();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
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
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationBarProvider>.value(
          value: BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider<CartProvider>.value(value: CartProvider()),
        ChangeNotifierProvider<FavsProvider>.value(value: FavsProvider()),
        ChangeNotifierProvider<OrdersProvider>.value(value: OrdersProvider()),
        ChangeNotifierProvider<Products>.value(value: Products()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider theme, _) => MaterialApp(
          title: 'Volt Arena',
          themeMode: theme.themeMode,
          theme: MyThemes.light,
          darkTheme: MyThemes.dark,
          home: (UserLocalData.getUserUID == '')
              ? const LandingScreen()
              : const MainScreen(),
          routes: <String, WidgetBuilder>{
            LandingScreen.routeName: (_) => const LandingScreen(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            SignupScreen.routeName: (_) => const SignupScreen(),
            MainScreen.routeName: (_) => const MainScreen(),
            CartScreen.routeName: (_) => const CartScreen(),
            WishListScreen.routeName: (_) => const WishListScreen(),
          },
        ),
      ),
    );
  }
}

// Certificate fingerprints:
//   SHA1: F6:3C:6E:07:37:98:D1:37:8D:8D:AD:2B:80:BE:5E:2C:50:EF:71:F9
//   SHA256: B8:1F:B2:FF:CB:2E:A2:45:12:1B:22:43:35:C5:B6:CC:A5:3B:CE:D4:6B:97:
// 93:EF:76:D9:81:0F:F9:16:4C:6E
