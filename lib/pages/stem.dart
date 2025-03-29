import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Steam extends StatefulWidget {
  const Steam({super.key});

  @override
  State<Steam> createState() => _SteamState();
}

class _SteamState extends State<Steam> {
  List<Map<String, String>> data = [
    {'name': 'Дата и время', 'value': '30.09.2025'},
    {'name': 'Овес', 'value': '5.5 кг'},
    {'name': 'Кукуруза', 'value': '12 кг'},
    {'name': 'Силос', 'value': '3 кг'},
    {'name': 'Солома', 'value': '5.2 кг'},
    {'name': 'Горох', 'value': '7.1 кг'},
    {'name': 'Трава', 'value': '2 кг'},
    {'name': 'Сено', 'value': '12 кг'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE7E7E7),
            image: DecorationImage(
              image: AssetImage('assets/pattern.png'),
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Склад кормов",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 23),
                      // Table
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF90010A),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                        ),
                                      ),
                                      child: const Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Row(children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              'Название',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ])),
                                    ),
                                  ),
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF90010A),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          'Значение',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ..._buildTableRows(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Save button
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add save logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF90010A),
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Сохранить',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> _buildTableRows() {
    return data.map((item) {
      int index = data.indexOf(item);
      return Container(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? const Color(0xFFF9F9F9) : Colors.white,
          borderRadius: index == data.length - 1
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 12, 12, 12),
                child: Text(
                  item['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 30, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    item['name'] == 'Дата и время'
                        ? Text(
                            item['value']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              String? newValue = await _showEditDialog(
                                  context, item['value']!);
                              if (newValue != null && newValue.isNotEmpty) {
                                setState(() {
                                  item['value'] = newValue + ' кг';
                                });
                              }
                            },
                            child: Text(
                              item['value']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                    SvgPicture.asset(
                      'assets/icons/pen.svg',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Future<String?> _showEditDialog(BuildContext context, String currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue.split(' ')[0]);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Изменить значение'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration:
                const InputDecoration(hintText: 'Введите новое значение'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
