import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/logo.svg',
                // Убедитесь, что изображение добавлено в папку assets и указано в pubspec.yaml
                height: 100,
              ),
              SizedBox(height: 30),
              Text(
                'CYCLONE APP',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Полная автоматизация процесса\nоткорма скота',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 42),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку "Вход"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF90010A),
                    padding: EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Вход',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку "Регистрация"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF90010A),
                    padding: EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
