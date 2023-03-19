import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomReportButton extends StatelessWidget {
  final String label, amount;
  final Function() onTap;
  final bool isActive;
  const CustomReportButton({
    super.key,
    required this.label,
    required this.amount,
    required this.onTap,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: isActive ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 440,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: isActive ? secondaryColor : primaryColor,
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  amount,
                  style: GoogleFonts.poppins(
                    color: isActive ? secondaryColor : primaryColor,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
