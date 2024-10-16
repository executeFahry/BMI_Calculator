import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Warna tema utama aplikasi
const kPrimaryColor = Color.fromRGBO(218, 254, 133, 1);
const kSecondaryColor = Color.fromRGBO(59, 65, 45, 1);
const kBgColor = Color(0xFF111214);

// Text Styles menggunakan Google Fonts
final kTitleTextStyle = GoogleFonts.openSans(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final kSubtitleTextStyle = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

final kContentTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  color: Colors.white,
);

final kButtonTextStyle = GoogleFonts.openSans(
    fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);

final kCardTextStyle = GoogleFonts.openSans(
    fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600);

// Margin dan Padding
const double kDefaultPadding = 16.0;
const double kDefaultMargin = 16.0;
