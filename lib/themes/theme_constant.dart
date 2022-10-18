import 'package:flutter/material.dart';
import 'package:to_do_lists/themes/td_colors.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    cardColor: tdBlack,
    dividerColor: tdRed,
    backgroundColor: const Color(0xFFF9F5ED),
    scaffoldBackgroundColor: tdBgColor,
    colorScheme: const ColorScheme.light(primary: tdBlack),
    primaryColor: tdBgColor,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: tdBlack),
        backgroundColor: tdBgColor,
        foregroundColor: tdBlack),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.white,
    backgroundColor: const Color(0xff323639),
    dividerColor: const Color(0xff03203C),
    scaffoldBackgroundColor: tdGrey,
    colorScheme: const ColorScheme.dark(primary: tdBgColor),
    primaryColor: tdGrey,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: tdBgColor),
        backgroundColor: tdGrey,
        foregroundColor: tdBgColor),
  );
}
