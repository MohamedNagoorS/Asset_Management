import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD87zf6fjPl6jOhVpL_mtCq1CsCtmqZqSQ",
            authDomain: "asset-3b5cf.firebaseapp.com",
            projectId: "asset-3b5cf",
            storageBucket: "asset-3b5cf.appspot.com",
            messagingSenderId: "694313195507",
            appId: "1:694313195507:web:15a1657c49de47aaf4e486",
            measurementId: "G-2ZSDVDPC6D"));
  } else {
    await Firebase.initializeApp();
  }
}
