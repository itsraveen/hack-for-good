import 'package:flutter/material.dart';
import 'package:hackforgood/screen/favourite_projects.dart';
import 'package:hackforgood/screen/home_tok.dart';

import '../screen/family_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/projects_screen.dart';

// ignore: must_be_immutable
class NavigationsBar extends StatefulWidget {
  int pageNo;
  NavigationsBar(this.pageNo, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
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
    },
    {
      'page': HomeTok(),
      'title': 'HabiTok',
    },
    {
      'page': const FamilyScreen(),
      'title': 'Families',
    },
    {
      'page': const ProfileScreen(),
      'title': 'Projects',
    },
    {
      'page': FavouritesProjectsScreen(),
      'title': 'Favourites',
    },
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    if (_selectedPageIndex == 0) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const ProjectsScreen(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 1) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomeTok(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 2) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const FamilyScreen(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 3) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              FavouritesProjectsScreen(),
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } else if (_selectedPageIndex == 4) {
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
        selectedItemColor: Colors.grey.shade600,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo,
              pageNo == 0 ? Icons.explore : Icons.explore,
              color: pageNo == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            label: "Explore",
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 1
                  ? Icons.video_camera_back_outlined
                  : Icons.video_camera_back_outlined,
              color: pageNo == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            label: "HabiTok",
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 2 ? Icons.family_restroom : Icons.family_restroom,
              color: pageNo == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            label: "Family",
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 3 ? Icons.favorite : Icons.favorite_border,
              color: pageNo == 3
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            label: "Favourites",
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // _selectedPageIndex == pageNo
              pageNo == 4
                  ? Icons.manage_accounts_sharp
                  : Icons.manage_accounts_sharp,
              color: pageNo == 4
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            label: "Profile",
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}
