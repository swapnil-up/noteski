import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteski/constants/routes.dart';
import 'package:noteski/enums/menu_actions.dart';
import 'dart:developer' as devtools show log;

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              final result = await logoutDialog(context);
              devtools.log(result.toString());
              if (result) {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).popAndPushNamed(loginRoute);
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<MenuAction>>[
              const PopupMenuItem(
                value: MenuAction.logout,
                child: Text('logout'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<bool> logoutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Dialog"),
          content: const Text("Are you sure you wish to logout?"),
          actions: [
            TextButton(
              onPressed: () => {Navigator.of(context).pop(true)},
              child: const Text("logout"),
            ),
            TextButton(
              onPressed: () => {Navigator.of(context).pop(false)},
              child: const Text("cancel"),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
