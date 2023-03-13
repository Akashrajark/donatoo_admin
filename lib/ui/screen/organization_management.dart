import 'package:demo/ui/screen/organization_section/active_organization_section.dart';
import 'package:demo/ui/screen/organization_section/banned_organization_section.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_request_button.dart';

class OrganizationManagement extends StatefulWidget {
  const OrganizationManagement({super.key});

  @override
  State<OrganizationManagement> createState() => _OrganizationManagementState();
}

class _OrganizationManagementState extends State<OrganizationManagement>
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
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 20,
                children: [
                  CustomRequestButton(
                    label: "Organizations",
                    amount: "10",
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                    isActive: _tabController.index == 0,
                  ),
                  CustomRequestButton(
                    label: "Banned Organization",
                    amount: "10",
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
                  children: const [
                    ActiveOrganizationSection(),
                    BannedOrganizationSection(),
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
