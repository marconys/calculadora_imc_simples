import 'package:calculadora_imc/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, textTheme: GoogleFonts.robotoCondensedTextTheme()),
      home: const HomeView(),
    );
  }
}
