import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomSmallButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: secondaryColor,
              textStyle: Theme.of(context).textTheme.bodySmall,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
