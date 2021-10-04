import 'package:bookclub/core/models/usermodels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  createAcc(UserModels models) async {
    await firebaseFirestore.collection('users').doc(models.uid).set({
      'userName': models.userName,
      'email': models.email,
      'accountCreated': Timestamp.now()
    });
  }
}
