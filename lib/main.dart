import 'package:flutter/material.dart';
import 'package:hackforgood/providers/theme_provider.dart';
import 'package:hackforgood/screen/achievements_screen.dart';
import 'package:hackforgood/screen/chat_detail_screen.dart';
import 'package:hackforgood/screen/family_detail_screen.dart';
import 'package:hackforgood/screen/home_tok.dart';

import './category_data.dart';
import './models/projects.dart';
import './screen/project_detail_screen.dart';
import './screen/projects_screen.dart';
import './screen/family_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitouch',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      // home: CampusScreen(),
      initialRoute: '/',
      routes: {
        ProjectDetailScreen.routeName: (ctx) => ProjectDetailScreen(),
        AchievementsScreen.routeName: (ctx) => const AchievementsScreen(),
        HomeTok.routeName: (ctx) => HomeTok(),
        FamilyDetailScreen.routeName: (ctx) => const FamilyDetailScreen(),
        FamilyScreen.routeName: (ctx) => const FamilyScreen(),
        ChatDetailPage.routeName: (ctx) => ChatDetailPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const ProjectsScreen(),
        );
      },
    );
  }
}
