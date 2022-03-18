import 'package:flutter/material.dart';
import 'package:hackforgood/screen/achievements_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../category_data.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key}) : super(key: key);

  void showAllAchievements(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      AchievementsScreen.routeName,
      arguments: {},
    );
  }

  @override
  Widget build(BuildContext context) {
    var profile = USERS[0];
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profile.image),
                ),
              ),
              const VerticalDivider(
                width: 10,
                thickness: 10,
              ),
              Container(
                height: 120,
                width: 250,
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RaisedButton(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 30,
                      ),
                      color: Colors
                          .blue.shade200, //Theme.of(context).primaryColor,
                      child: const Text(
                        'EDIT',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
          height: 16,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue.shade200,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: const BorderSide(
                  //   color: Colors.red,
                  // ),
                ),
              ),
            ),
            // color: Colors.blue.shade200,
            onPressed: () => showAllAchievements(context),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(top: 12, left: 10, right: 15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(MdiIcons.trophyVariant),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 2,
                          ),
                          child: const Text(
                            'See all achievements',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
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
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue.shade200,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: const BorderSide(
                  //   color: Colors.red,
                  // ),
                ),
              ),
            ),
            // color: Colors.blue.shade200,
            onPressed: () => {},
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(top: 12, left: 10, right: 15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(MdiIcons.currencyUsd),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 2,
                          ),
                          child: const Text(
                            'See your donations',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
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
      ],
    );
  }
}
