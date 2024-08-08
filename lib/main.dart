import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/core/theme/app_theme_data.dart';
import 'package:islami_app/modules/hadith/hadith_details.dart';
import 'package:islami_app/modules/quran/quran_details_view.dart';
import 'package:islami_app/modules/splash/splash_view.dart';
import 'package:provider/provider.dart';

import 'layout/layout_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Islami App',
      theme: ApplicationThemeManager.lightTheme,
      themeMode: provider.currentMode,
      darkTheme: ApplicationThemeManager.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(provider.currentLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
        QuranDetails.routeName: (context) => const QuranDetails(),
        HadithDetails.routeName: (context) => const HadithDetails(),
      },
    );
  }
}
