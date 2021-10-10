import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final Brightness brightness =
          SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.orange,
    dividerTheme: const DividerThemeData(color: Colors.orange, thickness: 0.5),
    colorScheme: const ColorScheme.dark(
      primary: Colors.orange,
      secondary: Colors.red,
    ),
  );

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade300,
    primaryColor: Colors.orange,
    dividerTheme: const DividerThemeData(color: Colors.orange, thickness: 0.5),
    colorScheme: const ColorScheme.light(
      primary: Colors.orange,
      secondary: Colors.red,
    ),
  );
}
