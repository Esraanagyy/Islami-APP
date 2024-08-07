import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/theme/app_theme_data.dart';
import 'package:islami_app/moduls/hadith/hadith_view.dart';
import 'package:islami_app/moduls/quran/quran_view.dart';
import 'package:islami_app/moduls/radio/radio_view.dart';
import 'package:islami_app/moduls/sebha/sebha_view.dart';
import 'package:islami_app/moduls/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutView extends StatefulWidget {
  static String routeName = "layout";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;

  List<Widget> screensList = [
    const QuranView(),
    const HadithView(),
    const SebhaView(),
    const RadioView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            lang.islami,
          ),
          centerTitle: true,
        ),
        body: screensList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage("assets/icons/quran.png")),
              label: lang.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage("assets/icons/hadith.png")),
              label: lang.hadith,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage("assets/icons/sebha.png")),
              label: lang.sebha,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage("assets/icons/radio.png")),
              label: lang.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: lang.settings,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
