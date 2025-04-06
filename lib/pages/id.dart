import 'package:cyclone/widget/animal_passport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Id extends StatefulWidget {
  const Id({super.key});

  @override
  State<Id> createState() => _IdState();
}

class _IdState extends State<Id> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Технический паспорт',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Стада №',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 40),
                      AnimalPassport(
                        animalName: 'Корова',
                        age: '12 лет',
                        weight: '90 кг',
                        breed: 'Голштинская',
                        healthStatus: 'good',
                        iconPath: 'assets/icons/beef_id.svg',
                        idNumber: '5483534',
                      ),
                      const SizedBox(height: 20),
                      AnimalPassport(
                        animalName: 'Баран',
                        age: '5 лет',
                        weight: '70 кг',
                        breed: 'Романовская',
                        healthStatus: 'bad',
                        iconPath: 'assets/icons/male_goat_id.svg',
                        idNumber: '7593899',
                      ),
                      const SizedBox(height: 20),
                      AnimalPassport(
                        animalName: 'Овца',
                        age: '7 лет',
                        weight: '45 кг',
                        breed: 'Мегрельская',
                        healthStatus: 'warning',
                        iconPath: 'assets/icons/goat_id.svg',
                        idNumber: '8954095',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Нижний контейнер с кнопками
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
              crossAxisAlignment: CrossAxisAlignment.center,
              // Центрируем по вертикали
              children: <Widget>[
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
                // Вставляем кастомную кнопку вместо текста "here"
                GestureDetector(
                  onTap: () {
                    print('Кастомная кнопка нажата!');
                  },
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: const Color(0xFF90010A), // Цвет фона #90010A
                      borderRadius: BorderRadius.circular(100), // Круглая форма
                    ),
                    padding: const EdgeInsets.all(4),
                    // Отступы
                    child: const Center(
                      child: Icon(
                        Icons.add, // Иконка плюса
                        color: Colors.white, // Цвет иконки
                        size: 16, // Размер иконки
                      ),
                    ),
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
                      'assets/icons/animal_info.svg',
                      width: 28,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
