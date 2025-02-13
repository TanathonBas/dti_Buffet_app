import 'package:dti_buffet_app/views/Home_UI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(DtiBuffetApp());
}

class DtiBuffetApp extends StatefulWidget {
  const DtiBuffetApp({super.key});

  @override
  State<DtiBuffetApp> createState() => _DtiBuffetAppState();
}

class _DtiBuffetAppState extends State<DtiBuffetApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
