import 'dart:ui';
import 'main_colors.dart';

/// Evently dark palette
class DarkColors implements MainColors {
  // Brand violet
  @override Color get primary600 => const Color(0xFF3E55FF);
  @override Color get primary500 => const Color(0xFF5669FF); // main
  @override Color get primary400 => const Color(0xFF7886FF);
  @override Color get primary300 => const Color(0xFFA0AAFF);
  @override Color get primary200 => const Color(0xFFC8CDFF);
  @override Color get primary100 => const Color(0xFFE8EBFF);

  // Neutrals for dark UI
  @override Color get secondary => const Color(0xFF101524); // cards/surfaces

  // Feedbacks tuned for dark backgrounds
  @override Color get warning => const Color(0xFFFFE08A);
  @override Color get error   => const Color(0xFFFF6B81);
  @override Color get error200=> const Color(0xFFFF9AAA);
}
