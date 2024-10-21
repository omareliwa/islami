import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String langCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backgroundImageName => isDark ? 'dark_bg' : 'default_bg';

  String get bodySebha => isDark
      ? 'assets/image/body_sebha_dark.png'
      : 'assets/image/body_sebha_logo.png';

  String get headSebha => isDark
      ? 'assets/image/head_sebha_dark.png'
      : 'assets/image/head_sebha_logo.png';

  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLang(String selectedLang) {
    langCode = selectedLang;
    notifyListeners();
  }
}
