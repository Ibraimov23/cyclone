import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimalPassport extends StatelessWidget {
  final String animalName;
  final String age;
  final String weight;
  final String breed;
  final String healthStatus; // "good", "warning", "bad"
  final String iconPath;
  final String idNumber;

  const AnimalPassport({
    super.key,
    required this.animalName,
    required this.age,
    required this.weight,
    required this.breed,
    required this.healthStatus,
    required this.iconPath,
    required this.idNumber,
  });

  Color _getHealthColor() {
    switch (healthStatus) {
      case "good":
        return const Color(0xFF18B027); // Зеленый
      case "warning":
        return const Color(0xFFFFA500); // Оранжевый
      case "bad":
        return const Color(0xFFD32F2F); // Красный
      default:
        return const Color(0xFF18B027); // По умолчанию зеленый
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFDFDFD),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                animalName,
                style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xFF90010A),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Возраст:',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Вес:',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Порода:',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Здоровье:',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
              Text(
                age,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                weight,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                breed,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 19,
                height: 19,
                decoration: BoxDecoration(
                  color: _getHealthColor(),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                idNumber,
                style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xFF90010A),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 15),
              SvgPicture.asset(iconPath),
            ],
          ),
        ],
      ),
    );
  }
}
