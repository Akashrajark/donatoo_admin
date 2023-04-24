import 'package:flutter/material.dart';
import '../../values/colors.dart';
import '../widgets/custom_report_card.dart';
import '../widgets/custom_request_button.dart';

class RequestReportScreen extends StatelessWidget {
  const RequestReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Center(
        child: SizedBox(
          width: 1000,
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
                    onTap: () {},
                  ),
                  CustomRequestButton(
                    label: "Checked Report",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Material(
                  child: SizedBox(
                    width: 890,
                    child: ListView.separated(
                      itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CustomReportCard(),
                      ),
                      separatorBuilder: (context, index) => const Divider(
                        height: 10,
                        color: secondaryColor,
                        thickness: 10,
                      ),
                      itemCount: 10,
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
