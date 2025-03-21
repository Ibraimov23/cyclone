import 'package:cyclone/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
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
            padding: EdgeInsets.only(right: 10),
            // Отступ справа на 10 пикселей
            child: InkWell(
              onTap: () {
                // Действие при нажатии
              },
              borderRadius: BorderRadius.circular(30),
              // Круглая область нажатия
              child: Container(
                width: 51,
                height: 51,
                decoration: BoxDecoration(
                  color: Color(0xFF90010A),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: 22,
                  height: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 11,
                      ),
                      const Text(
                        "Моя ферма",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 36),
                      // Отступ между текстом и карточками
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CustomCard(
                                title: 'Коровки',
                                description: 'мини описание',
                                iconPath: 'assets/beef.svg',
                                count: '17шт',
                              ),
                              const SizedBox(height: 31.0),
                              CustomCard(
                                title: 'Коровки',
                                description: 'мини описание',
                                iconPath: 'assets/beef.svg',
                                count: '17шт',
                              ),
                              const SizedBox(height: 31.0),
                              CustomCard(
                                title: 'Коровки',
                                description: 'мини описание',
                                iconPath: 'assets/beef.svg',
                                count: '17шт',
                              ),
                            ],
                          ),
                          const SizedBox(width: 60),
                          Column(
                            children: [
                              CustomCard(
                                title: 'Коровки',
                                description: 'мини описание',
                                iconPath: 'assets/beef.svg',
                                count: '17шт',
                              ),
                              const SizedBox(height: 31.0),
                              CustomCard(
                                title: 'Коровки',
                                description: 'мини описание',
                                iconPath: 'assets/beef.svg',
                                count: '17шт',
                              ),
                              const SizedBox(height: 31.0),
                              CustomCard(
                                title: 'Коровки',
                                description: 'мини описание',
                                iconPath: 'assets/beef.svg',
                                count: '17шт',
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 29),
                      // Отступ между карточками и иконкой
                      Container(
                        height: 80.0,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),
                        child: const Icon(
                          Icons.add,
                          size: 39,
                          color: Color(0xFF90010A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), // Top-left corner radius
                topRight: Radius.circular(20.0), // Top-right corner radius
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              // Align items at the bottom
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    width: 51,
                    height: 51,
                    decoration: BoxDecoration(
                      color: Color(0xFF90010A),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: 28,
                      height: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Centers content vertically
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // Centers content horizontally
                    children: [
                      SvgPicture.asset('assets/icons/shop.svg'),
                      SizedBox(height: 2), // Space between image and text
                      const Text(
                        'Магазин',
                        style: TextStyle(
                          fontSize: 10, // Text size
                          fontWeight: FontWeight.w500, // Text weight
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/chatbot', (route) => true);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Centers content vertically
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // Centers content horizontally
                    children: [
                      SvgPicture.asset('assets/icons/mesages.svg'),
                      SizedBox(height: 2), // Space between image and text
                      const Text(
                        'Чат Бот',
                        style: TextStyle(
                          fontSize: 10, // Text size
                          fontWeight: FontWeight.w500, // Text weight
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Centers content vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Centers content horizontally
                  children: [
                    SvgPicture.asset('assets/icons/food.svg'),
                    SizedBox(height: 2), // Space between image and text
                    const Text(
                      'Кормы',
                      style: TextStyle(
                        fontSize: 10, // Text size
                        fontWeight: FontWeight.w500, // Text weight
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
