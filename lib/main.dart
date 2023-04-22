import 'package:demo/ui/screen/login_screen.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://autcpaoiguonohmlwvub.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF1dGNwYW9pZ3Vvbm9obWx3dnViIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODEyOTQ1NDQsImV4cCI6MTk5Njg3MDU0NH0.LmErf0I1HObrmPNuYTqrY7lK4hSL1gYrNE4u46Iqdr8',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.poppins(
            color: Colors.black26,
            textStyle: Theme.of(context).textTheme.bodySmall,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boxBorederRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginScreen(),
      },
    );
  }
}
