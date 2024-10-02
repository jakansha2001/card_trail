import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle headerTextStyle = GoogleFonts.inter(
  color: Colors.white,
  fontSize: 27,
  fontWeight: FontWeight.bold,
);

TextStyle subHeading = GoogleFonts.inter(
  color: Colors.white70,
  height: 1.48,
  fontSize: 18.0,
);

TextStyle cardTextHead = GoogleFonts.inter(
  color: const Color(
    0xff161621,
  ),
  fontSize: 36,
  fontWeight: FontWeight.w900,
);

TextStyle cardNumber = GoogleFonts.inter(
  color: const Color(
    0xff161621,
  ),
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle cardDate = GoogleFonts.inter(
  color: const Color(
    0xff161621,
  ),
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

ButtonStyle saveCard = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xff21222D),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      20.0,
    ),
  ),
);

TextStyle saveCardTextStyle = GoogleFonts.inter(
  color: Colors.white,
  fontSize: 17.0,
  fontWeight: FontWeight.w500,
);

TextStyle snackbarText = const TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
);
