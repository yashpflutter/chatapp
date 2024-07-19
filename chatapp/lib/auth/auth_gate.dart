import 'package:chatapp/pages/loginpage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:chatapp/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //usser is loged in
              if (snapshot.hasData == true) {
                return const HomePage();
              } else {
                return Loginpage();
              }
              //user is loged out
            }));
  }
}
