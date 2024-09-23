import 'dart:developer' as devtools show log;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteski/views/login_view.dart';
import 'package:noteski/views/register_view.dart';
import 'package:noteski/views/verify_email_view.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Noteski',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
        '/notes/': (context) => const NotesView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            var user = FirebaseAuth.instance.currentUser;
            devtools.log(user.toString());

            if (user != null) {
              if (user.emailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmail();
              }
            } else {
              return const LoginView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

enum MenuAction { logout }

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
                Navigator.of(context).popAndPushNamed('/login/');
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
