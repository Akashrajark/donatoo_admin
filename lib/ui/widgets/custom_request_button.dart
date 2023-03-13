import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomRequestButton extends StatelessWidget {
  final String label, amount;
  final bool isActive;
  final Function() onTap;
  const CustomRequestButton({
    super.key,
    required this.label,
    required this.amount,
    this.isActive = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? primaryColor : Colors.white,
        child: SizedBox(
          width: 200,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: isActive ? secondaryColor : primaryColor,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  amount,
                  style: GoogleFonts.poppins(
                    color: isActive ? secondaryColor : primaryColor,
                    textStyle: Theme.of(context).textTheme.headlineMedium,
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
