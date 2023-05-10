import 'package:flutter/material.dart';

class Utils {
  static const Color mainGreen = Color.fromRGBO(0, 210, 161, 1);
  static MaterialColor mainColor = MaterialColor(
    mainGreen.value,
    <int, Color>{
      50: mainGreen.withOpacity(0.1),
      100: mainGreen.withOpacity(0.2),
      200: mainGreen.withOpacity(0.3),
      300: mainGreen.withOpacity(0.4),
      400: mainGreen.withOpacity(0.5),
      500: mainGreen.withOpacity(0.6),
      600: mainGreen.withOpacity(0.7),
      700: mainGreen.withOpacity(0.8),
      800: mainGreen.withOpacity(0.9),
      900: mainGreen.withOpacity(1),
    },
  );
}
