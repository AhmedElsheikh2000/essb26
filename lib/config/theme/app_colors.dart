import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (من موقع المؤتمر)
  static const Color primary = Color(0xFF1E3A8A); // أزرق غامق
  static const Color secondary = Color(0xFF0EA5E9); // أزرق فاتح
  static const Color accent = Color(0xFFFFB800); // ذهبي
  
  // Background Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardBackground = Colors.white;
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textLight = Color(0xFF94A3B8);
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
  
  // Border Colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFCBD5E1);
  
  // Icon Colors
  static const Color iconPrimary = Color(0xFF475569);
  static const Color iconSecondary = Color(0xFF94A3B8);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFB800), Color(0xFFFF8C00)],
  );
}