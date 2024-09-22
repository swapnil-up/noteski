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
        '/register/': (context) => const RegisterView()
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
            print(user);

            if (user != null) {
              if (user.emailVerified) {
                print('email verified');
              } else {
                return VerifyEmail();
              }
            } else {
              return LoginView();
            }

            return const Text('done');

          default:
            return CircularProgressIndicator();
        }
      },
    );
  }
}
