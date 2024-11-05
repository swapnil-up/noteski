import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noteski/firebase_options.dart';
import 'package:noteski/services/auth/auth_provider.dart' as custom;
import 'package:noteski/services/auth/auth_users.dart';
import 'package:noteski/services/auth/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class FirebaseAuthProvider implements custom.AuthProvider {
  @override
  Future<AuthUser> createUser({
    required email,
    required password,
  }) async {
    try {
      await firebase.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else {
        throw GeneralAuthException();
      }
    } catch (e) {
      throw GeneralAuthException();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = firebase.FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> logIn({
    required email,
    required password,
  }) async {
    try {
      await firebase.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw InvalidCredentialException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw GeneralAuthException();
      }
    } catch (e) {
      throw GeneralAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = firebase.FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
