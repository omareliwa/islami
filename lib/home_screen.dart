// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment2/tabs/hadeth/hadeth_tab.dart';
import 'package:assignment2/tabs/quran/quran_tab.dart';
import 'package:assignment2/tabs/radio/radio_tab.dart';
import 'package:assignment2/tabs/sebha/sebha_tab.dart';
import 'package:assignment2/tabs/setting/setting_provider.dart';
import 'package:assignment2/tabs/setting/setting_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const RadioTab(),
    SebhaTab(),
    HadethTab(),
    QuranTab(),
    const SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/image/${Provider.of<SettingProvider>(context).backgroundImageName}.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_radio.png'),
                ),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_sebha.png'),
                ),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_hadeth.png'),
                ),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_quran.png'),
                ),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: AppLocalizations.of(context)!.setting,
              ),
            ]),
      ),
    );
  }
}
