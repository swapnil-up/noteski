import 'package:noteski/services/auth/auth_users.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  Future<AuthUser> createUser({
    required email,
    required password,
  });

  Future<AuthUser> logIn({
    required email,
    required password,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();
}
