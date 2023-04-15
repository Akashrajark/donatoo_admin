import 'package:demo/ui/widgets/line_chart.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/noticication_icon_box.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(boxBorederRadius),
                        color: graphBgColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Donation",
                                style: GoogleFonts.roboto(
                                  color: graphTextColor,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 300,
                              width: 600,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomLineChart(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 450,
                        child: Material(
                          borderRadius: BorderRadius.circular(boxBorederRadius),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Notification",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
