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
    apiKey: 'AIzaSyBgLBjMDE-B3x_iYx7tkBpwi5wd-9IkTps',
    appId: '1:742360232394:web:e614e793b64e3296e55f33',
    messagingSenderId: '742360232394',
    projectId: 'examenpracticsim',
    authDomain: 'examenpracticsim.firebaseapp.com',
    databaseURL: 'https://examenpracticsim-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'examenpracticsim.firebasestorage.app',
    measurementId: 'G-CMGVWDG58N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwQVWOMpAy0PRvxAVJRxLcRIOsozd4too',
    appId: '1:742360232394:android:4d917cc2ebf771c9e55f33',
    messagingSenderId: '742360232394',
    projectId: 'examenpracticsim',
    databaseURL: 'https://examenpracticsim-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'examenpracticsim.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA38zRMGNzNl3g6bZ9csnnuh5jVyKo5wvQ',
    appId: '1:742360232394:ios:afc10be04160ae80e55f33',
    messagingSenderId: '742360232394',
    projectId: 'examenpracticsim',
    databaseURL: 'https://examenpracticsim-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'examenpracticsim.firebasestorage.app',
    iosBundleId: 'com.example.examenPracticSim',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA38zRMGNzNl3g6bZ9csnnuh5jVyKo5wvQ',
    appId: '1:742360232394:ios:afc10be04160ae80e55f33',
    messagingSenderId: '742360232394',
    projectId: 'examenpracticsim',
    databaseURL: 'https://examenpracticsim-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'examenpracticsim.firebasestorage.app',
    iosBundleId: 'com.example.examenPracticSim',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBgLBjMDE-B3x_iYx7tkBpwi5wd-9IkTps',
    appId: '1:742360232394:web:921f4f059561617ee55f33',
    messagingSenderId: '742360232394',
    projectId: 'examenpracticsim',
    authDomain: 'examenpracticsim.firebaseapp.com',
    databaseURL: 'https://examenpracticsim-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'examenpracticsim.firebasestorage.app',
    measurementId: 'G-JHKQJFQLXV',
  );
}
