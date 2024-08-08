import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/modules/hadith/hadith_view.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:islami_app/modules/radio/radio_view.dart';
import 'package:islami_app/modules/sebha/sebha_view.dart';
import 'package:islami_app/modules/settings/settings.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          provider.getBackgroundImage(),
        ),
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
