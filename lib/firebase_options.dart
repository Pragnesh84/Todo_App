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
    apiKey: 'AIzaSyDuTaTRZ6vfjUfJEonGYwGx5A249u1xBXg',
    appId: '1:733086186741:web:64d80b9f0e9651e76d59bc',
    messagingSenderId: '733086186741',
    projectId: 'first-74f8f',
    authDomain: 'first-74f8f.firebaseapp.com',
    databaseURL: 'https://first-74f8f-default-rtdb.firebaseio.com',
    storageBucket: 'first-74f8f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-xhOiyaHrrX7I7yBk-CtJ1LTtZSQJN9Y',
    appId: '1:733086186741:android:59fb33dbc5d1c35f6d59bc',
    messagingSenderId: '733086186741',
    projectId: 'first-74f8f',
    databaseURL: 'https://first-74f8f-default-rtdb.firebaseio.com',
    storageBucket: 'first-74f8f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCj_1fhxA2Ly_OUsFioOG9W0xdxZ2pTUps',
    appId: '1:733086186741:ios:94de80e8c397ca886d59bc',
    messagingSenderId: '733086186741',
    projectId: 'first-74f8f',
    databaseURL: 'https://first-74f8f-default-rtdb.firebaseio.com',
    storageBucket: 'first-74f8f.appspot.com',
    iosBundleId: 'com.example.first',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCj_1fhxA2Ly_OUsFioOG9W0xdxZ2pTUps',
    appId: '1:733086186741:ios:540dcec5a8092f656d59bc',
    messagingSenderId: '733086186741',
    projectId: 'first-74f8f',
    databaseURL: 'https://first-74f8f-default-rtdb.firebaseio.com',
    storageBucket: 'first-74f8f.appspot.com',
    iosBundleId: 'com.example.first.RunnerTests',
  );
}
