import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';
import 'custom_button.dart';
import 'custom_label_text.dart';

class CustomReportCard extends StatelessWidget {
  const CustomReportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(boxBorederRadius),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLabelText(
                  label: "User ID:",
                  text: "754",
                ),
                const SizedBox(
                  width: 40,
                ),
                const CustomLabelText(
                  label: "User Name:",
                  text: "Wade Tucker",
                ),
                const SizedBox(
                  width: 40,
                ),
                const CustomLabelText(
                  label: "Organization ID:",
                  text: "617",
                ),
                const SizedBox(
                  width: 40,
                ),
                const CustomLabelText(
                  label: "Organization Name:",
                  text: "Old Home",
                ),
                const Expanded(child: SizedBox()),
                CustomButton(
                  text: "Done",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Report:",
              style: GoogleFonts.poppins(
                color: Colors.black,
                textStyle: Theme.of(context).textTheme.bodySmall,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "sajhdgajshdasdhagsdhgajsgdjhaskdnaksjdasdaksjdasjdkajsdkjanskdasvdjhvasdassssssdddddddddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssss",
              style: GoogleFonts.poppins(
                color: Colors.black54,
                textStyle: Theme.of(context).textTheme.bodySmall,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
