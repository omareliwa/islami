// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment2/tabs/hadeth/hadeth_tab.dart';
import 'package:assignment2/tabs/quran/quran_tab.dart';
import 'package:assignment2/tabs/radio/radio_tab.dart';
import 'package:assignment2/tabs/sebha/sebha_tab.dart';
import 'package:assignment2/tabs/setting/setting_tab.dart';
import 'package:flutter/material.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اسلامي'),
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
                label: 'Radio',
              ),
                BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_sebha.png'),
                ),
                label: 'Sebha',
              ),
                BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_hadeth.png'),
                ),
                label: 'Hadeth',
              ),
                BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/icon_quran.png'),
                ),
                label: 'Quran',
              ),
                BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ]),
      ),
    );
  }
}
