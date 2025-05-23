import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../generated/l10n.dart';

class AnimalPassport extends StatelessWidget {
  final String animalName;
  final String age;
  final String weight;
  final String breed;
  final String healthStatus;
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
      case "Хорошее":
        return const Color(0xFF18B027);
      case "Среднее":
        return const Color(0xFFFFA500);
      case "Плохое":
        return const Color(0xFFD32F2F);
      default:
        return Colors.grey;
    }
  }

  String _shortenIdNumber(String id) {
    return id.length > 6 ? '${id.substring(0, 6)}...' : id;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SvgPicture.asset(
                    iconPath,
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  idNumber,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // 📋 Info Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animalName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF90010A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _infoRow(S.of(context).ageLabel, age),
                  _infoRow(S.of(context).weightLabel, weight),
                  _infoRow(S.of(context).breedLabel, breed),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                Text(
                  S.of(context).healthLabel,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: _getHealthColor(),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
