import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/settings_provider.dart';
import 'hadith_view.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = "HadithDetails";

  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadithData;
    var provider = Provider.of<SettingsProvider>(context);

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
            child: Column(children: [
              Text(
                data.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color:
                      provider.isDark() ? theme.primaryColorDark : Colors.black,
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      data.body,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: provider.isDark()
                            ? theme.primaryColorDark
                            : Colors.black,
                      ),
                    ),
                  ),
                  itemCount: 1,
                ),
              ),
            ]),
          ),
        ));
  }
}
