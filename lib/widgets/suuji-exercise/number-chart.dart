import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nareru/widgets/suuji-exercise/number-card.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class NumberChart extends StatefulWidget {
  const NumberChart({Key? key}) : super(key: key);

  @override
  State<NumberChart> createState() => _NumberChartState();
}

class _NumberChartState extends State<NumberChart> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Nrs.NrsAppBar(
          title: AppLocalizations.of(context)!.numberChart,
          context: context,
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                getNativeNumberChart(context),
                SizedBox(
                  height: 40,
                ),
                getSinoNumberChart(context)
              ],
            ),
          ),
        ));
  }

  getNativeNumberChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.nativeNumbers),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberCard(number: '1', hiragana: 'ひとつ', kanji: '一つ'),
              NumberCard(number: '2', hiragana: 'ふたつ', kanji: '二つ'),
              NumberCard(number: '2', hiragana: 'ふたつ', kanji: '二つ'),
              NumberCard(number: '3', hiragana: 'みっつ', kanji: '三つ'),
              NumberCard(number: '4', hiragana: 'よっつ', kanji: '四つ'),
              NumberCard(number: '5', hiragana: 'いつつ', kanji: '五つ'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberCard(number: '6', hiragana: 'むっつ', kanji: '六つ'),
              NumberCard(number: '7', hiragana: 'ななつ', kanji: '七つ'),
              NumberCard(number: '8', hiragana: 'やっつ', kanji: '八つ'),
              NumberCard(number: '9', hiragana: 'ここのつ', kanji: '九つ'),
              NumberCard(number: '10', hiragana: 'とう', kanji: '十'),
            ],
          ),
        ],
      ),
    );
  }

  getSinoNumberChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.sinoNumbers),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberCard(number: '0', hiragana: 'れい、ゼロ、マル', kanji: '零'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberCard(number: '1', hiragana: 'いち', kanji: '一'),
              NumberCard(number: '2', hiragana: 'に', kanji: '二'),
              NumberCard(number: '3', hiragana: 'さん', kanji: '三'),
              NumberCard(number: '4', hiragana: 'よん, し', kanji: '四'),
              NumberCard(number: '5', hiragana: 'ご', kanji: '五'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberCard(number: '6', hiragana: 'ろく', kanji: '六'),
              NumberCard(number: '7', hiragana: 'なな, しち', kanji: '七'),
              NumberCard(number: '8', hiragana: 'はち', kanji: '八'),
              NumberCard(number: '9', hiragana: 'きゅう, く', kanji: '九'),
              NumberCard(number: '10', hiragana: 'じゅう', kanji: '十'),
            ],
          ),
        ],
      ),
    );
  }
}
