import 'package:cyclone/generated/l10n.dart';
import 'package:cyclone/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }

  void register() async {
    try {
      String? reg = await authService.value.signUpAndSendEmailVerification(
        email: controllerEmail.text,
        password: controllerPassword.text,
        confirmPassword: controllerConfirmPassword.text,
      );
      print(reg);
      if (reg == 'email-send') {
        _showEmailSentDialog();
        await authService.value.waitForEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showAccountExistsDialog();
      } else {
        _showErrorDialog(e.message ?? 'Ошибка аутентификации');
      }
    } catch (e) {
      _showErrorDialog('Ошибка: $e');
    }
  }

  void _showAccountExistsDialog() {
    final loc = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(loc.accountAlreadyExistsTitle),
        content: Text(loc.accountAlreadyExistsMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(loc.ok),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    final loc = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.errorTitle),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(loc.ok),
          ),
        ],
      ),
    );
  }

  Future<void> _showEmailSentDialog() async {
    final loc = S.of(context);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(loc.emailSentTitle),
          content: Text(loc.emailSentMessage),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(loc.ok),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF90010A),
            shape: BoxShape.circle,
          ),
          child: const IconTheme(
            data: IconThemeData(color: Colors.white),
            child: BackButton(),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              loc.registration,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: loc.enterYourEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 19,
                  horizontal: 17,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controllerPassword,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: loc.enterPassword,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 19,
                  horizontal: 17,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controllerConfirmPassword,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: loc.confirmPassword,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 19,
                  horizontal: 17,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90010A),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  loc.register,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  loc.otherRegistrationMethods,
                  style: const TextStyle(fontSize: 14, letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: SvgPicture.asset('assets/Social/facebook.svg'),
                ),
                const SizedBox(width: 13),
                IconButton(
                  onPressed: () async {
                    try {
                      await authService.value.registerInWithGoogle();
                    } catch (e) {
                      print("Ошибка при входе через Google: $e");
                    }
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: SvgPicture.asset('assets/Social/Google.svg'),
                ),
                const SizedBox(width: 13),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  icon: SvgPicture.asset('assets/Social/whatsaap.svg'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  loc.alreadyHaveAccount,
                  style: const TextStyle(fontSize: 14, letterSpacing: 1),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text(
                    loc.login,
                    style: TextStyle(
                      color: Color(0xFF90010A),
                      fontWeight: FontWeight.w900,
                    ),
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
