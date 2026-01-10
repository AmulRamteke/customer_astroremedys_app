import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return android;
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCJvthRO-7SU9enYCFu21hJ9_hfZwJVesA",
    projectId: "customer-astroremedys",
    storageBucket: "customer-astroremedys.firebasestorage.app",
    messagingSenderId: "911263916570",
    appId: "1:911263916570:android:c1cda3797d1ad1d62727a3",
    // ✅ for com.astroremedys.customer
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyDsrsuJ2tx83rRPdTrAUKQRNhmmCTbEzxA",
    appId: "1:911263916570:ios:8b7457a378a25a902727a3",
    messagingSenderId: "911263916570",
    projectId: "customer-astroremedys",
    storageBucket: "customer-astroremedys.firebasestorage.app",
    iosBundleId: 'com.astroremedys.customer',
    measurementId: "G-KBPRBBZRYC",
  );
}
