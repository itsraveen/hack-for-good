import 'package:flutter/material.dart';

import '../category_data.dart';
import '../models/projects.dart';
import '../widgets/project_item.dart';
import '../widgets/navigation_bar.dart';

class ProjectsScreen extends StatelessWidget {
  static const routeName = '/';
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Project'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProjectSearch(PROJECTS_CATEGORIES),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: PROJECTS_CATEGORIES
            .map(
              (proj) => ProjectItem(
                proj.name,
                proj.image,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: NavigationsBar(0),
    );
  }
}

class ProjectSearch extends SearchDelegate<String> {
  List<Projects> projectList;
  ProjectSearch(this.projectList);

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultList = query.isEmpty
        ? projectList
        : projectList.where((proj) {
            return proj.name.toLowerCase().contains(query.toLowerCase()) |
                proj.organisation.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return SearchedRoomList(resultList: resultList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? projectList
        : projectList.where((proj) {
            return proj.name.toLowerCase().contains(query.toLowerCase()) |
                proj.organisation.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return SearchedRoomList(resultList: suggestionList);
  }
}

class SearchedRoomList extends StatelessWidget {
  SearchedRoomList({
    required this.resultList,
  });

  final List<Projects> resultList;

  @override
  Widget build(BuildContext context) {
    return resultList.isEmpty
        ? const Center(
            child: Text(
              'No results found...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                // color: Theme.of(context).textTheme.subtitle1.color,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Container(
                padding: const EdgeInsets.all(5),
                child: ProjectItem(
                  resultList[index].name,
                  resultList[index].image,
                ),
              );
            },
            itemCount: resultList.length,
          );
  }
}
