import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'application/lang/lang.dart';
import 'domain/core/const.dart';
import 'localizations.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String langCode = Provider.of<LangModel>(context).langCode;

    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale(LANG_EN),
        const Locale(LANG_PL),
      ],
      debugShowCheckedModeBanner: false,
      locale: langCode != null ? Locale(langCode) : null,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: BLACK_COLOR,
        backgroundColor: WHITE_COLOR,
        errorColor: ERROR_COLOR,
        brightness: Brightness.light,
        canvasColor: PRIMARY_COLOR,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
            color: PRIMARY_COLOR,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: TEXT_COLOR,
          ),
          headline3: GoogleFonts.poppins( //error
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: BLACK_COLOR,
          ),
          headline4: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: TEXT_COLOR,
          ),
          headline5: GoogleFonts.poppins(
            color: TEXT_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headline6: GoogleFonts.poppins(
            color: TEXT_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: GoogleFonts.poppins(
            color: TEXT_COLOR,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: GoogleFonts.poppins(
            color: PRIMARY_COLOR,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          button: GoogleFonts.poppins(
            color: SUCCESS_COLOR,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          bodyText1: GoogleFonts.poppins(),
          bodyText2: GoogleFonts.poppins(),

        ),
      ),
      home: SplashScreen(),
    );
  }
}