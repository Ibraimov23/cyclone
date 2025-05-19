import 'package:cyclone/services/auth_service.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _resetPassword() async {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    final result = await authService.value
        .resetPasswordFromCurrentPassword(newPassword, confirmPassword);

    print(result);

    if (result == "Пароль успешно изменен.") {
      _showSuccessDialog(result);
    } else {
      _showErrorDialog(result);
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

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Успех"),
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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pattern.png'),
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Придумайте пароль',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите новый пароль',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите пароль',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 400),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _resetPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF90010A),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Изменить',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
