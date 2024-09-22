import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
