import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'domain/core/const.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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