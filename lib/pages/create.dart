import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Создать стадо',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Название стадо",
                style: TextStyle(fontSize: 20, letterSpacing: -1),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Введите название стадо',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 17),
                ),
                style: const TextStyle(
                  fontSize: 13,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 11),
              const Text(
                "Вид скота",
                style: TextStyle(fontSize: 20, letterSpacing: -1),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Выберите вид скота',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 17),
                ),
                style: const TextStyle(
                  fontSize: 13,
                  letterSpacing: -1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
