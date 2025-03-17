import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF90010A),
            shape: BoxShape.circle,
          ),
          child: const IconTheme(
            data: IconThemeData(color: Colors.white),
            child: BackButton(),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Введение',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              const SizedBox(height: 15),
              const Text(
                'Информационные технологии (ИТ) — это использование любых компьютеров, хранилищ, сетей и других физических устройств, инфраструктуры и процессов для создания, обработки, хранения, защиты и обмена всеми формами электронных данных. Коммерческое использование ИТ охватывает как компьютерные технологии',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Центрируем изображение
              Center(
                child: Image.asset(
                  'assets/principles.png',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'ИТ-отдел обеспечивает правильное подключение и функционирование систем, сетей, данных и приложений организации. ИТ-отдел занимается тремя основными направлениями:\n'
                'развертывает и обслуживает бизнес-приложения, службы и инфраструктуру (серверы, сети, хранилища);\n'
                'отслеживает, оптимизирует и устраняет неполадки в работе приложений, служб и инфраструктуры; и\n'
                'контролирует безопасность и управление приложениями, службами и инфраструктурой.',
                style: TextStyle(
                  fontSize: 14,
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
