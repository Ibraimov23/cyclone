import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Sigin extends StatefulWidget {
  const Sigin({super.key});

  @override
  State<Sigin> createState() => _siginState();
}

class _siginState extends State<Sigin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // Отступы для круга
          decoration: BoxDecoration(
            color: Color(0xFF90010A), // Красный фон для круга
            shape: BoxShape.circle, // Делаем круглую форму
          ),
          child: IconTheme(
            data: IconThemeData(color: Colors.white), // Белый цвет иконки
            child: BackButton(),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Регистрация',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Введите имя пользователя',
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
                  fontSize: 13,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
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
                    vertical: 19,
                    horizontal: 17,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 13,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Подтвердите пароль',
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
                  fontSize: 13,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ваш номер телефона',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[400]!),
                    bottom: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      '+ 996',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      '|',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        maxLength: 9,
                        decoration: const InputDecoration(
                          hintText: '000 000 000',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90010A),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Зарегистрироваться',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '———— Другой способ регистрации ————',
                    style: TextStyle(fontSize: 14),
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
                    icon: SvgPicture.asset(
                      'assets/Social/facebook.svg',
                    ),
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
                        vertical: 18,
                        horizontal: 40,
                      ),
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
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Уже есть аккаунт?',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      // Действие при нажатии на кнопку
                    },
                    child: const Text(
                      'Вход',
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
