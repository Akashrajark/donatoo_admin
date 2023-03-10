import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';

import 'widget/custom_icon_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.deepOrange,
          ),
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
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                iconData: Icons.grid_view,
                onTap: () {
                  _tabController.animateTo(0);
                },
                label: "Dashboard",
                isActive: _tabController.index == 0,
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
              ),
            ],
          ),
        ),
      ),
      drawerScrimColor: secondaryColor.withOpacity(0),
    );
  }
}
