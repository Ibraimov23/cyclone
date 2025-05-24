import 'package:cyclone/main.dart';
import 'package:cyclone/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/svg.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/l10n.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await authService.value.signIn(
        controllerEmail.text,
        controllerPassword.text,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.message ?? "Ошибка при входе");
    } catch (e) {
      _showErrorDialog('Неизвестная ошибка: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Ошибка"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("ОК"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: Color(0xFF90010A), shape: BoxShape.circle),
          child: IconTheme(
              data: IconThemeData(color: Colors.white), child: BackButton()),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                loc.loginTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 2,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: loc.loginEmailHint,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Color(0xFF90010A), width: 2.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.redAccent, width: 2),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  letterSpacing: 0,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controllerPassword,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: loc.loginPasswordHint,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 24),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Color(0xFF90010A), width: 2.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.redAccent, width: 2),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  letterSpacing: 0,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/resetpassword');
                  },
                  child: Text(
                    loc.loginForgotPassword,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xFF90010A)),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90010A),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          loc.loginButton,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  loc.loginOrSignInWith,
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                ),
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
                          vertical: 18, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                      shadowColor: Colors.black12,
                      elevation: 3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/Social/facebook.svg',
                    ),
                  ),
                  const SizedBox(width: 13),
                  IconButton(
                    onPressed: () async {
                      try {
                        await authService.value.signInWithGoogle();
                      } catch (e) {
                        print("Ошибка при входе через Google: $e");
                      }
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                      shadowColor: Colors.black12,
                      elevation: 3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/Social/Google.svg',
                    ),
                  ),
                  const SizedBox(width: 13),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: BorderSide(color: Colors.grey.shade300),
                      shadowColor: Colors.black12,
                      elevation: 3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/Social/whatsaap.svg',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loc.loginNoAccount,
                    style: const TextStyle(fontSize: 14, letterSpacing: 1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text(
                      loc.loginSignUpButton,
                      style: const TextStyle(
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
      ),
    );
  }
}
