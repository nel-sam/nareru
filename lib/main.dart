import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nareru/constants.dart';
import 'package:nareru/widgets/menus/main-menu.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: APP_NAME,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('es', ''),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: ACCENT_COLOR,
        ),
        darkTheme: ThemeData(
          primarySwatch: ACCENT_COLOR,
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          backgroundColor: const Color(0xFF212121),
          dividerColor: Colors.black12,
        ),
        home: MyHomePage(title: APP_NAME));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Nrs.NrsAppBar(
        title: widget.title,
        context: context,
      ),
      body: Center(
        child: MainMenu(),
      ),
    );
  }
}
