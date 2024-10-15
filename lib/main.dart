import 'package:assignment2/app_theme.dart';
import 'package:assignment2/home_screen.dart';
import 'package:assignment2/tabs/hadeth/hadeth_content.dart';
import 'package:assignment2/tabs/quran/sura_content_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) =>  HomeScreen(),
        SuraContentScreen.routeName: (_) =>  SuraContentScreen(),
        HadethContentScreen.routName:(_)=>HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
