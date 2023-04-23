import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/noticication_icon_box.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/img.jpg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          NotificationIconBox(
                            iconData: Icons.person_outline,
                            label: "Total users",
                            amount: "13,200",
                          ),
                          NotificationIconBox(
                            iconData: Icons.volunteer_activism,
                            label: "Total request",
                            amount: "762",
                          ),
                          NotificationIconBox(
                            iconData: Icons.trending_up,
                            label: "Total funded",
                            amount: "\$ 5,200",
                          ),
                          NotificationIconBox(
                            iconData: Icons.pending_actions,
                            label: "Pending request",
                            amount: "10",
                          ),
                          NotificationIconBox(
                            iconData: Icons.av_timer,
                            label: "Active Request",
                            amount: "5",
                          ),
                          NotificationIconBox(
                            iconData: Icons.groups,
                            label: "Organizations",
                            amount: "17",
                          ),
                          NotificationIconBox(
                            iconData: Icons.assignment_turned_in,
                            label: "Funded Request",
                            amount: "7",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
