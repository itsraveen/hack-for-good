import 'package:flutter/material.dart';

import '../widgets/profile_item.dart';
import '../widgets/navigation_bar.dart';
// import '../widgets/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // final String title;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      // body: const Center(
      //   child: Text("Profile"),
      // ),
      body: Column(
        children: const [ProfileItem()],
      ),
      bottomNavigationBar: NavigationsBar(1),
    );
  }
}
