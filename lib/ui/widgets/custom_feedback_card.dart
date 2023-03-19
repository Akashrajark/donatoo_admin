import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_label_text.dart';

class CustomFeedBackCard extends StatelessWidget {
  const CustomFeedBackCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                CustomLabelText(
                  label: "User Id",
                  text: "897",
                ),
                SizedBox(
                  width: 40,
                ),
                CustomLabelText(
                  label: "User Name",
                  text: "John Carter",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Feedback:",
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
