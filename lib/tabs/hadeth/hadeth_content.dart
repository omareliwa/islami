import 'package:assignment2/app_theme.dart';
import 'package:assignment2/tabs/hadeth/hadeth.dart';
import 'package:assignment2/tabs/setting/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatelessWidget {
  const HadethContentScreen({super.key});

  static const String routName = '/hadeth_content_screen';

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

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
          // title: Text(hadeth.suraName),
          title: const Text('اسلامي'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Stack(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hadeth.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: settingProvider.isDark
                                ? AppTheme.gold
                                : AppTheme.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.play_arrow,
                          color: settingProvider.isDark
                              ? AppTheme.black
                              : AppTheme.white,
                        )),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: settingProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  endIndent: 50,
                  indent: 50,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.07,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: settingProvider.isDark
                    ? AppTheme.darkPrimary
                    : AppTheme.white,
              ),
              child: ListView.builder(
                itemBuilder: (_, index) => Text(
                  hadeth.content[index],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                itemCount: hadeth.content.length,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
