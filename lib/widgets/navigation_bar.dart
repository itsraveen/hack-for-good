import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackforgood/screen/home_tok.dart';

import '../screen/profile_screen.dart';
import '../screen/projects_screen.dart';
// import 'package:sizer/sizer.dart';

class NavigationsBar extends StatefulWidget {
  // Function _selectPage;
  int pageNo;
  NavigationsBar(this.pageNo);

  @override
  _NavigationsBarState createState() => _NavigationsBarState(pageNo);
}

class _NavigationsBarState extends State<NavigationsBar> {
  int _selectedPageIndex = 0;

  int pageNo;
  _NavigationsBarState(this.pageNo);

  final List<Map<String, Object>> _pages = [
    {
      'page': const ProjectsScreen(),
      'title': 'Projects',
      // 'appBar':,
    },
    {
      'page': HomeTok(),
      'title': 'Home Tok',
      // 'appBar':,
    },
    {
      'page': const ProfileScreen(),
      'title': 'Projects',
      // 'appBar':,
    },
  ];

  void _selectPage(int index) {
    // navBarTapped = true;
    setState(() {
      _selectedPageIndex = index;
    });
    if (_selectedPageIndex == 0) {
      //Navigator.of(context).popAndPushNamed(CampusScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const ProjectsScreen(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 1) {
      // Navigator.of(context).popAndPushNamed(SearchScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomeTok(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 2) {
      // Navigator.of(context).popAndPushNamed(SearchScreen.routeName);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const ProfileScreen(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        showUnselectedLabels: true,
        onTap: _selectPage,
        // unselectedItemColor: Theme.of(context).iconTheme.color,
        // unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              pageNo == 0 ? Icons.explore : Icons.explore_outlined,
              // color: pageNo == 0
              //     ? Theme.of(context).primaryColor
              //     : Theme.of(context).iconTheme.color,
              // size: 25.sp,
            ),
            // label: 'Explore',
            label: "Test",
            // Text(
            //   'Explore',
            //   style: TextStyle(
            //     color: Colors.grey.shade600,
            //     fontSize: 0,
            //   ),
            // ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 1
                  ? Icons.video_camera_back_outlined
                  : Icons.video_camera_back_outlined

              //     ? Platform.isIOS
              //         ? CupertinoIcons.video_camera_solid
              //         : Icons.video_camera_back_outlined
              //     : Platform.isIOS
              //         ? CupertinoIcons.video_camera
              //         : Icons.video_camera_back_outlined,
              // color: pageNo == 1
              //     ? Theme.of(context).primaryColor
              //     : Theme.of(context).iconTheme.color,
            ),
            // label: 'Search',
            label: "Home Tok",
            // title: Text(
            //   'Search',
            //   style: TextStyle(
            //     color: Colors.grey.shade600,
            //     fontSize: 0,
            //   ),
            // ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 2
                  ? Icons.manage_accounts_sharp
                  : Icons.manage_accounts_sharp
              //     ? Platform.isIOS
              //         ? CupertinoIcons.person
              //         : Icons.manage_accounts_sharp
              //     : Platform.isIOS
              //         ? CupertinoIcons.person
              //         : Icons.manage_accounts_sharp,
              // color: pageNo == 2
              //     ? Theme.of(context).primaryColor
              //     : Theme.of(context).iconTheme.color,
            ),
            // label: 'Search',
            label: "Profile",
            // title: Text(
            //   'Search',
            //   style: TextStyle(
            //     color: Colors.grey.shade600,
            //     fontSize: 0,
            //   ),
            // ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}
