import 'package:flutter/material.dart';

class Adding extends StatefulWidget {
  const Adding({super.key});

  @override
  State<Adding> createState() => _AddingState();
}

class _AddingState extends State<Adding> {
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Добавить карту",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 3), // Отступы 12 и 5 пикселей
                    color: Colors.white, // Белый фон
                    child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(),
                      icon: Image.asset(
                        'assets/icons/visa_logo.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 3), // Отступы 12 и 5 пикселей
                    color: Colors.white, // Белый фон
                    child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(),
                      icon: Image.asset(
                        'assets/icons/mastercard_logo.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 3), // Отступы 12 и 5 пикселей
                    color: Colors.white, // Белый фон
                    child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(),
                      icon: Image.asset(
                        'assets/icons/jazzcash_logo.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Название Карты",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // Background color
                  hintText: 'Название',
                  // Placeholder text
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.45), // Placeholder color
                    fontSize: 13, // Font size
                    fontWeight: FontWeight.w500, // Font weight
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                  // Padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    // Optional: Add border radius
                    borderSide: BorderSide.none, // Remove border
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("Номер Карты",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // Background color
                  hintText: 'XXXX   XXXX   XXXX   XXXX',
                  // Placeholder text
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.45), // Placeholder color
                    fontSize: 13, // Font size
                    fontWeight: FontWeight.w500, // Font weight
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                  // Padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    // Optional: Add border radius
                    borderSide: BorderSide.none, // Remove border
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Дата/Год",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        const SizedBox(height: 4),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'MM/YY',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.45),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 11),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Защитный код",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        const SizedBox(height: 4),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'CVV',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.45),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 11),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("Почтовый Индекс",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(
                height: 4,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // Background color
                  hintText: 'XXXX',
                  // Placeholder text
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.45), // Placeholder color
                    fontSize: 13, // Font size
                    fontWeight: FontWeight.w500, // Font weight
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                  // Padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    // Optional: Add border radius
                    borderSide: BorderSide.none, // Remove border
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity, // Растягиваем на всю ширину
                child: ElevatedButton(
                  onPressed: () {
                    // Добавьте логику для кнопки "Зарегистрироваться"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90010A),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Добавить',
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
