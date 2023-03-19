import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_feedback_card.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Center(
        child: SizedBox(
          width: 900,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  10,
                  (index) => const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CustomFeedBackCard(),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
