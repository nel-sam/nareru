import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nareru/constants.dart';
import 'package:nareru/widgets/menus/numbers-menu.dart';
import 'package:nareru/widgets/shared/home-button-wrapper.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';

class NarMenuFooter extends StatelessWidget {
  final int activeIndex;

  const NarMenuFooter({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NFooterMenu(
      buttons: [
        HomeButtonWrapper(),
        NFooterButton(
          text: AppLocalizations.of(context)!.numbers,
          icon: NarIcons.numbers,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NumbersMenu(),
              ),
            );
          },
        ),
      ],
    );
  }
}
