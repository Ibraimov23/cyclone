import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Confirming extends StatefulWidget {
  const Confirming({super.key});

  @override
  State<Confirming> createState() => _ConfirmingState();
}

class _ConfirmingState extends State<Confirming> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF90010A),
            shape: BoxShape.circle,
          ),
          child: IconTheme(
            data: const IconThemeData(color: Colors.white),
            child: const BackButton(),
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
              const SizedBox(height: 43),
              const Text(
                'Введите код',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'На ваш номер был отправлен смс код, введите что бы завершить регистрацию',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 35),
              Center(
                child: Pinput(
                  length: 5,
                  controller: _pinController,
                  defaultPinTheme: defaultPinTheme,
                  separator: const SizedBox(width: 10),
                  onCompleted: (pin) {
                    print("Введенный код: $pin");
                  },
                ),
              ),
              const SizedBox(height: 54),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90010A),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Подтвердить',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Отправьте код снова',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '00:20',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
