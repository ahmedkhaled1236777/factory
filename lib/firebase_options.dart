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
    apiKey: 'AIzaSyCEmKZCb3XETyGRKBk44TMxtkroCb6jG0I',
    appId: '1:901023408306:web:4fcf85cf2254fc48cce9ab',
    messagingSenderId: '901023408306',
    projectId: 'factory-e9054',
    authDomain: 'factory-e9054.firebaseapp.com',
    storageBucket: 'factory-e9054.appspot.com',
    measurementId: 'G-C99MNM3MNE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0pooAZVnsTa1cYtpWcDXkPrp-wOiZDrs',
    appId: '1:901023408306:android:3b5025e7739b62a5cce9ab',
    messagingSenderId: '901023408306',
    projectId: 'factory-e9054',
    storageBucket: 'factory-e9054.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgARaOQQ8Zs41xVDk_BaF9DpNXbONf0xs',
    appId: '1:901023408306:ios:ab1c5a0c5d5ff6b5cce9ab',
    messagingSenderId: '901023408306',
    projectId: 'factory-e9054',
    storageBucket: 'factory-e9054.appspot.com',
    iosClientId: '901023408306-456h14bvvk40iolag436ssvolpl2elb0.apps.googleusercontent.com',
    iosBundleId: 'com.example.facApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgARaOQQ8Zs41xVDk_BaF9DpNXbONf0xs',
    appId: '1:901023408306:ios:ab1c5a0c5d5ff6b5cce9ab',
    messagingSenderId: '901023408306',
    projectId: 'factory-e9054',
    storageBucket: 'factory-e9054.appspot.com',
    iosClientId: '901023408306-456h14bvvk40iolag436ssvolpl2elb0.apps.googleusercontent.com',
    iosBundleId: 'com.example.facApp',
  );
}
