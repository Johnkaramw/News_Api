import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog_john/screens/Homepage.dart';
import 'package:prog_john/screens/login.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _passwordStrength = '';
  Color _passwordStrengthColor = Colors.grey;
  String? _phoneErrorMessage; // متغير لرسالة خطأ رقم الهاتف
  String? _emailErrorMessage; // متغير لرسالة خطأ البريد الإلكتروني

  // التحقق من صحة البريد الإلكتروني
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _emailErrorMessage =
          'يرجى إدخال بريد إلكتروني صحيح مثل: johnkaram600@gmail.com';
      return false;
    }
    _emailErrorMessage = null; // إعادة تعيين رسالة الخطأ إذا كانت الصيغة صحيحة
    return true;
  }

  // التحقق من صحة كلمة المرور
  bool _isValidPassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  // التحقق من صحة رقم الهاتف
  bool _isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^\d{11}$');
    if (!phoneRegex.hasMatch(phone)) {
      _phoneErrorMessage = 'يرجى إدخال رقم هاتف صحيح مكون من 11 رقمًا.';
      return false;
    }
    _phoneErrorMessage =
        null; // إعادة تعيين رسالة الخطأ إذا كان رقم الهاتف صحيح
    return true;
  }

  // حساب قوة كلمة المرور
  void _checkPasswordStrength(String password) {
    if (password.isEmpty) {
      _passwordStrength = 'ضعيف';
      _passwordStrengthColor = Colors.grey;
    } else if (password.length < 6) {
      _passwordStrength = 'ضعيف';
      _passwordStrengthColor = Colors.red;
    } else if (password.length < 8) {
      _passwordStrength = 'متوسط';
      _passwordStrengthColor = Colors.orange;
    } else if (_isValidPassword(password)) {
      _passwordStrength = 'قوي';
      _passwordStrengthColor = Colors.green;
    } else {
      _passwordStrength = 'متوسط';
      _passwordStrengthColor = Colors.orange;
    }
    setState(() {});
  }

  Future<void> _signUp() async {
    try {
      if (!_isValidEmail(_emailController.text.trim())) {
        _showError(_emailErrorMessage!);
        return;
      }

      if (!_isValidPhoneNumber(_phoneController.text.trim())) {
        _showError(_phoneErrorMessage!);
        return;
      }

      if (!_isValidPassword(_passwordController.text.trim())) {
        _showError(
            'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل وتحتوي على رقم وعلامة خاصة.');
        return;
      }

      if (_passwordController.text != _confirmPasswordController.text) {
        _showError('كلمات المرور غير متطابقة.');
        return;
      }

      // إنشاء المستخدم في Firebase
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // حفظ البيانات في Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/help.png',
              height: 100, // يمكنك تعديل الحجم حسب رغبتك
            ),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: 'اسم المستخدم',
                
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
                border: const OutlineInputBorder(),
                errorText:
                    _phoneErrorMessage, // عرض رسالة الخطأ إذا كانت موجودة
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'البريد الالكترونى',
                border: const OutlineInputBorder(),
                errorText:
                    _emailErrorMessage, // عرض رسالة الخطأ إذا كانت موجودة
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: _checkPasswordStrength,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('قوة كلمة المرور:'),
                const SizedBox(width: 8),
                Text(
                  _passwordStrength,
                  style: TextStyle(
                    color: _passwordStrengthColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'تأكيد كلمة المرور',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Homepage()));
              },
              child: const Text('إنشاء الحساب'),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('إذا كان لديك حساب بالفعل،'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'تسجيل دخول',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
