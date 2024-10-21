import 'package:assignment2/app_theme.dart';
import 'package:assignment2/home_screen.dart';
import 'package:assignment2/tabs/hadeth/hadeth_content.dart';
import 'package:assignment2/tabs/quran/sura_content_screen.dart';
import 'package:assignment2/tabs/setting/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingProvider(), child: IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraContentScreen.routeName: (_) => const SuraContentScreen(),
        HadethContentScreen.routName: (_) => HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingProvider.themeMode,
    );
  }
}
