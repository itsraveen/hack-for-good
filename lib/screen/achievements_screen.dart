import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  static const routeName = '/achievements-details';

  const AchievementsScreen({Key? key}) : super(key: key);

  Widget buildCompletedAchievementTile(BuildContext context, String title) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            backgroundImage: AssetImage('assets/images/achievement_done.jpg'),
          ),
        ),
        Container(
          child: Text(title),
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
        )
      ],
    );
  }

  Widget buildIncompletedAchievementTile(BuildContext context, String title) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50,
            backgroundImage: AssetImage('assets/images/achievement.jpg'),
          ),
        ),
        Container(
          child: Text(title),
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Achievements'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: const Text(
                  'Basic',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  top: 20.0,
                  left: 25.0,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    buildCompletedAchievementTile(context, "Challenge 1"),
                    buildCompletedAchievementTile(context, "Challenge 2"),
                    buildIncompletedAchievementTile(context, "Challenge 3"),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    buildIncompletedAchievementTile(context, "Challenge 4"),
                    buildIncompletedAchievementTile(context, "Challenge 5"),
                    buildCompletedAchievementTile(context, "Challenge 6"),
                  ],
                ),
              ),
              Container(
                child: const Text(
                  'Advanced',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  top: 20.0,
                  left: 25.0,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    buildIncompletedAchievementTile(context, "Challenge 7"),
                    buildCompletedAchievementTile(context, "Challenge 8"),
                    buildIncompletedAchievementTile(context, "Challenge 9"),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    buildIncompletedAchievementTile(context, "Challenge 10"),
                    buildIncompletedAchievementTile(context, "Challenge 11"),
                    buildCompletedAchievementTile(context, "Challenge 12"),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    buildIncompletedAchievementTile(context, "Challenge 10"),
                    buildIncompletedAchievementTile(context, "Challenge 11"),
                    buildCompletedAchievementTile(context, "Challenge 12"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
