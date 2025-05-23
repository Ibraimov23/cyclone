import 'package:cyclone/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class EmailVerification extends StatefulWidget {
  final User user;

  const EmailVerification(this.user, {super.key});

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
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  Future<void> resendVerificationEmail() async {
    await widget.user.sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        S.of(context).emailSentAgain,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF90010A),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.confirmYourEmail)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.checkYourEmail),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkEmailVerified,
              child: Text(l10n.iHaveConfirmed),
            ),
            TextButton(
              onPressed: resendVerificationEmail,
              child: Text(l10n.resendVerification),
            ),
          ],
        ),
      ),
    );
  }
}
