import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatefulWidget {
  static const routeName = '/projectdetails';
  const ProjectDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
      ),
      body: const Center(
        child: Text("Test"),
      ),
    );
  }
}
