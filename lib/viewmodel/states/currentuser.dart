import 'package:bookclub/core/firebasemanager/firestore.dart';
import 'package:bookclub/core/models/usermodels.dart';
import 'package:bookclub/screen/book/home_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentStates extends ChangeNotifier {
  UserModels currentUser = UserModels();

  UserModels get getCurrentUser => currentUser;

  late final FirebaseAuth _auth = FirebaseAuth.instance;

  Future singUpUser(String email, String password, String userName) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      currentUser.uid = credential.user!.uid;
      currentUser.email = credential.user!.email;
      currentUser.userName = userName;
      User? user = credential.user;
      FireStore().createAcc(currentUser);
    } catch (e) {}
  }

  Future loginWithGoole() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    await _googleSignIn.signIn();
//  GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();
//  GoogleSignInAuthentication? _googleSignInAuthentication =
//      await _googleSignInAccount!.authentication;
//  AuthCredential authCredential = GoogleAuthProvider.credential(
//      idToken: _googleSignInAuthentication.idToken,
//      accessToken: _googleSignInAuthentication.accessToken);
//  UserCredential credential =
//      await _auth.signInWithCredential(authCredential);
//  _uid = credential.user!.uid;
//  _email = credential.user!.email!;
  }

  Future<bool> onStartUp() async {
    try {
      _auth.currentUser;
      currentUser.uid = _auth.currentUser!.uid;
      currentUser.email = _auth.currentUser!.email.toString();
    } catch (e) {}
    return true;
  }

  Future loginUser(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        currentUser.uid = credential.user!.uid;
        currentUser.email = credential.user!.email!;
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
