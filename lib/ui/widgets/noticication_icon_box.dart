import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class NotificationIconBox extends StatelessWidget {
  final IconData iconData;
  final String label, amount;
  const NotificationIconBox({
    super.key,
    required this.iconData,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(boxBorederRadius),
      color: Colors.white.withOpacity(.7),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 170,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(boxBorederRadius),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        iconData,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.arimo(
                        color: notificationIconBoxTextColor,
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      amount,
                      style: GoogleFonts.arimo(
                        color: Colors.black,
                        textStyle: Theme.of(context).textTheme.titleLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
