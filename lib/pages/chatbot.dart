import 'package:cyclone/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF90010A),
            shape: BoxShape.circle,
          ),
          child: IconTheme(
            data: const IconThemeData(color: Colors.white),
            child: const BackButton(),
          ),
        ),
        title: const Text(
          "Йоу, Айганыш!",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Builder(
              builder: (context) => InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 51,
                  height: 51,
                  decoration: const BoxDecoration(
                    color: Color(0xFF90010A),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    const Text(
                      """Йоу, Айганыш! \nЧто хотите узнать?""",
                      style: TextStyle(
                        color: Color(0xFF90010A),
                        fontSize: 24,
                        fontWeight: FontWeight.w600, // Нормальный шрифт
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Текстовое поле внизу
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: const CustomTextField(),
          ),
          // Нижняя панель с кнопками
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/chatbot', (route) => true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/home_b.svg'),
                      const SizedBox(height: 2),
                      const Text(
                        'Ферма',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/shop.svg'),
                      const SizedBox(height: 2),
                      const Text(
                        'Магазин',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Container(
                    width: 51,
                    height: 51,
                    decoration: const BoxDecoration(
                      color: Color(0xFF90010A),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/icons/mesages_w.svg',
                      width: 28,
                      height: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Корзина нажата');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/food.svg'),
                      const SizedBox(height: 2),
                      const Text(
                        'Корзина',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}

// Класс CustomTextField
class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ширина 100%
      child: TextField(
        style: const TextStyle(
          color: Colors.white, // Белый цвет текста
          fontFamily: 'Montserrat', // Шрифт
          fontSize: 15, // Размер шрифта
          fontWeight: FontWeight.w500, // Жирность шрифта
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF90010A),
          // Цвет фона #90010A
          contentPadding: const EdgeInsets.all(15),
          // Отступы padding: 15px
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Скругление углов 20px
          ),
          hintText: 'Введите запрос',
          // Плейсхолдер
          hintStyle: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.52),
            // Цвет текста с прозрачностью
            fontFamily: 'Montserrat',
            // Шрифт
            fontSize: 15,
            // Размер шрифта
            fontWeight: FontWeight.w500,
            // Жирность шрифта
            fontStyle: FontStyle.normal, // Стиль шрифта
          ),
        ),
      ),
    );
  }
}
