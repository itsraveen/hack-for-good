import 'package:flutter/material.dart';
import 'package:hackforgood/models/projects.dart';
import 'package:hackforgood/widgets/project_item.dart';
import 'package:provider/provider.dart';

import '../providers/projects_provider.dart';
import '../widgets/navigation_bar.dart';

class FavouritesProjectsScreen extends StatelessWidget {
  var favouriteProjects = [];

  FavouritesProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projProvider = Provider.of<ProjectsProvider>(context, listen: true);
    final noOfRoomFav = projProvider.favouriteRooms.length;
    if (noOfRoomFav == 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: const Center(
          child: Text(
            'You have no favourites yet - start adding some!',
            style: TextStyle(fontSize: 20),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        bottomNavigationBar: NavigationsBar(3),
      );
    } else {
      return showListView(projProvider.favouriteRooms, noOfRoomFav);
    }
  }

  Scaffold showListView(List<Projects> favProj, int favLen) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: ListView.builder(
        // padding: const EdgeInsets.all(5),
        itemBuilder: (ctx, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: ProjectItem(
              favProj[index].name,
              favProj[index].image,
            ),
          );
        },
        itemCount: favLen,
      ),
      bottomNavigationBar: NavigationsBar(3),
    );
  }
}
