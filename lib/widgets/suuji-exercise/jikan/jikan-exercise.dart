import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nareru/state/enums.dart';
import 'package:nareru/state/exercise-nav-notifier.dart';
import 'package:nareru/state/jikan/jikan-notifier.dart';
import 'package:nareru/widgets/shared/ad-card.dart';
import 'package:nareru/widgets/shared/home-button-wrapper.dart';
import 'package:nareru/widgets/shared/nav-header-wrapper.dart';
import 'package:nareru/widgets/shared/question-free-form.dart';
import 'package:nareru/widgets/suuji-exercise/jikan/clock.dart';
import 'package:nareru/widgets/suuji-exercise/number-chart.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-answer-status-icon.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';
import 'package:nrs_flutter_lib/widgets/n-info-button.dart';
import 'package:provider/provider.dart';

class JikanExercise extends StatefulWidget {
  // final JikanExerciseState jikanExerciseState;
  // final Function(JikanExerciseState, String) onUserHourSet;
  // final Function(JikanExerciseState, String) onUserMinSet;
  // final Function(JikanExerciseState, String) onUserSecSet;

  const JikanExercise({
    Key? key,
    // required this.jikanExerciseState,
    // required this.onUserHourSet,
    // required this.onUserMinSet,
    // required this.onUserSecSet,
  }) : super(key: key);

  @override
  _JikanExerciseState createState() => _JikanExerciseState();
}

class _JikanExerciseState extends State<JikanExercise> {
  final double textFieldWidth = 70;
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Nrs.NrsAppBar(
            title: AppLocalizations.of(context)!.time, context: context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChangeNotifierProvider<ExerciseNavNotifier>(
                create: (context) => ExerciseNavNotifier(ExerciseType.Jikan),
                child: Consumer<ExerciseNavNotifier>(
                  builder: (context, navNotifier, child) {
                    var s = navNotifier.getActive();

                    return Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        children: [
                          NavHeaderWrapper(navNotifier: navNotifier),
                          Clock(
                            hour: s.hour,
                            minute: s.min,
                            second: s.sec,
                            hourState: s.hourState,
                            minuteState: s.minuteState,
                            secondState: s.secondState,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context)!.typeTheTime),
                              NInfoButton(
                                text: AppLocalizations.of(context)!.timeDesc,
                              ),
                            ],
                          ),
                          ChangeNotifierProvider<JikanNotifier>(
                            create: (context) =>
                                JikanNotifier(navNotifier.getActive),
                            child: Consumer<JikanNotifier>(
                              builder: (context, jikanNotifier, child) {
                                var s = jikanNotifier.getStateItem();
                                // TODO: Make status 3d
                                var isHourCorrect = s.correctHour == s.userHour
                                    ? CorrectStatus.correct
                                    : CorrectStatus.unstarted;
                                var isMinCorrect = s.correctMin == s.userMin
                                    ? CorrectStatus.correct
                                    : CorrectStatus.unstarted;
                                var isSecCorrect = s.correctSec == s.userSec
                                    ? CorrectStatus.correct
                                    : CorrectStatus.unstarted;

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        NAnswerStatusIcon(
                                            status: isHourCorrect),
                                        Container(
                                          width: textFieldWidth,
                                          child: QuestionFreeForm(
                                            activeValue: s.userHour,
                                            hintValue: '',
                                            correctValues: [s.correctHour],
                                            onChanged: (String newVal) =>
                                                jikanNotifier
                                                    .updateHour(newVal),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('시'),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        NAnswerStatusIcon(status: isMinCorrect),
                                        Container(
                                          width: textFieldWidth,
                                          child: QuestionFreeForm(
                                            activeValue: s.userMin,
                                            hintValue: '',
                                            correctValues: [s.correctMin],
                                            onChanged: (String newVal) =>
                                                jikanNotifier.updateMin(newVal),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('분'),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        NAnswerStatusIcon(status: isSecCorrect),
                                        Container(
                                          width: textFieldWidth,
                                          child: QuestionFreeForm(
                                            activeValue: s.userSec,
                                            hintValue: '',
                                            correctValues: [s.correctSec],
                                            onChanged: (String newVal) =>
                                                jikanNotifier.updateSec(newVal),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('초'),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                                // return Padding(
                                //   padding: const EdgeInsets.all(18.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Container(
                                //               width: textFieldWidth,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                   isDense: true,
                                //                   contentPadding:
                                //                       EdgeInsets.fromLTRB(
                                //                           4, 18, 0, 1),
                                //                   enabledBorder:
                                //                       Nar.getTextFieldBorder(
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .correctHour,
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .userHour),
                                //                   focusedBorder:
                                //                       Nar.getTextFieldBorder(
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .correctHour,
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .userHour),
                                //                 ),
                                //                 onChanged: (String? newVal) {
                                //                   if (newVal != null) {
                                //                     setState(() {
                                //                       widget.onUserHourSet(
                                //                           widget
                                //                               .jikanExerciseState,
                                //                           newVal);
                                //                     });
                                //                   }
                                //                 },
                                //                 onTap: () {
                                //                   setState(() {
                                //                     widget.jikanExerciseState
                                //                         .hourState = false;
                                //                     widget.jikanExerciseState
                                //                         .minuteState = true;
                                //                     widget.jikanExerciseState
                                //                         .secondState = true;
                                //                   });
                                //                 },
                                //               )),
                                //           Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         children: [
                                //           Container(
                                //               width: textFieldWidth,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                   isDense: true,
                                //                   contentPadding:
                                //                       EdgeInsets.fromLTRB(
                                //                           4, 18, 0, 1),
                                //                   enabledBorder:
                                //                       Nar.getTextFieldBorder(
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .correctMin,
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .userMin),
                                //                   focusedBorder:
                                //                       Nar.getTextFieldBorder(
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .correctMin,
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .userMin),
                                //                 ),
                                //                 onChanged: (String? newVal) {
                                //                   if (newVal != null) {
                                //                     setState(() {
                                //                       widget.onUserMinSet(
                                //                           widget
                                //                               .jikanExerciseState,
                                //                           newVal);
                                //                     });
                                //                   }
                                //                 },
                                //                 onTap: () {
                                //                   setState(() {
                                //                     widget.jikanExerciseState
                                //                         .hourState = true;
                                //                     widget.jikanExerciseState
                                //                         .minuteState = false;
                                //                     widget.jikanExerciseState
                                //                         .secondState = true;
                                //                   });
                                //                 },
                                //               )),
                                //           Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         children: [
                                //           Container(
                                //               width: textFieldWidth,
                                //               child: TextField(
                                //                 decoration: InputDecoration(
                                //                   isDense: true,
                                //                   contentPadding:
                                //                       EdgeInsets.fromLTRB(
                                //                           4, 18, 0, 1),
                                //                   enabledBorder:
                                //                       Nar.getTextFieldBorder(
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .correctSec,
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .userSec),
                                //                   focusedBorder:
                                //                       Nar.getTextFieldBorder(
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .correctSec,
                                //                           widget
                                //                               .jikanExerciseState
                                //                               .userSec),
                                //                 ),
                                //                 onChanged: (String? newVal) {
                                //                   if (newVal != null) {
                                //                     setState(() {
                                //                       widget.onUserSecSet(
                                //                           widget
                                //                               .jikanExerciseState,
                                //                           newVal);
                                //                     });
                                //                   }
                                //                 },
                                //                 onTap: () {
                                //                   setState(() {
                                //                     widget.jikanExerciseState
                                //                         .hourState = true;
                                //                     widget.jikanExerciseState
                                //                         .minuteState = true;
                                //                     widget.jikanExerciseState
                                //                         .secondState = false;
                                //                   });
                                //                 },
                                //               )),
                                //           Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              AdCard(),
            ],
          ),
        ),
        persistentFooterButtons: [
          NFooterMenu(buttons: [
            HomeButtonWrapper(),
            NFooterButton(
              text: AppLocalizations.of(context)!.numberChart,
              icon: Icons.list,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumberChart()),
                );
              },
            ),
          ])
        ],
      ),
    );
  }
}
