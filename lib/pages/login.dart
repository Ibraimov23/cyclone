import 'package:cyclone/main.dart';
import 'package:cyclone/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/svg.dart";

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: Color(0xFF90010A), shape: BoxShape.circle),
          child: IconTheme(
              data: IconThemeData(color: Colors.white), child: BackButton()),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Вход',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Введите вашу почту',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 17),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: controllerPassword,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Введите пароль',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 17),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/resetpassword');
                  },
                  child: const Text(
                    'Забыли пароль?',
                    style: TextStyle(fontSize: 14, color: Color(0xFF90010A)),
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
                      : const Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  '———— Другой способ входа ————',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
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
                    'У вас нет аккаунта?',
                    style: TextStyle(fontSize: 14, letterSpacing: 1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: Text(
                      'Регистрация',
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
      ),
    );
  }
}
