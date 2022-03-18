import 'package:flutter/material.dart';
import 'package:hackforgood/category_data.dart';

import '../models/projects.dart';

class ProjectsProvider with ChangeNotifier {
  List<Projects> _favProjects = PROJECTS_CATEGORIES;

  List<Projects> get favProj {
    return [..._favProjects];
  }

  List<Projects> get favouriteRooms {
    return _favProjects.where((proj) => proj.isFavourite).toList();
  }

  Projects findByName(String name) {
    return _favProjects.firstWhere((room) => room.name == name);
  }

  bool isProjFav(String roomName) {
    return favouriteRooms.any((element) => element == roomName);
  }

  void toggleFavourite(String name) {
    Projects proj = findByName(name);
    proj.isFavourite = !proj.isFavourite;
    print(proj.name + proj.isFavourite.toString());

    notifyListeners();
  }
}
