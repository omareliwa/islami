import 'package:assignment2/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../setting/setting_provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.15,
        horizontal: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/image/radio_image.png',
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).height * 0.5,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'اذاعة القران الكريم',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    color: settingProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.lightPrimary,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: settingProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.lightPrimary,
                    size: 50.0,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                      color: settingProvider.isDark
                          ? AppTheme.gold
                          : AppTheme.lightPrimary,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
