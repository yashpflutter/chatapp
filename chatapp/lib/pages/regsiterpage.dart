import 'package:chatapp/services/auth/auth_serice.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/components/my_button.dart';

class Registerpage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();
  final void Function()? onTap;
  Registerpage({super.key, required this.onTap});

  void register(BuildContext context) async {
    final auth = AuthService();
    if (_pwcontroller.text == _confirmcontroller.text) {
      try {
        auth.signUpWithEmailPassword(_emailcontroller.text, _pwcontroller.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password don't Match"),
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
          const Text("Lets Create a Account for you  ",
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
          MyTextField(
            obscureText: true,
            hintText: "Confirm password",
            controller: _confirmcontroller,
          ),
          const SizedBox(height: 25),

          MyButton(
              text: "Register",
              onTap: () {
                register(context);
              }),
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already a member ?",
                  style: TextStyle(color: Color.fromARGB(255, 84, 83, 83))),
              GestureDetector(
                  onTap: onTap,
                  child: const Text(" Login ",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)))
            ],
          )
        ])));
  }
}
