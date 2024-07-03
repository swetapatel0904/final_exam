import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static AuthHelper helper = AuthHelper._();

  AuthHelper._();
  User? user;

  Future<String?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "Weak Password";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      } else {
        return "failed";
      }
    }
  }

  Future<String?> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      checkUser();
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return "failed";
      }
    }
  }

  bool checkUser() {
    user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
