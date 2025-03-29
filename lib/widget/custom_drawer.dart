import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String title;
  final VoidCallback onLogout;

  const CustomDrawer({Key? key, required this.title, required this.onLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 43),
            Center(
              child: Image.asset('assets/alina.png'),
            ),
            const SizedBox(height: 23),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 50),
            _buildButton('Профиль', onPressed: () {
              Navigator.pushNamed(context, '/profile');
            }),
            const SizedBox(height: 25),
            _buildButton('Финансы'),
            const SizedBox(height: 25),
            _buildButton('Язык'),
            const SizedBox(height: 25),
            _buildButton('Статистика'),
            const SizedBox(height: 25),
            _buildButton('Добавить аккаунт', onPressed: () {
              Navigator.pushNamed(context, '/signin');
            }),
            const SizedBox(height: 25),
            _buildButton('Изменить пароль', onPressed: () {
              Navigator.pushNamed(context, '/newpassword');
            }),
            const SizedBox(height: 25),
            _buildButton('Выйти', onPressed: onLogout),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF90010A),
            width: 1,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          backgroundColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
