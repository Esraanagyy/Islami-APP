import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentMode = ThemeMode.dark;

  changeCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;

    notifyListeners();
  }

  changeCurrentMode(ThemeMode newThemeMode) {
    if (currentMode == newThemeMode) return;
    currentMode = newThemeMode;
    notifyListeners();
  }

  String getBackgroundImage() {
    return currentMode == ThemeMode.dark
        ? "assets/images/home_dark_background.png"
        : "assets/images/background.png";
  }

  String getSplashImage() {
    return currentMode == ThemeMode.dark
        ? "assets/images/dark_splash.png"
        : "assets/images/splash_screen.png";
  }

  bool isDark() {
    return (currentMode == ThemeMode.dark);
  }
}
