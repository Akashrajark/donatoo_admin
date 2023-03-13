import 'package:demo/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.75),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
