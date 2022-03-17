import 'package:flutter/material.dart';

class ProjectsProvider with ChangeNotifier {
  List<String> _favProjects = [];

  List<String> get favRooms {
    return [..._favProjects];
  }

  List<String> get noDuplicates {
    return _favProjects.toSet().toList();
  }

  bool isProjFav(String roomName) {
    return _favProjects.any((element) => element == roomName);
  }

  void toggleFavourite(String roomName) async {
    bool isProjInFavList = isProjFav(roomName);
    if (isProjInFavList) {
      _favProjects.removeWhere((element) => element == roomName);
      notifyListeners();
    } else {
      _favProjects.add(roomName);
      notifyListeners();
    }
  }
}
