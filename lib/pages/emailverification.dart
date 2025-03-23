import 'dart:async'; // Для Timer

import 'package:cyclone/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  final User user;

  EmailVerification(this.user);

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    checkEmailVerified();
  }

  Future<void> checkEmailVerified() async {
    await widget.user.reload();
    setState(() {
      isEmailVerified = widget.user.emailVerified;
    });

    if (isEmailVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  Future<void> resendVerificationEmail() async {
    await widget.user.sendEmailVerification();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Письмо отправлено повторно ✅")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Подтвердите email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Пожалуйста, проверьте свою почту"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkEmailVerified,
              child: Text("Я подтвердил"),
            ),
            TextButton(
              onPressed: resendVerificationEmail,
              child: Text("Отправить письмо еще раз"),
            ),
          ],
        ),
      ),
    );
  }
}
