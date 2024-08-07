import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/moduls/hadith/hadith_details.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    if (hadithDataList.isEmpty) loadHadithData();

    return Column(
      children: [
        Image.asset(
          "assets/icons/hadith_header.png",
          scale: 3,
        ),
        const Divider(
          thickness: 2,
        ),
        Text(
          "الأحاديث",
          style: theme.textTheme.bodyLarge,
        ),
        const Divider(
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadithDetails.routeName,
                    arguments: hadithDataList[index],
                  );
                },
                child: Text(
                  hadithDataList[index].title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    height: 1.8,
                  ),
                ),
              );
            },
            itemCount: hadithDataList.length,
          ),
        ),
      ],
    );
  }

  Future<void> loadHadithData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadithDataList = content.split("#");
    for (int i = 0; i < allHadithDataList.length; i++) {
      String singleHadithData = allHadithDataList[i].trim();
      int indexLength = singleHadithData.indexOf("\n");
      String title = singleHadithData.substring(0, indexLength);
      String body = singleHadithData.substring(indexLength + 1);

      HadithData hadithData = HadithData(
        title: title,
        body: body,
      );
      hadithDataList.add(hadithData);
      setState(() {});
    }
  }
}

class HadithData {
  final String title;
  final String body;

  HadithData({required this.title, required this.body});
}
