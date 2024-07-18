import 'package:chatapp/auth/auth_serice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(onPressed: logout, icon: const Icon(Icons.logout))
      ]),
      drawer: Drawer(),
    );
  }
}
