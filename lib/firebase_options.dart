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
        return macos;
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
    apiKey: 'AIzaSyDXRph0IMTPS569yW-zyRHQNdJg6sngPZs',
    appId: '1:575010581487:web:dd38a318c766041653e41a',
    messagingSenderId: '575010581487',
    projectId: 'chatapp-21f27',
    authDomain: 'chatapp-21f27.firebaseapp.com',
    storageBucket: 'chatapp-21f27.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABL-YLd6-Qogtp28JeOqvJRscZdOO8PhM',
    appId: '1:575010581487:android:0a607f4d114a771b53e41a',
    messagingSenderId: '575010581487',
    projectId: 'chatapp-21f27',
    storageBucket: 'chatapp-21f27.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHIioY9qcD0arW0VXOoM3C88Huu93ysEo',
    appId: '1:575010581487:ios:b530a11adf2550cb53e41a',
    messagingSenderId: '575010581487',
    projectId: 'chatapp-21f27',
    storageBucket: 'chatapp-21f27.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHIioY9qcD0arW0VXOoM3C88Huu93ysEo',
    appId: '1:575010581487:ios:5a6d2f5681c5c1b453e41a',
    messagingSenderId: '575010581487',
    projectId: 'chatapp-21f27',
    storageBucket: 'chatapp-21f27.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}