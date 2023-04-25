import 'package:demo/ui/screen/dashboard.dart';
import 'package:demo/ui/screen/feedback_screen.dart';
import 'package:demo/ui/screen/login_screen.dart';
import 'package:demo/ui/screen/organization_management.dart';
import 'package:demo/ui/screen/organization_report_screen.dart';
import 'package:demo/ui/screen/request_report_screen.dart';
import 'package:demo/ui/screen/request_management.dart';
import 'package:demo/ui/screen/user_screen.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    _tabController = TabController(
      length: 6,
      initialIndex: 0,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Supabase.instance.client.auth.currentUser == null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
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
        return "Request Report";
      case 4:
        return "Organization Report";
      case 5:
        return "Feedback";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: _tabController.index == 0,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          getTitle(),
          style: GoogleFonts.poppins(
            color: _tabController.index == 0 ? secondaryColor : primaryColor,
            textStyle: Theme.of(context).textTheme.headlineSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
        foregroundColor:
            _tabController.index == 0 ? secondaryColor : primaryColor,
        elevation: 0,
        backgroundColor: _tabController.index == 0
            ? primaryColor.withOpacity(0)
            : secondaryColor,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          Dashboard(),
          RequestManagement(),
          OrganizationManagement(),
          RequestReportScreen(),
          OrganizationReportScreen(),
          FeedBackScreen()
        ],
      ),
      drawer: SizedBox(
        width: 240,
        child: Material(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(boxBorederRadius),
            bottomRight: Radius.circular(boxBorederRadius),
          ),
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
                    iconData: Icons.rule,
                    label: "Request Report",
                    onTap: () {
                      _tabController.animateTo(3);
                    },
                    isActive: _tabController.index == 3,
                  ),
                  CustomIconButton(
                    iconData: Icons.rule,
                    label: "Organization Report",
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
                  ),
                  CustomIconButton(
                    isActive: false,
                    iconData: Icons.logout,
                    label: "Log out",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: SizedBox(
                            width: 330,
                            height: 140,
                            child: Material(
                              borderRadius:
                                  BorderRadius.circular(boxBorederRadius),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Are you sure you want to log out?",
                                      style: GoogleFonts.roboto(
                                        color: primaryColor,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          borderRadius: BorderRadius.circular(
                                              boxBorederRadius),
                                          color: primaryColor,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            hoverColor:
                                                Colors.white.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                boxBorederRadius),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 12),
                                              child: Text(
                                                "cancel",
                                                style: GoogleFonts.roboto(
                                                  color: secondaryColor,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          borderRadius: BorderRadius.circular(
                                              boxBorederRadius),
                                          color: primaryColor,
                                          child: InkWell(
                                            hoverColor:
                                                Colors.white.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                boxBorederRadius),
                                            onTap: () async {
                                              await Supabase
                                                  .instance.client.auth
                                                  .signOut();
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const LoginScreen()),
                                                      (route) => false);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 12),
                                              child: Text(
                                                "log out",
                                                style: GoogleFonts.roboto(
                                                  color: secondaryColor,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawerScrimColor: secondaryColor.withOpacity(0),
    );
  }
}
