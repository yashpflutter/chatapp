import 'package:flutter/material.dart';
import 'package:chatapp/pages/regsiterpage.dart';
import 'package:chatapp/pages/loginpage.dart';

class Loginorregisterpage extends StatefulWidget {
  const Loginorregisterpage({super.key});

  @override
  State<Loginorregisterpage> createState() => _LoginorregisterpageState();
}

class _LoginorregisterpageState extends State<Loginorregisterpage> {
  bool showLoginpage = true;

  void togglePage() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return Loginpage(onTap: togglePage);
    } else {
      return Registerpage(onTap: togglePage);
    }
  }
}
