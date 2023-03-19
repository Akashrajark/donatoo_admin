import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabelText extends StatelessWidget {
  final String label, text;
  const CustomLabelText({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.black54,
            textStyle: Theme.of(context).textTheme.bodySmall,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.black87,
            textStyle: Theme.of(context).textTheme.bodySmall,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
