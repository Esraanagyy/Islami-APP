import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/moduls/quran/quran_view.dart';

class SuraTitle extends StatelessWidget {
  final SuraData data;

  const SuraTitle({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(children: [
      Expanded(
        child: Text(
          data.suraNumber,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 35, child: VerticalDivider()),
      Expanded(
        child: Text(
          data.suraName,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
