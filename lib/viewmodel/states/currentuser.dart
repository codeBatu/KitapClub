import 'package:bookclub/screen/book/home_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentStates extends ChangeNotifier {
  late String _uid;
  late String _email;
  String get getUid => _uid;
  String get getEmail => _email;
  late final FirebaseAuth _auth = FirebaseAuth.instance;

  Future singUpUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {}
  }

  Future loginUser(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        _uid = credential.user!.uid;
        _email = credential.user!.email!;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (x) {
              return const HomePageView();
            },
          ),
        );
      } else {}
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email :$email Veya Şifre: $password Hatalı \nHata$e"),
        ),
      );
    }
  }
}
