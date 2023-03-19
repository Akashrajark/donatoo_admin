import 'package:demo/ui/widgets/custom_request_button.dart';
import 'package:flutter/material.dart';
import '../../values/colors.dart';
import '../widgets/custom_report_card.dart';

class OrganizationReportScreen extends StatefulWidget {
  const OrganizationReportScreen({super.key});

  @override
  State<OrganizationReportScreen> createState() =>
      _OrganizationReportScreenState();
}

class _OrganizationReportScreenState extends State<OrganizationReportScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                    isActive: _tabController.index == 0,
                  ),
                  CustomRequestButton(
                    label: "Checked Report",
                    amount: "7",
                    onTap: () {
                      _tabController.animateTo(1);
                    },
                    isActive: _tabController.index == 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
