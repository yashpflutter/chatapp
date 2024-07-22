import 'package:chatapp/components/my_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          actionsIconTheme: const IconThemeData(),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Setting", style: TextStyle(color: Colors.white)),
          actions: const [Icon(Icons.search), SizedBox(width: 5)]),
    );
  }
}
