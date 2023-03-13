import 'package:demo/ui/screen/request_section/declined_request_section.dart';
import 'package:demo/ui/screen/request_section/funded_request_section.dart';
import 'package:demo/ui/screen/request_section/pending_request_section.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_request_button.dart';
import 'request_section/active_request_section.dart';

class RequestManagement extends StatefulWidget {
  const RequestManagement({super.key});

  @override
  State<RequestManagement> createState() => _RequestManagementState();
}

class _RequestManagementState extends State<RequestManagement>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 20,
                children: [
                  CustomRequestButton(
                    label: "Active Request",
                    amount: "10",
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                    isActive: _tabController.index == 0,
                  ),
                  CustomRequestButton(
                    label: "Pending Request",
                    amount: "10",
                    onTap: () {
                      _tabController.animateTo(1);
                    },
                    isActive: _tabController.index == 1,
                  ),
                  CustomRequestButton(
                    label: "Declined Request",
                    amount: "10",
                    onTap: () {
                      _tabController.animateTo(2);
                    },
                    isActive: _tabController.index == 2,
                  ),
                  CustomRequestButton(
                    label: "Success Request",
                    amount: "10",
                    onTap: () {
                      _tabController.animateTo(3);
                    },
                    isActive: _tabController.index == 3,
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
                  children: const [
                    ActiveRequestSection(),
                    PendingRequestSection(),
                    DeclinedRequestSection(),
                    FundedRequestSection()
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
