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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBvSRc-PEerGqqLrub3pcib6ySOzzbwIJA',
    appId: '1:855240514395:web:79680152a0b74526fa187e',
    messagingSenderId: '855240514395',
    projectId: 'tokopertanian-cc8b2',
    authDomain: 'tokopertanian-cc8b2.firebaseapp.com',
    storageBucket: 'tokopertanian-cc8b2.appspot.com',
    measurementId: 'G-XT614YNVY4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuK2Mmg71UmO9in1QN_NeyF8QZM6u9N84',
    appId: '1:855240514395:android:5e8be81a56142660fa187e',
    messagingSenderId: '855240514395',
    projectId: 'tokopertanian-cc8b2',
    storageBucket: 'tokopertanian-cc8b2.appspot.com',
  );
}
