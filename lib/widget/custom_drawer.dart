import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // Закрываем Drawer при нажатии на иконку
                  Navigator.pop(context);
                },
                child: SvgPicture.asset("assets/icons/x.svg"),
              ),
            ),
            const SizedBox(height: 43),
            Center(
              child: Image.asset('assets/alina.png'),
            ),
            const SizedBox(height: 23),
            const Text(
              'Алина Р.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '+996990777222',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.36),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 20),
            _buildButton('Профиль'),
            const SizedBox(height: 25),
            _buildButton('Профиль'),
            const SizedBox(height: 25),
            _buildButton('Профиль'),
            const SizedBox(height: 25),
            _buildButton('Профиль'),
            const SizedBox(height: 25),
            _buildButton('Профиль'),
            const SizedBox(height: 25),
            _buildButton('Профиль'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
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
        onPressed: () {},
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
