import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final double width;
  final TextStyle? textStyle;
  final String text;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.textStyle,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          hoverColor: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: secondaryColor,
                textStyle: textStyle,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
