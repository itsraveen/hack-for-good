import 'package:flutter/material.dart';

import '../category_data.dart';
import '../widgets/home_tok_item.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/project_item.dart';

class HomeTok extends StatelessWidget {
  static const routeName = '/home-tok';
  HomeTok({Key? key}) : super(key: key);

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HabiTok'),
      ),
      body: Container(
        // padding: EdgeInsets.all(20.0),
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: PROJECTS_CATEGORIES
              .map(
                (proj) => HomeTokItem(
                  proj.name,
                  proj.image,
                  proj.fundings_recieved,
                  proj.fundings_needed,
                  proj.organisation,
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: NavigationsBar(1),
    );
  }
}
