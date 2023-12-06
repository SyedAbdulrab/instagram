import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';


class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  
  // add image to firebase storage

  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {
   Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
  
  if (isPost){
    String id =const Uuid().v1();
    ref = ref.child(id);
  }


  UploadTask uploadTask = ref.putData(file);
  //with this upload task thing we can control how our image is uploaded to firebase
  // put datat isnplace of put file as we are working with a Uint8List
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
  }
 }