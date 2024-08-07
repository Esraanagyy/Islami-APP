import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/app_theme_data.dart';
import 'package:islami_app/moduls/hadith/hadith_details.dart';
import 'package:islami_app/moduls/hadith/hadith_view.dart';
import 'package:islami_app/moduls/quran/quran_details_view.dart';
import 'package:islami_app/moduls/splash/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/layout_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      theme: ApplicationThemeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: const Locale("en"),
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
