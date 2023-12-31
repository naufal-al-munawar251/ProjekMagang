import 'package:flutter/material.dart';

class AppStyle {
  static const Color red500 = Color(0xFF0B81D5);
  static const Color yellow500 = Color(0xFFFFF000);

  /*
  * Generator site
  * http://mcg.mbitson.com/
  * */
  static const MaterialColor appTheme = MaterialColor(_appthemePrimaryValue, <int, Color>{
    50: Color(0xFFFCE4E5),
    100: Color(0xFFA1D4FF),
    200: Color(0xFF58B8FF),
    300: Color(0xFF1C9BFA),
    400: Color(0xFF0B81D5),
    500: Color(_appthemePrimaryValue),
    600: Color(0xFF0B81D5),
    700: Color(0xFF0B81D5),
    800: Color(0xFF0B81D5),
    900: Color(0xFF0B81D5),
  });
  static const int _appthemePrimaryValue = 0xFFE62129;

  static const MaterialColor appthemeAccent = MaterialColor(_appThemeAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_appThemeAccentValue),
    400: Color(0xFFA1D4FF),
    700: Color(0xFF58B8FF),
  });
  static const int _appThemeAccentValue = 0xFFFFCDCD;

  static BorderRadius borderRadiusVerySmall() => BorderRadius.circular(4.0);
  static BorderRadius borderRadiusSmall() => BorderRadius.circular(8.0);
  static BorderRadius borderRadiusMedium() => BorderRadius.circular(20.0);

  static InputDecoration textInputDecorator({String? hint, Widget? icon, Widget? iconSuffix, Color? enableBorderColor, Color? focusBorderColor, bool isEnable = true }) =>
      InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: icon != null ? Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(14),
          child: icon,
        ) : null,
        suffixIcon: iconSuffix != null ? Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(14),
          child: iconSuffix,
        ) : null,
        filled: true,
        fillColor: isEnable ? Colors.white : Colors.grey.shade400,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: enableBorderColor ?? Colors.grey.shade200, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: focusBorderColor ?? Colors.grey, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: focusBorderColor ?? Colors.blue, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadiusVerySmall(),
          borderSide: BorderSide(color: focusBorderColor ?? Colors.blue, width: 2),
        )
      );

}

