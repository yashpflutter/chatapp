import 'package:chatapp/pages/home_page.dart';
import 'package:chatapp/pages/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/auth/auth_serice.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 50),
                  child: Icon(Icons.message, size: 40, color: Colors.green),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text("H O M E"),
                    leading: const Icon(Icons.home,
                        color: Color.fromARGB(255, 56, 55, 55)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text("S E T T I N G S"),
                    leading: const Icon(Icons.settings,
                        color: Color.fromARGB(255, 56, 55, 55)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("L O G O U T",
                    style: TextStyle(color: Colors.red)),
                leading: const Icon(Icons.logout,
                    color: Color.fromARGB(255, 56, 55, 55)),
                onTap: () {
                  logout();
                },
              ),
            )
          ],
        ));
  }
}
