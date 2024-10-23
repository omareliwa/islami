import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  bool _isDark = false;

  String langCode = 'en';

//  late  Locale _locale;
//
  // Locale get langCode => langCode;

  bool get isDark => _isDark;

  String get backgroundImageName => isDark ? 'dark_bg' : 'default_bg';

  String get bodySebha => isDark
      ? 'assets/image/body_sebha_dark.png'
      : 'assets/image/body_sebha_logo.png';

  String get headSebha => isDark
      ? 'assets/image/head_sebha_dark.png'
      : 'assets/image/head_sebha_logo.png';

  SettingProvider() {
    loadThemePreference();
  }

  //  getLocale() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final langeCode = prefs.getString('langeCode') ?? "en";
  //   _locale = Locale(langeCode);
  //   notifyListeners();
  // }
  //
  //  setLocale() async {
  //   _locale = locale;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('langeCode', locale.languageCode);
  //   notifyListeners();
  // }

  void loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  void changeTheme() async {
    _isDark = !_isDark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDark);
    notifyListeners();
  }

  changeLang(String selectedLang) {
    if (selectedLang == langCode) return;
    langCode = selectedLang;

    notifyListeners();
  }
}
