import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteski/views/login_view.dart';
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
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                var user = FirebaseAuth.instance.currentUser;
                print(user);

                if (user?.emailVerified ?? false) {
                  return Text('email verified');
                } else {
                  return _VerifyEmail();
                }
              default:
                return const Text('loading');
            }
          },
        ));
  }
}

class _VerifyEmail extends StatefulWidget {
  const _VerifyEmail({super.key});

  @override
  State<_VerifyEmail> createState() => __VerifyEmailState();
}

class __VerifyEmailState extends State<_VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify email'),
      ),
      body: Column(
        children: [
          Text('please verify the email first'),
          TextButton(
            onPressed: () async {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null && !user.emailVerified) {
                await user.sendEmailVerification();
                print('Verification email sent');
              } else if (user?.emailVerified == true) {
                print('Email is already verified');
              } else {
                print('No user found');
              }
            },
            child: Text('Verify email'),
          ),
        ],
      ),
    );
  }
}
