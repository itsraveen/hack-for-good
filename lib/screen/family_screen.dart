import 'package:flutter/material.dart';

import '../category_data.dart';
import '../models/family.dart';
import '../widgets/family_item.dart';
import '../widgets/navigation_bar.dart';

class FamilyScreen extends StatelessWidget {
  static const routeName = '/family-screen';
  const FamilyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Family'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: FamilySearch(FAMILY_CATEGORIES),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: FAMILY_CATEGORIES
            .map(
              (fam) => FamilyItem(
                fam.name,
                fam.image,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: NavigationsBar(2),
    );
  }
}

class FamilySearch extends SearchDelegate<String> {
  List<Family> familyList;
  FamilySearch(this.familyList);

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
        ? familyList
        : familyList.where((family) {
            return family.name.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return SearchedRoomList(resultList: resultList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? familyList
        : familyList.where((fam) {
            return fam.name.toLowerCase().contains(query.toLowerCase());
          }).toList();
    return SearchedRoomList(resultList: suggestionList);
  }
}

class SearchedRoomList extends StatelessWidget {
  SearchedRoomList({
    required this.resultList,
  });

  final List<Family> resultList;

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
                child: FamilyItem(
                  resultList[index].name,
                  resultList[index].image,
                ),
              );
            },
            itemCount: resultList.length,
          );
  }
}
