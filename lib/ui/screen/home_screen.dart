import 'package:demo/ui/screen/dashboard.dart';
import 'package:demo/ui/screen/organization_management.dart';
import 'package:demo/ui/screen/request_management.dart';
import 'package:demo/ui/screen/user_screen.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  String getTitle() {
    switch (_tabController.index) {
      case 0:
        return "DashBoard";
      case 1:
        return "Request Management";
      case 2:
        return "Organization Management";
      case 3:
        return "User";
      case 4:
        return "Complaint";
      case 5:
        return "Feedback";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          getTitle(),
          style: GoogleFonts.poppins(
            color: primaryColor,
            textStyle: Theme.of(context).textTheme.headlineSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
        foregroundColor: primaryColor,
        elevation: 0,
        backgroundColor: secondaryColor,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          const OrganizationManagement(),
          const Dashboard(),
          const RequestManagement(),
          const UserScreen(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.indigo,
          ),
        ],
      ),
      drawer: SizedBox(
        width: 240,
        child: Material(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  "MENU",
                  style: GoogleFonts.roboto(
                    color: secondaryColor,
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    iconData: Icons.grid_view,
                    onTap: () {
                      _tabController.animateTo(0);
                    },
                    label: "Dashboard",
                    isActive: _tabController.index == 0,
                    halfDividerHeightTop: false,
                  ),
                  CustomIconButton(
                    iconData: Icons.playlist_add_check,
                    onTap: () {
                      _tabController.animateTo(1);
                    },
                    label: "Request",
                    isActive: _tabController.index == 1,
                  ),
                  CustomIconButton(
                    iconData: Icons.group,
                    onTap: () {
                      _tabController.animateTo(2);
                    },
                    label: "Organization",
                    isActive: _tabController.index == 2,
                  ),
                  CustomIconButton(
                    iconData: Icons.person_4,
                    onTap: () {
                      _tabController.animateTo(3);
                    },
                    label: "User",
                    isActive: _tabController.index == 3,
                  ),
                  CustomIconButton(
                    iconData: Icons.rule,
                    label: "Complaint",
                    onTap: () {
                      _tabController.animateTo(4);
                    },
                    isActive: _tabController.index == 4,
                  ),
                  CustomIconButton(
                    iconData: Icons.forum,
                    onTap: () {
                      _tabController.animateTo(5);
                    },
                    label: "Feedback",
                    isActive: _tabController.index == 5,
                    halfDividerHeightBottom: false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                  top: 12,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(
                        Icons.logout,
                        size: 30,
                        color: secondaryColor,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Log out",
                        style: GoogleFonts.roboto(
                          color: secondaryColor,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawerScrimColor: secondaryColor.withOpacity(0),
    );
  }
}
