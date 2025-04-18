import 'package:cyclone/pages/intro.dart';
import 'package:cyclone/widget/custom_app-bar.dart';
import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  final String username;
  final VoidCallback onLogout;

  const Instruction(
      {super.key, required this.username, required this.onLogout});

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: "Привет, ${widget.username}!",
        onMenuTap: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Как пользоваться',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ReusableInstructionCard(
                    title: 'Введение',
                    description: 'Описание как начать работу с приложением.',
                    duration: '15 минут',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Intro(
                            username: widget.username,
                            onLogout: widget.onLogout,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Главный экран',
                    description: 'Описание основ экрана и функций.',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Добавление скота',
                    description: 'Как добавить скот в систему.',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Тех паспорт / Добавление',
                    description: 'Как добавить техпаспорт животного.',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Таблица животных',
                    description: 'Как отслеживать животных в таблице.',
                    duration: '20 минут',
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Чат бот',
                    description: 'Как использовать чат-бота для общения.',
                    duration: '5 минут',
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Склад кормов',
                    description: 'Как добавить корма на склад.',
                    duration: '4 минут',
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: 'Отслеживание веса',
                    description: 'Как отслеживать изменение веса животных.',
                    duration: '20 минут',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableInstructionCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final VoidCallback? onTap;

  const ReusableInstructionCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFF90010A),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Длительность: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, color: Color(0xFF90010A)),
          ],
        ),
      ),
    );
  }
}
