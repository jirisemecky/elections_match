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
    apiKey: 'AIzaSyB8nqD0-qD2XDFrsMPOyaVCRyBQ-BJbHsc',
    appId: '1:15847677615:web:76dfea50058c4f20dd7e5a',
    messagingSenderId: '15847677615',
    projectId: 'votehappy-951',
    authDomain: 'votehappy-951.firebaseapp.com',
    storageBucket: 'votehappy-951.appspot.com',
    measurementId: 'G-70E4FMQB4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvj-NfUso0HFN0lcNJqGQcbnYqiLxUVxs',
    appId: '1:15847677615:android:ed64133673867f18dd7e5a',
    messagingSenderId: '15847677615',
    projectId: 'votehappy-951',
    storageBucket: 'votehappy-951.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZFw1XxqLT749_xUUJC4ZXyWIYvOFEEO8',
    appId: '1:15847677615:ios:fbdaf331d2cadd42dd7e5a',
    messagingSenderId: '15847677615',
    projectId: 'votehappy-951',
    storageBucket: 'votehappy-951.appspot.com',
    iosBundleId: 'org.votehappy.elections.electionsMatch',
  );
}
