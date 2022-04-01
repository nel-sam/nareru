import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nareru/widgets/shared/ad-card.dart';
import 'package:nareru/widgets/shared/nar-footer-menu.dart';
import 'package:nareru/widgets/suuji-exercise/jikan/jikan-exercise.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-button.dart';
import 'package:nrs_flutter_lib/widgets/n-menu-header.dart';

class NumbersMenu extends StatelessWidget {
  const NumbersMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AdCard(),
              NMenuHeader(
                  icon: Icons.widgets_outlined,
                  transLabel: AppLocalizations.of(context)!.numbers,
                  label: '数字（すうじ）'),
              Column(
                children: [
                  NMenuButton(
                    destination: JikanExercise(),
                    label: AppLocalizations.of(context)!.time,
                    transLabel: '時間（じかん）',
                  ),
                  // TODO: Uncomment below
                  // NMenuButton(
                  //   destination: AgeExercise(),
                  //   label: AppLocalizations.of(context)!.age,
                  //   transLabel: '年（とし）',
                  // ),
                  // NMenuButton(
                  //   destination: CountingExercise(),
                  //   label: AppLocalizations.of(context)!.counting,
                  //   transLabel: '数える（かぞえる）',
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [NarMenuFooter(activeIndex: 1)],
    );
  }
}
