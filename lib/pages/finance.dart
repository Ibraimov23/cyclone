import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Finance extends StatefulWidget {
  const Finance({super.key});

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  int _currentPage = 0; // Переменная для отслеживания текущей страницы

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // Отступы для круга
          decoration: BoxDecoration(
            color: const Color(0xFF90010A), // Красный фон для круга
            shape: BoxShape.circle, // Делаем круглую форму
          ),
          child: IconTheme(
            data: const IconThemeData(color: Colors.white), // Белый цвет иконки
            child: const BackButton(),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Финансы",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              // Карусель с карточками
              SizedBox(
                height: 190,
                child: FlutterCarousel(
                  items: List.generate(6, (index) {
                    return Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/visa_cart.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                  options: FlutterCarouselOptions(
                    showIndicator: true, // Включаем встроенный индикатор
                    enlargeCenterPage: true,
                    height: 190,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index; // Обновляем текущую страницу
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20), // Просто добавляем отступ
              // Кнопки "Изменить карту" и "Удалить карту"
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Цвет фона кнопки
                        foregroundColor: Colors.black, // Цвет текста
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Убираем закругления
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 13), // Отступы внутри кнопки
                      ),
                      onPressed: () {
                        // Действие при нажатии на кнопку "Изменить карту"
                      },
                      child: const Text(
                        'Изменить карту',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2), // Небольшой отступ между кнопками
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Цвет фона кнопки
                        foregroundColor: Colors.black, // Цвет текста
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Убираем закругления
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 13), // Отступы внутри кнопки
                      ),
                      onPressed: () {
                        // Действие при нажатии на кнопку "Удалить карту"
                      },
                      child: const Text(
                        'Удалить карту',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Белые контейнеры
              Container(
                width: double.infinity, // Ширина 100%
                height: 128, // Высота 128 пикселей
                color: Colors.white, // Белый фон
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity, // Ширина 100%
                height: 128, // Высота 128 пикселей
                color: Colors.white, // Белый фон
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity, // Ширина 100%
                height: 128, // Высота 128 пикселей
                color: Colors.white, // Белый фон
              ),
            ],
          ),
        ),
      ),
    );
  }
}
