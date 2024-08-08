import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/settings_provider.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:provider/provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "QuranDetails";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var provider = Provider.of<SettingsProvider>(context);

    loadQuranData(data.suraNumber);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getBackgroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "إسلامي",
          ),
          centerTitle: true,
        ),
        body: Container(
          margin:
              const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 70),
          padding:
              const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 80),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? const Color(0xff141A2E).withOpacity(0.8)
                : const Color(0xfff8f8f8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " سورة ${data.suraName}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: provider.isDark()
                          ? theme.primaryColorDark
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Icon(
                    Icons.play_circle_fill_rounded,
                    color: provider.isDark()
                        ? theme.primaryColorDark
                        : Colors.black,
                  )
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      " {${index + 1}} ${versesList[index]}",
                      textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: provider.isDark()
                              ? theme.primaryColorDark
                              : Colors.black,
                        )),
                  ),
                  itemCount: versesList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> versesList = [];

  Future<void> loadQuranData(String suraNumber) async {
    String content =
        await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = content.split("\n");
    setState(() {});
  }
}
