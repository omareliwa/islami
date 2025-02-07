import 'package:assignment2/app_theme.dart';
import 'package:assignment2/tabs/quran/quran_tab.dart';
import 'package:assignment2/tabs/setting/setting_provider.dart';
import 'package:assignment2/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = '/sura-content';

  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
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
          // title: Text(args.suraName),
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
                      args.suraName,
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
              child: // ayat.isEmpty
                  // ? const LoadingIndicator()
                  //:
                  ListView.builder(
                itemBuilder: (_, index) => Text(
                  ayat[index],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                itemCount: ayat.length,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    // await Future.delayed(
    // const Duration(seconds: 2),
    // );
    String sura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = sura.split('\n');
    setState(() {});
  }
}
