import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:noteski/constants/routes.dart';

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
        title: const Text('verify email'),
      ),
      body: Column(
        children: [
          const Text(
              'A verification email has been sent, if you haven\'t received it yet, then click the button below'),
          TextButton(
            onPressed: () async {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null && !user.emailVerified) {
                await user.sendEmailVerification();
                devtools.log('Verification email sent');
              } else if (user?.emailVerified == true) {
                devtools.log('Email is already verified');
              } else {
                devtools.log('No user found');
              }
            },
            child: const Text('Send verification email'),
          ),
          TextButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('restart the process'),
          ),
        ],
      ),
    );
  }
}
