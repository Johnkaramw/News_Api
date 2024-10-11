import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prog_john/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تهيئة Flutter Widgets
  await Firebase.initializeApp(); // تهيئة Firebase
  runApp(const JohnApp()); // تشغيل التطبيق
}

class JohnApp extends StatelessWidget {
  const JohnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // الصفحة الرئيسية
    );
  }
}
