// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDeA6MyeaKCuCqjNOGstXtMSx4J8cDJ-sk',
    appId: '1:581394803783:web:fb654b2d4ef2230677d562',
    messagingSenderId: '581394803783',
    projectId: 'instagram-c2',
    authDomain: 'instagram-c2.firebaseapp.com',
    storageBucket: 'instagram-c2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuKmnCi4q4xt_3gQFom7kSjwBmjPS_3Yg',
    appId: '1:581394803783:android:2c1a98c1c4361e7e77d562',
    messagingSenderId: '581394803783',
    projectId: 'instagram-c2',
    storageBucket: 'instagram-c2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3Sv8-4_HgKqRfOaDbSSiK5CvRqQo1bg4',
    appId: '1:581394803783:ios:c5d9040b7a43877b77d562',
    messagingSenderId: '581394803783',
    projectId: 'instagram-c2',
    storageBucket: 'instagram-c2.appspot.com',
    iosBundleId: 'com.example.instagram',
  );
}
