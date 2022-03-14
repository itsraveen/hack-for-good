import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../screen/project_detail_screen.dart';

class HomeTokItem extends StatelessWidget {
  final String title;
  final String image;
  final int funding_recieved;
  final int funding_needed;
  final String organisation;

  const HomeTokItem(
    this.title,
    this.image,
    this.funding_recieved,
    this.funding_needed,
    this.organisation,
  );

  void selectCampus(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ProjectDetailScreen.routeName,
      arguments: {
        'title': title,
        'image': image,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCampus(context),
      splashColor: Colors.amber.shade200,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                margin: const EdgeInsets.only(bottom: 50.0),
                width: 200,
                // color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  title,
                  // image,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              // right: -20,
              left: 125,
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 20.0,
                ),
                width: 200,
                // color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  organisation,
                  // image,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  child: const Icon(
                    Icons.monetization_on_outlined,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    margin: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 135.0,
                    ),
                    child: LinearPercentIndicator(
                      barRadius: Radius.circular(10),
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      width: 200.0,
                      percent: funding_recieved / funding_needed,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
