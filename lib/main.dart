import 'package:flutter/material.dart';
import 'package:hackforgood/screen/achievements_screen.dart';
import 'package:hackforgood/screen/home_tok.dart';

import './category_data.dart';
import './models/projects.dart';
import './screen/project_detail_screen.dart';
import './screen/projects_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Projects> _availableProjects = PROJECTS_CATEGORIES;
  // List<Campus> _availableCampus = CAMPUS_CATEGORIES;
  // List<Building> _availableBuildings = BUILDING_CATEGORIES;
  // List<Room> _availableRooms = ROOMS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOwGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CampusScreen(),
      initialRoute: '/',
      routes: {
        ProjectDetailScreen.routeName: (ctx) => const ProjectDetailScreen(),
        AchievementsScreen.routeName: (ctx) => const AchievementsScreen(),
        HomeTok.routeName: (ctx) => HomeTok(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const ProjectsScreen(),
        );
      },
    );
  }
}
