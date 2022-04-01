import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nareru/state/exercise-nav-notifier.dart';
import 'package:nrs_flutter_lib/widgets/n-navigation-header.dart';

class NavHeaderWrapper extends StatelessWidget {
  final ExerciseNavNotifier navNotifier;

  const NavHeaderWrapper({
    Key? key,
    required this.navNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NNavigationHeader(
        setPrevious: navNotifier.setPrevious,
        setNext: navNotifier.setNext,
        clear: navNotifier.clearInput,
        getProgressPercentage: navNotifier.getProgressPercentage,
        previousText: AppLocalizations.of(context)!.previous,
        nextText: AppLocalizations.of(context)!.next,
        clearText: AppLocalizations.of(context)!.clear,
        exerciseText: AppLocalizations.of(context)!.exercise);
  }
}
