import 'package:flutter/material.dart';
import 'package:hackforgood/providers/theme_provider.dart';
import 'package:hackforgood/screen/achievements_screen.dart';
import 'package:hackforgood/screen/chat_detail_screen.dart';
import 'package:hackforgood/screen/family_detail_screen.dart';
import 'package:hackforgood/screen/home_tok.dart';
import 'package:provider/provider.dart';

import './category_data.dart';
import './models/projects.dart';
import './screen/project_detail_screen.dart';
import './screen/projects_screen.dart';
import './screen/family_screen.dart';
import './providers/projects_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with ChangeNotifier {
  final List<Projects> _availableProjects = PROJECTS_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProjectsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
      ],
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Habitouch',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          themeMode: themeProvider.themeMode,
          // theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          routes: {
            ProjectDetailScreen.routeName: (ctx) => ProjectDetailScreen(),
            AchievementsScreen.routeName: (ctx) => const AchievementsScreen(),
            HomeTok.routeName: (ctx) => HomeTok(),
            FamilyDetailScreen.routeName: (ctx) => const FamilyDetailScreen(),
            FamilyScreen.routeName: (ctx) => const FamilyScreen(),
            ChatDetailPage.routeName: (ctx) => ChatDetailPage(),
          },
          initialRoute: '/',
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => const ProjectsScreen(),
            );
          },
        );
      },
    );
  }

  // create: (context) => ThemeProvider(),
  // builder: (context, _) {
  // final themeProvider = Provider.of<ThemeProvider>(context);

  // return MaterialApp(
  //   title: 'Habitouch',
  //   theme: ThemeData(
  //     primarySwatch: Colors.blue,
  //   ),
  //   themeMode: themeProvider.themeMode,
  //   theme: MyThemes.lightTheme,
  //   darkTheme: MyThemes.darkTheme,
  //   // home: CampusScreen(),
  //   initialRoute: '/',
  // routes: {
  //   ProjectDetailScreen.routeName: (ctx) => ProjectDetailScreen(),
  //   AchievementsScreen.routeName: (ctx) => const AchievementsScreen(),
  //   HomeTok.routeName: (ctx) => HomeTok(),
  //   FamilyDetailScreen.routeName: (ctx) => const FamilyDetailScreen(),
  //   FamilyScreen.routeName: (ctx) => const FamilyScreen(),
  //   ChatDetailPage.routeName: (ctx) => ChatDetailPage(),
  // },
  //   onUnknownRoute: (settings) {
  //     return MaterialPageRoute(
  //       builder: (ctx) => const ProjectsScreen(),
  //     );
  //   },
  // );
  // });
}
