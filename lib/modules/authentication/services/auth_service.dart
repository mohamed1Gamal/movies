import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<User?> createAccount({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      await credential.user?.updateProfile(displayName: name);
      await credential.user?.updateDisplayName(name);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw e.message ?? "";
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return credential.user!;
      } on FirebaseAuthException {
        throw 'Invalid Email or Password';
      }
    } catch (e) {
      rethrow;
    }
  }


  static Future<void> forgetPassword({
    required String email,
  }) async {
    try {
      try {
         await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email);
      } on FirebaseAuthException  {
        throw 'Invalid Email or Password';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }

}
