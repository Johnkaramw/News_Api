import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prog_john/screens/login.dart';

// قم بإدخال معلومات Firebase الخاصة بمشروعك هنا
FirebaseOptions get firebaseOptions => const FirebaseOptions(
      apiKey: "AIzaSyCnoGQbQF51tPMzxlXLBVnhtCqMgRt2NkM",
      authDomain: "john-e28e6.firebaseapp.com",
      projectId: "john-e28e6",
      storageBucket: "john-e28e6.appspot.com",
      messagingSenderId: "886890617790",
      appId: "1:886890617790:web:562d6bacac43910c5f77ef",
      measurementId: "G-LDERJ83G4Y",
    );

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تهيئة Flutter Widgets

  // تهيئة Firebase مع FirebaseOptions للويب
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  runApp(const JohnApp()); // تشغيل التطبيق
}

class JohnApp extends StatelessWidget {
  const JohnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage (), // الصفحة الرئيسية
    );
  }
}
