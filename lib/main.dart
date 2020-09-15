import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/screens/landing_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: LandingPage(),
    );
  }
}

