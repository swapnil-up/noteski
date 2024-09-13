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
    apiKey: 'AIzaSyCeQEphPlyBw09Vv4DCdil5RhWtkQpMX2M',
    appId: '1:1016276566678:web:535c409732c4632faeb8b7',
    messagingSenderId: '1016276566678',
    projectId: 'noteski',
    authDomain: 'noteski.firebaseapp.com',
    storageBucket: 'noteski.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpl-z-gIKArBs_NoE2xLLoVT_m_rn5fH0',
    appId: '1:1016276566678:android:897da15817ef82dfaeb8b7',
    messagingSenderId: '1016276566678',
    projectId: 'noteski',
    storageBucket: 'noteski.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9BMFKoeRwkNIPcphb8wvqEqfKIiBJJ3E',
    appId: '1:1016276566678:ios:5e14a2fd3965a108aeb8b7',
    messagingSenderId: '1016276566678',
    projectId: 'noteski',
    storageBucket: 'noteski.appspot.com',
    iosBundleId: 'com.example.noteski',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9BMFKoeRwkNIPcphb8wvqEqfKIiBJJ3E',
    appId: '1:1016276566678:ios:5e14a2fd3965a108aeb8b7',
    messagingSenderId: '1016276566678',
    projectId: 'noteski',
    storageBucket: 'noteski.appspot.com',
    iosBundleId: 'com.example.noteski',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeQEphPlyBw09Vv4DCdil5RhWtkQpMX2M',
    appId: '1:1016276566678:web:4ec333351cd5d0aaaeb8b7',
    messagingSenderId: '1016276566678',
    projectId: 'noteski',
    authDomain: 'noteski.firebaseapp.com',
    storageBucket: 'noteski.appspot.com',
  );
}
