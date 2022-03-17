import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filter")),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Organisation',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Theme.of(context).accentColor,
                      ),
                )
              ],
            )));
  }
}
