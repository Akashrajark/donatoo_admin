import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomRequestButton extends StatefulWidget {
  final String label;
  final bool isActive;
  final Function() onTap;
  const CustomRequestButton({
    super.key,
    required this.label,
    this.isActive = true,
    required this.onTap,
  });

  @override
  State<CustomRequestButton> createState() => _CustomRequestButtonState();
}

class _CustomRequestButtonState extends State<CustomRequestButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isActive ? 100 : 0,
      borderRadius: BorderRadius.circular(boxBorederRadius),
      color: widget.isActive ? primaryColor : Colors.white,
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value) {
          isActive = value;
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  color: widget.isActive ? secondaryColor : primaryColor,
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
