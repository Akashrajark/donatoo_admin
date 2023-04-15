import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomRequestButton extends StatefulWidget {
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
        onTap: () {},
        onHover: (value) {
          isActive = value;
          setState(() {});
        },
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
                  widget.label,
                  style: GoogleFonts.poppins(
                    color: widget.isActive ? secondaryColor : primaryColor,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.amount,
                  style: GoogleFonts.poppins(
                    color: widget.isActive ? secondaryColor : primaryColor,
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
