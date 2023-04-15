import 'package:demo/ui/widgets/custom_request_button.dart';
import 'package:flutter/material.dart';
import '../../values/colors.dart';
import '../widgets/custom_report_card.dart';

class OrganizationReportScreen extends StatelessWidget {
  const OrganizationReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Center(
        child: SizedBox(
          width: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 20,
                children: [
                  CustomRequestButton(
                    label: "Pending Report",
                    amount: "10",
                    onTap: () {},
                  ),
                  CustomRequestButton(
                    label: "Checked Report",
                    amount: "7",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 890,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CustomReportCard(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
