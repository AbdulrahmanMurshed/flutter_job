// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCeIQG18u2cA0PYc4md8_-SvWgkcPWjDdc',
    appId: '1:393434818058:web:6a15e704409313497221f3',
    messagingSenderId: '393434818058',
    projectId: 'searchjob-a9f3e',
    authDomain: 'searchjob-a9f3e.firebaseapp.com',
    storageBucket: 'searchjob-a9f3e.firebasestorage.app',
    measurementId: 'G-TTB7QEE1W5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs_EFki_4NDCxaJSSrXgizucHdQ5FBylY',
    appId: '1:393434818058:android:f7a3ad1a3f6cf70a7221f3',
    messagingSenderId: '393434818058',
    projectId: 'searchjob-a9f3e',
    storageBucket: 'searchjob-a9f3e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7PzhHcsC6XUNvXtl-wyeNWYID6o_wVGQ',
    appId: '1:393434818058:ios:d1e103824f1f97c77221f3',
    messagingSenderId: '393434818058',
    projectId: 'searchjob-a9f3e',
    storageBucket: 'searchjob-a9f3e.firebasestorage.app',
    iosBundleId: 'com.example.searchJob',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7PzhHcsC6XUNvXtl-wyeNWYID6o_wVGQ',
    appId: '1:393434818058:ios:d1e103824f1f97c77221f3',
    messagingSenderId: '393434818058',
    projectId: 'searchjob-a9f3e',
    storageBucket: 'searchjob-a9f3e.firebasestorage.app',
    iosBundleId: 'com.example.searchJob',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeIQG18u2cA0PYc4md8_-SvWgkcPWjDdc',
    appId: '1:393434818058:web:d74b1708e1ad63d87221f3',
    messagingSenderId: '393434818058',
    projectId: 'searchjob-a9f3e',
    authDomain: 'searchjob-a9f3e.firebaseapp.com',
    storageBucket: 'searchjob-a9f3e.firebasestorage.app',
    measurementId: 'G-Q11M7HRBHK',
  );
}
