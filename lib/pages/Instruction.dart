import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  const Instruction({super.key});

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: Color(0xFF90010A), shape: BoxShape.circle),
            child: IconTheme(
                data: IconThemeData(color: Colors.white), child: BackButton()),
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Внешние отступы
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Как пользоваться',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Использование переиспользуемого виджета
                  ReusableInstructionCard(
                    title: 'Введение',
                    description: 'Описание',
                    duration: '15 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Главный экран',
                    description: 'Описание основ',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Добавление скота',
                    description: 'Описание основ',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Тех паспорт / Добавление',
                    description: 'Описание основ',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Таблица животных',
                    description: 'Описание основ',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Чат бот',
                    description: 'Описание основ',
                    duration: '5 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Склад кормов',
                    description: 'Описание основ',
                    duration: '4 минут',
                  ),
                  const SizedBox(height: 20), // Отступ между карточками
                  ReusableInstructionCard(
                    title: 'Отслеживание вес',
                    description: 'Описание основ',
                    duration: '20 минут',
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// Переиспользуемый виджет
class ReusableInstructionCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;

  const ReusableInstructionCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 62,
            color: const Color(0xFF90010A),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Длительность:',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward), // Замени на свою иконку
        ],
      ),
    );
  }
}
