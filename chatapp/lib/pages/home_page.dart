import 'package:chatapp/services/auth/auth_serice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/chats/chat_services.dart';
import 'package:chatapp/components/my_usertile.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth Services
  final chatService _chatServices = chatService();
  final AuthService _authService = AuthService();
  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHiTCHaT", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const MyDrawer(),
      drawerEnableOpenDragGesture: true,
      body: _buildUserList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatServices.getUserStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }

          //return ListView
          return ListView(
              children: snapshot.data!
                  .map<Widget>(
                      (userData) => _buildUserListItem(userData, context))
                  .toList());
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
          text: userData["email"],
          onTap: () {
            //tapped on user -> go to chat page
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverID: userData['uid'],
                    receiverEmail: userData["email"],
                  ),
                ));
          });
    } else {
      return Container();
    }
  }
}
