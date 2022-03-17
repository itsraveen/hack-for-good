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
            bottom: 0,
            right: 0,
            child: SizedBox(
              child: Container(
                width: 500,
                height: 130,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      // Colors.red,
                      Colors.black,
                      Colors.black54,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: Text(
                title,
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
            bottom: 50,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: Text(
                organisation,
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
          const Positioned(
            bottom: 23,
            right: 220,
            child: Icon(
              Icons.monetization_on_outlined,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 25,
            right: 20,
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(10),
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              width: 200.0,
              percent: funding_recieved / funding_needed,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
