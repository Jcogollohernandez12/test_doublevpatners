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
    apiKey: 'AIzaSyAYpk2jA65UvKmg1NmY37bNp0bHSwxW7PU',
    appId: '1:139140007452:web:4b8727c693d698703c41d9',
    messagingSenderId: '139140007452',
    projectId: 'flutter-notificacion-ed0fe',
    authDomain: 'flutter-notificacion-ed0fe.firebaseapp.com',
    storageBucket: 'flutter-notificacion-ed0fe.appspot.com',
    measurementId: 'G-8NDW6YHKMJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCP9vrkLSTfezR0yTlULcM8euNhMD8jPEA',
    appId: '1:139140007452:android:f72c305bd03db1d93c41d9',
    messagingSenderId: '139140007452',
    projectId: 'flutter-notificacion-ed0fe',
    storageBucket: 'flutter-notificacion-ed0fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbB2WA1ulQTsgPN-psCo_aeEqmZMmf3f8',
    appId: '1:139140007452:ios:80895784201ca6d13c41d9',
    messagingSenderId: '139140007452',
    projectId: 'flutter-notificacion-ed0fe',
    storageBucket: 'flutter-notificacion-ed0fe.appspot.com',
    iosClientId: '139140007452-bl0rmh8e7crh3fg0ltht975222pkh4va.apps.googleusercontent.com',
    iosBundleId: 'com.example.appTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbB2WA1ulQTsgPN-psCo_aeEqmZMmf3f8',
    appId: '1:139140007452:ios:4c3497cb9e69c6443c41d9',
    messagingSenderId: '139140007452',
    projectId: 'flutter-notificacion-ed0fe',
    storageBucket: 'flutter-notificacion-ed0fe.appspot.com',
    iosClientId: '139140007452-isve60i4lbn4caph2jlnf3mvnsqphp3s.apps.googleusercontent.com',
    iosBundleId: 'com.example.appTest.RunnerTests',
  );
}
