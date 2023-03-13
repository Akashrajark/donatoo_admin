import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Function() onTap;
  final bool isActive;
  final bool halfDividerHeightTop;
  final bool halfDividerHeightBottom;
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.onTap,
    this.isActive = true,
    this.halfDividerHeightTop = true,
    this.halfDividerHeightBottom = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? secondaryColor : primaryColor,
          border: Border(
            top: BorderSide(
              width: halfDividerHeightTop ? 0.6 : 1,
              color: secondaryColor.withOpacity(.2),
            ),
            bottom: BorderSide(
              width: halfDividerHeightBottom ? 0.6 : 1,
              color: secondaryColor.withOpacity(.2),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              Icon(
                iconData,
                color: isActive ? primaryColor : secondaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                label,
                style: GoogleFonts.roboto(
                  color: isActive ? primaryColor : secondaryColor,
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
