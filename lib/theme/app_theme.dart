import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primary = Color(0xFF1A237E); // deep indigo
  static const Color primaryLight = Color(0xFF3949AB);
  static const Color accent = Color(0xFFFF6F00); // amber-orange
  static const Color surface = Color(0xFFF5F7FF);
  static const Color cardBg = Colors.white;

  // Category Colors
  static const Map<String, Color> categoryColors = {
    'Exams': Color(0xFFE53935),
    'Scholarship': Color(0xFF43A047),
    'Facility': Color(0xFF1E88E5),
    'IT': Color(0xFF8E24AA),
    'Policy': Color(0xFFE53935),
    'Academic': Color(0xFF00897B),
    'Technical': Color(0xFF1E88E5),
    'Cultural': Color(0xFFE91E63),
    'Career': Color(0xFF43A047),
    'Sports': Color(0xFFFF6F00),
    'Literary': Color(0xFF8E24AA),
    'Business': Color(0xFF00ACC1),
    'Social': Color(0xFF43A047),
    'Creative': Color(0xFFE91E63),
  };

  static Color categoryColor(String category) =>
      categoryColors[category] ?? primary;

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
        ).copyWith(primary: primary, secondary: accent, surface: surface),
        scaffoldBackgroundColor: surface,
        appBarTheme: AppBarTheme(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        cardTheme: CardThemeData(
          color: cardBg,
          elevation: 2,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: surface,
          selectedColor: primary.withValues(alpha: 0.15),
          labelStyle: GoogleFonts.poppins(fontSize: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: const BorderSide(color: Color(0xFFDDE0F0)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: primary.withValues(alpha: 0.12),
          labelTextStyle: WidgetStateProperty.all(
            GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
      );
}
