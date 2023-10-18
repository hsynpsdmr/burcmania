import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  static const _fontFamily = 'POPPINS';

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: _fontFamily,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light()
            .appBarTheme
            .copyWith(color: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black87, size: 21), systemOverlayStyle: SystemUiOverlayStyle.dark),
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Colors.black12,
            labelStyle: TextStyle(),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            // border: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            focusedBorder: OutlineInputBorder()),
        scaffoldBackgroundColor: const Color(0xfff1f3f8),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: const ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.apply(fontFamily: _fontFamily);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight!.black, //xx
        primaryContainer: Colors.white,
        secondaryContainer: colorSchemeLight!.azure,
        secondary: Colors.green,
        surface: Colors.blue, //xx
        background: const Color(0xfff6f9fc), //xx
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
