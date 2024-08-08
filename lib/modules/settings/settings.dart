import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final List<String> _languages = ["English", "عربي"];
  final List<String> _modes = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.language,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            hintText: 'Select job role',
            items: _languages,
            initialItem: provider.currentLanguage == "en"
                ? _languages[0]
                : _languages[1],
            onChanged: (value) {
              if (value == "English") {
                provider.changeCurrentLanguage("en");
              }
              if (value == "عربي") {
                provider.changeCurrentLanguage("ar");
              }
              log('changing value to: $value');
            },
            //(0xff141A2E)
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? const Color(0xff141A2E) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
              expandedFillColor:
                  provider.isDark() ? const Color(0xff141A2E) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            lang.theme_mode,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomDropdown<String>(
            hintText: 'Select job role',
            items: _modes,
            initialItem:
                provider.currentMode == ThemeMode.light ? _modes[0] : _modes[1],
            onChanged: (value) {
              if (value == "Light") {
                provider.changeCurrentMode(ThemeMode.light);
              }
              if (value == "Dark") {
                provider.changeCurrentMode(ThemeMode.dark);
              }
              log('changing value to: $value');
            },
            decoration: CustomDropdownDecoration(
              closedFillColor:
                  provider.isDark() ? const Color(0xff141A2E) : Colors.white,
              closedSuffixIcon: Icon(
                Icons.keyboard_arrow_down,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
              expandedFillColor:
                  provider.isDark() ? const Color(0xff141A2E) : Colors.white,
              expandedSuffixIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                color:
                    provider.isDark() ? theme.primaryColorDark : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
