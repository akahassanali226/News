import 'package:flutter/material.dart';
import 'package:news/core/source/local/prefs_manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  init() {
    mode = PrefsManager.getTheme();
  }

  changeTheme(ThemeMode newMode) {
    mode = newMode;
    notifyListeners();
  }
}
