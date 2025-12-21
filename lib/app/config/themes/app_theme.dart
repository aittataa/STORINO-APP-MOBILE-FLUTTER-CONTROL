import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";

class AppTheme {
  AppTheme._();

  ///
  static const Color transparent_color = Color(0x00000000);
  static const Color green_color = Color(0xFF0DC600);
  static const Color red_color = Color(0xFFFF2424);
  static const Color yellow_color = Color(0xFFFFEB3B);

  /// TODO : Shadow
  static const Color shadow_color_1 = Color(0xFFAAAAAA);
  static const Color shadow_color_2 = Color(0xFF121212);

  /// TODO : Shimmer Colors
  static const Color base_color = Color(0xFFDDDDDD);
  static const Color highlight_color = Color(0xFFAAAAAA);

  /// TODO : Main colors
  static const Color main_color_1 = Color(0xFF0070F3);

  /// TODO : Borders
  static const Color border_color_1 = Color(0xFF252525);
  static const Color border_color_2 = Color(0xFFFFFFFF);
  static const Color border_color_3 = Color(0xFFB4B4B4);

  /// TODO : Backs
  // static const Color back_color_1 = Color(0xFF252525);
  // static const Color back_color_2 = Color(0xFFFFFFFF);
  // static const Color back_color_3 = Color(0xFFF0F0F0);

  // TODO : Light
  static const Color light_back_color_1 = Color(0xFFF0F0F0);
  static const Color light_back_color_2 = Color(0xFFFFFFFF);

  // TODO : Dark
  static const Color dark_back_color_1 = Color(0xFF252525);
  static const Color dark_back_color_2 = Color(0xFF363636);

  /// TODO : Texts
  static const Color text_color_1 = Color(0xFF252525);
  static const Color text_color_2 = Color(0xFFFFFFFF);
  static const Color text_color_3 = Color(0xFF7E7E7E);

  /// TODO : Icons
  static const Color icon_color_1 = Color(0xFF252525);
  static const Color icon_color_2 = Color(0xFFFFFFFF);
  static const Color icon_color_3 = Color(0xFF7E7E7E);

  /// TODO : Light
  static ThemeData get light {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: light_back_color_1,
      primaryColor: main_color_1,
      splashColor: transparent_color,
      cardColor: transparent_color,
      canvasColor: transparent_color,
      dividerColor: transparent_color,
      colorScheme: const ColorScheme.light(
        primary: main_color_1,
        onPrimary: main_color_1,
        brightness: Brightness.light,
        surface: light_back_color_1,
        onSurface: light_back_color_2,
        outline: border_color_1,
        shadow: shadow_color_1,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: transparent_color,
        titleTextStyle: GoogleFonts.poppins(color: transparent_color),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: transparent_color,
          systemNavigationBarColor: transparent_color,
          systemNavigationBarDividerColor: transparent_color,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(color: text_color_1, fontWeight: FontWeight.bold, letterSpacing: .5, fontSize: 15),
        displayMedium: GoogleFonts.poppins(color: text_color_2, fontWeight: FontWeight.bold, letterSpacing: .5, fontSize: 15),
        displaySmall: GoogleFonts.poppins(color: text_color_3, fontWeight: FontWeight.bold, letterSpacing: .5, fontSize: 15),
      ),
      iconTheme: const IconThemeData(color: icon_color_1, size: 30),
    );
  }

  /// TODO : Dark
  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: dark_back_color_1,
      primaryColor: transparent_color,
      splashColor: transparent_color,
      cardColor: transparent_color,
      canvasColor: transparent_color,
      dividerColor: transparent_color,
      colorScheme: const ColorScheme.dark(
        primary: main_color_1,
        onPrimary: main_color_1,
        brightness: Brightness.dark,
        surface: dark_back_color_1,
        onSurface: dark_back_color_2,
        outline: border_color_2,
        shadow: shadow_color_2,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: transparent_color,
        titleTextStyle: GoogleFonts.poppins(color: transparent_color),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: transparent_color,
          systemNavigationBarColor: transparent_color,
          systemNavigationBarDividerColor: transparent_color,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(color: text_color_2, fontWeight: FontWeight.bold, letterSpacing: .5, fontSize: 15),
        displayMedium: GoogleFonts.poppins(color: text_color_1, fontWeight: FontWeight.bold, letterSpacing: .5, fontSize: 15),
        displaySmall: GoogleFonts.poppins(color: text_color_3, fontWeight: FontWeight.bold, letterSpacing: .5, fontSize: 15),
      ),
      iconTheme: const IconThemeData(color: icon_color_2, size: 30),
    );
  }
}
