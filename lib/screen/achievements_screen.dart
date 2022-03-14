import 'package:flutter/material.dart';
import 'package:achievement_view/achievement_view.dart';

class AchievementsScreen extends StatefulWidget {
  static const routeName = '/project-details';

  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  bool isCircle = false;
  @override
  Widget build(BuildContext context) {
    void show(BuildContext context) {
      AchievementView(
        context,
        title: "Yeaaah!",
        subTitle: "Training completed successfully! ",
        isCircle: isCircle,
        listener: (status) {
          print(status);
        },
      )..show();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                      value: isCircle,
                      onChanged: (change) => setState(() {
                            isCircle = change!;
                          })),
                  Text("isCircle")
                ],
              ),
              RaisedButton(
                  child: Text("Show"),
                  onPressed: () {
                    show(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
