import 'package:assignment2/app_theme.dart';
import 'package:assignment2/tabs/setting/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;
  double turns = 0;

  List<String> sebhaList = [
    "سبحان اللَه",
    "الحمد للًه ",
    "اللَّهُ أَكْبَرُ",
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.01,
          horizontal: MediaQuery.sizeOf(context).height * 0.05,
        ),
        child: Column(
          children: [
            Image.asset(
              Provider.of<SettingProvider>(context).headSebha,
              height: MediaQuery.sizeOf(context).height * 0.120,
              width: MediaQuery.sizeOf(context).height * 0.17,
            ),
            InkWell(
                onTap: () {
                  turns += 1 / 30;
                  counterSebha();
                  setState(() {});
                },
                child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(microseconds: 1),
                  child: Image.asset(
                    Provider.of<SettingProvider>(context).bodySebha,
                    height: MediaQuery.sizeOf(context).height * 0.26,
                    width: MediaQuery.sizeOf(context).height * 0.56,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: settingProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  borderRadius: BorderRadius.circular(15)),
              height: 85,
              width: 65,
              child: Center(
                  child: Text(
                '$counter',
                style: TextStyle(
                    color: settingProvider.isDark
                        ? AppTheme.black
                        : AppTheme.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: settingProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  borderRadius: BorderRadius.circular(20)),
              height: 45,
              width: 150,
              child: Center(
                  child: Text(
                sebhaList[index],
                style: TextStyle(
                    color: settingProvider.isDark
                        ? AppTheme.black
                        : AppTheme.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              )),
            ),
          ],
        ));
  }

  void counterSebha() {
    counter++;
    if (counter % 33 == 0) {
      index = (index + 1) % sebhaList.length;
    }
  }
}
