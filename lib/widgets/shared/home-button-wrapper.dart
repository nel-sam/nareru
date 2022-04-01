import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nrs_flutter_lib/widgets/n-home-button.dart';

class HomeButtonWrapper extends StatelessWidget {
  final bool isActive;

  const HomeButtonWrapper({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!.home;
    return NHomeButton(
      homeLabel: text,
      isActive: isActive,
    );
  }
}
