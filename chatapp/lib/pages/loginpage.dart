import 'package:chatapp/auth/auth_serice.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/regsiterpage.dart';

class Loginpage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  //Tap to go to register page

  Loginpage({super.key});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          _emailcontroller.text, _pwcontroller.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
            //logo
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.message, size: 60, color: Colors.green),
          const SizedBox(height: 20),
          //Weelcoome back message
          const Text("Welcome back , you've been missed ! ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
          const SizedBox(height: 25),
          //email TextField
          MyTextField(
            obscureText: false,
            hintText: "Email ",
            controller: _emailcontroller,
          ),
          const SizedBox(height: 25),

          MyTextField(
            obscureText: true,
            hintText: "Password",
            controller: _pwcontroller,
          ),
          const SizedBox(height: 25),
          //login button
          MyButton(text: "Login", onTap: () => login(context)),
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Not a member? ",
                  style: TextStyle(color: Color.fromARGB(255, 84, 83, 83))),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registerpage(),
                        ));
                  },
                  child: const Text(" Register now ",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)))
            ],
          )
        ])));
  }
}
