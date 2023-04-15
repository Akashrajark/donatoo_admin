import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final double width;
  final String text;
  final bool isLoading;
  final Color? buttonColor, labelColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = double.infinity,
    this.isLoading = false,
    this.buttonColor = primaryColor,
    this.labelColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(boxBorederRadius),
        child: InkWell(
          hoverColor: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(boxBorederRadius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isLoading
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: secondaryColor,
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: labelColor,
                              ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
