import 'package:flutter/material.dart';
import 'package:upskill_practices/core/utils/colors.dart';

class UpskillTheme {
  static ThemeData buildLightTheme() {
    ThemeData base = ThemeData.light();
    return base.copyWith(
        colorScheme: ColorScheme(
            primary: kColorOrange,
            primaryVariant: kColorWhite,
            onPrimary: kColorWhite,
            secondary: kColorAccent,
            secondaryVariant: kColorAccent,
            onSecondary: kColorAccent,
            background: kColorWhite,
            onBackground: kColorWhite,
            surface: kColorAccent,
            onSurface: kColorAccent,
            error: Colors.red[700]!,
            onError: Colors.red[700]!,
            brightness: Brightness.light),
        scaffoldBackgroundColor: Colors.white,
        popupMenuTheme: PopupMenuThemeData(color: Colors.white),
        //textSelectionTheme: TextSelectionThemeData(cursorColor:kColorOrange,selectionColor: Colors.deepOrange[100],selectionHandleColor: Colors.deepOrange[100]),
        //primaryColor: kColorAccent,
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
        //accentColor: /*kColorAccent*/kColorOrange,
        //unselectedWidgetColor: kInActiveColor,
        //primaryColorDark: kColorPrimary,
        //backgroundColor: kColorWhite,
        //iconTheme: IconThemeData(color: kColorPrimary),
        /*snackBarTheme: SnackBarThemeData(
            backgroundColor: */ /*kColorGraySecOpacity*/ /* kSnackBarColor),*/
        //primaryColor:darkGreen,
        //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kColorOrange),
        toggleableActiveColor: kColorAccent,
        //primaryIconTheme: const IconThemeData.fallback().copyWith(color: kColorAccent,),
        //cursorColor: kColorOrange,
        // inputDecorationTheme: InputDecorationTheme(
        //     hintStyle: TextStyle(
        //         color: kTextGreyColor,
        //         fontFamily: Strings.kOpenSansBold,
        //         fontSize: 13),
        //     border: UnderlineInputBorder(
        //       borderSide: BorderSide(color: kColorAccent),
        //     )),
        // buttonTheme: ButtonThemeData(
        //     buttonColor: kColorAccent,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(5.0))),
        //     textTheme: ButtonTextTheme.primary),
        // textTheme: TextTheme(
        //   caption: TextStyle(
        //       color: kColorAccent, fontFamily: Strings.kOpenSansRegular),
        //   headline4: TextStyle(
        //       color: kColorBlack, fontFamily: Strings.kOpenSansRegular),
        //   headline3: TextStyle(
        //       color: kColorBlack, fontFamily: Strings.kOpenSansSemiBold),
        //   headline2: TextStyle(
        //       color: kColorAccent, fontFamily: Strings.kOpenSansBold),
        //   headline1: TextStyle(
        //       color: kColorPrimary, fontFamily: Strings.kOpenSansBold),
        //   headline6: TextStyle(
        //       color: kColorPrimary, fontFamily: Strings.kOpenSansSemiBold),
        //   subtitle2: TextStyle(
        //       color: kColorAccent, fontFamily: Strings.kOpenSansBold),
        //   button: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: kColorPrimary,
        //       fontFamily: Strings.kOpenSansBold),
        //   bodyText2: TextStyle(
        //       color: kColorPrimary, fontFamily: Strings.kOpenSansBold),
        //   //drawer
        //   bodyText1: TextStyle(
        //       color: kColorPrimary, fontFamily: Strings.kOpenSansBold),
        //   subtitle1: TextStyle(
        //       color: kColorPrimary, fontFamily: Strings.kTextOpenSansRegular,fontSize: 12),
        //   // subtitle1: TextStyle(
        //   //     color: kColorPrimary, fontFamily: Strings.kTextOpenSansRegular,fontSize: 12),
        // ),
        // tabBarTheme: TabBarTheme(
        //   //indicator: BoxDecoration(color: kColorWhite),
        //   labelColor: kColorAccent,
        //   unselectedLabelColor: kColorAccent,
        //   unselectedLabelStyle: TextStyle(
        //       color: kColorPrimary,
        //       fontSize: 14,
        //       fontFamily: Strings.kOpenSansSemiBold),
        //   labelStyle: TextStyle(
        //       color: kColorPrimary,
        //       fontSize: 14,
        //       fontFamily: Strings.kOpenSansSemiBold),
        // ),
        cardColor: kColorWhite,
        cardTheme: const CardTheme(color: Colors.white, elevation: 2.0),
        appBarTheme: const AppBarTheme(
          color: Colors.black87,
          brightness: Brightness.light,
          //iconTheme: IconThemeData(color: kColorPrimary),
          centerTitle: false,
          /* textTheme: TextTheme(
                headline6: TextStyle(
                    color: kColorPrimary,
                    fontSize: 18,
                    fontFamily: Strings.kOpenSansSemiBold))*/
        ));
  }

  static ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        colorScheme: ColorScheme(
            primary: kColorOrange,
            primaryVariant: kColorWhite,
            onPrimary: kColorWhite,
            secondary: kColorWhite,
            secondaryVariant: kColorWhite,
            onSecondary: kColorWhite,
            background: kDarkBackgroundColor,
            onBackground: kDarkBackgroundColor,
            surface: kColorWhite,
            onSurface: kColorWhite,
            error: Colors.red[700]!,
            onError: Colors.red[700]!,
            brightness: Brightness.dark),
        //scaffoldBackgroundColor: kDarkBackgroundColor,
        popupMenuTheme:
            const PopupMenuThemeData(color: Color.fromRGBO(54, 54, 54, 1)),
        //textSelectionTheme: TextSelectionThemeData(cursorColor: kColorOrange,selectionColor: Color(0xFFf3723f),selectionHandleColor: Color(0xFFf3723f)),
        iconTheme: const IconThemeData(color: kColorWhite),
        //accentColor: /*kColorPrimaryDark*/kColorOrange,
        primaryColorDark: kColorWhite,
        //primaryColor: kColorAccent2,
        primaryColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        //unselectedWidgetColor: kColorGraySecOpacity,
        ///backgroundColor: kColorFontGrey,
        //cursorColor: kColorOrange,
        /*inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
                color: kTextGreyColor,
                fontFamily: Strings.kOpenSansRegular,
                fontSize: 13),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: kBorderColor),
            )),
        focusColor: kBorderColor,
        snackBarTheme: SnackBarThemeData(backgroundColor: Colors.white),
        //cardColor:Colors.grey[800]  ,

        //buttonTheme: ButtonThemeData(buttonColor: kColorWhite,textTheme:ButtonTextTheme.primary),
        //primaryColor:darkGreen,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kColorOrange),
        buttonTheme: ButtonThemeData(
            buttonColor: kColorAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            textTheme: ButtonTextTheme.primary),
        textTheme: TextTheme(
          caption: TextStyle(
              color: kColorAccent2, fontFamily: Strings.kOpenSansRegular),
          headline4: TextStyle(
              color: kColorAccent2, fontFamily: Strings.kOpenSansBold),
          headline3: TextStyle(
              color: kColorAccent2, fontFamily: Strings.kOpenSansBold),
          headline2: TextStyle(
              color: kColorAccent2, fontFamily: Strings.kOpenSansBold),
          headline6: TextStyle(
              color: Colors.white, fontFamily: Strings.kOpenSansSemiBold),
          subtitle2: TextStyle(
              color: kColorWhite, fontFamily: Strings.kOpenSansBold),
          button: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: Strings.kOpenSansBold),
          bodyText2: TextStyle(
              color: Colors.white, fontFamily: Strings.kOpenSansBold),
          //drawer
          bodyText1: TextStyle(
              color: kColorBlack, fontFamily: Strings.kOpenSansBold),
          headline1: TextStyle(
              color: Colors.white, fontFamily: Strings.kOpenSansBold),
          subtitle1: TextStyle(
              color: Colors.white, fontFamily: Strings.kTextOpenSansRegular,fontSize: 12),
          // subtitle1: TextStyle(
          //     color: Colors.white, fontFamily: Strings.kTextOpenSansRegular,fontSize: 12),
        ),
        tabBarTheme: TabBarTheme(
          //indicator: BoxDecoration(color: kColorWhite),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: Strings.kOpenSansBold),
          labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: Strings.kOpenSansBold),
        ),*/
        cardColor: /*kDefaultCardColor*/ kCardDarkThemeColor,
        cardTheme: const CardTheme(color: kCardDarkThemeColor, elevation: 2.0),
        appBarTheme: const AppBarTheme(
          color: kDarkAppBarColor,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: kColorWhite),
          centerTitle: false,
        ),
    );
  }

  static TextStyle appBarFontSize(BuildContext context) {
    return Theme.of(context)
        .appBarTheme
        .toolbarTextStyle!
        .copyWith(fontSize: 18);
  }

  static TextStyle tabBarFontSize(BuildContext context) {
    return Theme.of(context)
        .appBarTheme
        .textTheme!
        .headline6!
        .copyWith(fontSize: 11);
  }

  static TextStyle tabBarFontSize2(BuildContext context) {
    return Theme.of(context)
        .appBarTheme
        .textTheme!
        .headline6!
        .copyWith(fontSize: 9);
  }

  static isDarkModeOn(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }
}
