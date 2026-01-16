// lib/core/constants/app_dimensions.dart

import 'package:flutter/material.dart';

/// এই ফাইলে অ্যাপের সব ধরনের সাইজ, প্যাডিং, স্পেসিং, রেডিয়াস ইত্যাদি ডিফাইন করা হয়েছে
/// Material 3 গাইডলাইন অনুসরণ করা হয়েছে + ছোট-মাঝারি-বড় স্ক্রিনের জন্য সুবিধাজনক
class AppDimensions {
  // ──────────────── Padding & Margin Values ────────────────
  static const double paddingExtraSmall = 4.0;     // খুব ছোট জায়গায় (আইকনের পাশে)
  static const double paddingSmall = 8.0;          // ছোট বাটন/কার্ডের ভিতরে
  static const double paddingMedium = 16.0;        // সবচেয়ে বেশি ব্যবহৃত (স্ট্যান্ডার্ড)
  static const double paddingLarge = 24.0;         // সেকশনের মাঝে বড় স্পেস
  static const double paddingExtraLarge = 32.0;    // হেডার/ফুটারের জন্য
  static const double paddingHuge = 48.0;          // খুব বড় স্পেস (স্ক্রলের শেষে)

  // ──────────────── Spacing Between Widgets ────────────────
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 12.0;
  static const double spaceL = 16.0;
  static const double spaceXL = 24.0;
  static const double spaceXXL = 32.0;   // অথবা 36.0 / 40.0 যেটা তোমার পছন্দ

  // ──────────────── Border Radius (কার্ড, বাটন, চিপ ইত্যাদি) ────────────────
  static const double radiusSmall = 8.0;           // ছোট চিপ/ট্যাগ
  static const double radiusMedium = 12.0;         // সাধারণ কার্ড/বাটন
  static const double radiusLarge = 16.0;          // মডার্ন কার্ড/ডায়ালগ
  static const double radiusExtraLarge = 24.0;     // বড় কার্ড/প্রোফাইল হেডার
  static const double radiusCircular = 999.0;      // পুরোপুরি গোলাকার (যেমন: CircleAvatar)

  // ──────────────── Icon Sizes ────────────────
  static const double iconXS = 16.0;
  static const double iconSmall = 20.0;
  static const double iconMedium = 24.0;           // সবচেয়ে কমন
  static const double iconLarge = 32.0;
  static const double iconXL = 40.0;
  static const double iconXXL = 48.0;

  // ──────────────── Font Sizes (TextTheme এর সাথে মিলিয়ে ব্যবহার করা যায়) ────────────────
  static const double fontSizeCaption = 12.0;
  static const double fontSizeBodySmall = 14.0;
  static const double fontSizeBody = 16.0;
  static const double fontSizeSubtitle = 18.0;
  static const double fontSizeTitle = 20.0;
  static const double fontSizeHeadline = 24.0;
  static const double fontSizeDisplay = 32.0;

  // ──────────────── Elevation / Shadow ────────────────
  static const double elevationLow = 1.0;
  static const double elevationMedium = 3.0;
  static const double elevationHigh = 6.0;

// Padding & Margin
  static const double paddingXS    = 4.0;
  static const double paddingS     = 8.0;
  static const double paddingM     = 12.0;
  static const double padding      = 16.0;      // সবচেয়ে বেশি ব্যবহৃত
  static const double paddingL     = 24.0;
  static const double paddingXL    = 32.0;
  static const double paddingXXL   = 40.0;      // ← এটাই সবচেয়ে বড় সাধারণত
       // ← এটাও রাখা যায়

  // Radius
  static const double radiusS     = 8.0;
  static const double radiusM     = 12.0;
  static const double radiusL     = 16.0;
  static const double radiusXL    = 24.0;
  static const double radiusFull  = 999.0;

  // Icon sizes
  static const double iconS    = 20.0;
  static const double iconM    = 24.0;
  static const double iconL    = 32.0;


  // সবচেয়ে কমন ও সহজ নামগুলো (প্রায় সবাই এগুলোই বেশি ব্যবহার করে)
  static const double defaultPadding = 16.0;
  static const double sectionSpacing = 24.0;


  // ──────────────── Responsive Helper Functions ──────────────── (ঐচ্ছিক)
  /// স্ক্রিন সাইজ অনুযায়ী প্যাডিং স্কেল করতে চাইলে ব্যবহার করতে পারো
  static double getResponsivePadding(BuildContext context, double baseValue) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 360) return baseValue * 0.8;     // খুব ছোট ফোন
    if (screenWidth > 600) return baseValue * 1.2;     // ট্যাবলেট/বড় ফোন
    return baseValue;
  }
}