import 'package:chargeio/screens/add_user.dart';
import 'package:chargeio/screens/existing_user.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: Image.asset(
          'assets/images/logo_white.png',
        ),
        leadingWidth: 150,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SideMenu(items: [
              SideMenuItem(
                priority: 0,
                title: 'Add User',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: Icon(
                  Icons.account_circle,
                  color: blue,
                ),
                tooltipContent: "Click to add new user",
              ),
              SideMenuItem(
                priority: 1,
                title: 'Existing User',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: Icon(
                  Icons.verified_user,
                  color: blue,
                ),
                tooltipContent: "Click to add new user",
              ),
            ], controller: page),
          ),
          Expanded(
              flex: 5,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: page,
                children: [const AddUser(), ExistingUser()],
              ))
        ],
      ),
    );
  }
}
