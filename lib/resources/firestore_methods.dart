import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';
class FirestoreMethods{
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;


    Future <String> uploadPost(
      String uid,
      Uint8List file,
      String description,
      String username,
      String profImage
    ) async {
      String res = "some error Occurred";

      try {
        String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);
        String postId = const Uuid().v1();
        Post post = Post(
          description: description, uid: uid, username: username, 
          postId: postId, 
          datePublished: DateTime.now(), 
          postUrl: photoUrl,
           profImage: profImage, 
           likes: []);

           _firestore.collection('posts').doc(postId).set(post.toJson());
          res = "success";
          return res;

      } catch (err) {
        res = err.toString();
        return res;
      }
    }
}