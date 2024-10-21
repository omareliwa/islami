import 'package:assignment2/tabs/setting/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import 'language.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  List<Language> language = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Theme',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingProvider.isDark,
                onChanged: (isDark) => settingProvider
                    .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: AppTheme.gold,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButton<Language>(
                value: language.first,
                items: language
                    .map((language) => DropdownMenuItem(
                          value: language,
                          child: Text(language.name,
                              style: Theme.of(context).textTheme.titleLarge),
                        ))
                    .toList(),
                onChanged: (selectedLanguage) {
                  //  if (selectedLanguage != null) print(selectedLanguage.code);
                },
                borderRadius: BorderRadius.circular(20),
                dropdownColor: settingProvider.isDark
                    ? AppTheme.darkPrimary
                    : AppTheme.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
