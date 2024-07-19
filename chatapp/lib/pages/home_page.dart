import 'package:chatapp/auth/auth_serice.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: MyDrawer(),
    );
  }
}
