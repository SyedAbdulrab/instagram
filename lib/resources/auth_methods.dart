import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/user.dart' as model;
import 'package:instagram/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // with this we gaet an instance fo the fireebase auth class and we can acall mehods on that instance
  //signup function

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails () async {
    User _currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(_currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> signupUser({
    required String email,
    required String password,
    required String bio,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      //first we make valudations;
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //email and password wil be stored in the authentication tab but we need to store the other studd in the firestore database as well
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        //now add user to database

        model.User user = model.User(
            username: username,
            uid: cred.user!.uid,
            email: email,
            bio: bio,
            photoUrl: photoUrl,
            following: [],
            followers: []);

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
