import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteski/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

late TextEditingController _email;
late TextEditingController _password;

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(
                  children: [
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'enter your email',
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        hintText: 'enter your password',
                      ),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    TextButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          print(userCredential);
                        } on FirebaseAuthException catch (e) {
                          print(e.code);
                          if (e.code == 'invalid-email') {
                            print('use correct email format');
                          } else if (e.code == 'weak-password') {
                            print('password is a minimum of 6 characters');
                          } else if (e.code == 'email-already-in-use') {
                            print('email is already in use bro');
                          }
                        } catch (e) {
                          print(e);
                          print(e.runtimeType);
                        }
                      },
                      child: Text('Register'),
                    ),
                  ],
                );
              default:
                return const Text('loading');
            }
          },
        ));
  }
}
