import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/change_theme_button.dart';
import '../widgets/profile_item.dart';
import '../widgets/navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          themeProvider.isDarkMode
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Column(
        children: const [ProfileItem()],
      ),
      bottomNavigationBar: NavigationsBar(4),
    );
  }
}
