import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        return const Color(0xFF18B027);
    }
  }

  String _shortenIdNumber(String id) {
    return id.length > 5 ? '${id.substring(0, 5)}..' : id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFDFDFD),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animalName,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color(0xFF90010A),
                    fontFamily: 'Montserat',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Возраст:', style: _labelStyle),
                const SizedBox(height: 10),
                const Text('Вес:', style: _labelStyle),
                const SizedBox(height: 10),
                const Text('Порода:', style: _labelStyle),
                const SizedBox(height: 10),
                const Text('Здоровье:', style: _labelStyle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _underlineText(age),
                const SizedBox(height: 10),
                _underlineText(weight),
                const SizedBox(height: 10),
                _underlineText(breed),
                const SizedBox(height: 13),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              children: [
                Text(
                  _shortenIdNumber(idNumber),
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xFF90010A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                SvgPicture.asset(iconPath),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _underlineText(String text) {
  return Container(
    constraints: const BoxConstraints(minWidth: 100),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
    ),
    padding: const EdgeInsets.only(bottom: 2),
    child: Text(
      text,
      style: _valueStyle,
      textAlign: TextAlign.right,
    ),
  );
}

Widget _labelWithUnderline(String label, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('$label ', style: _labelStyle),
      Flexible(
        fit: FlexFit.tight,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 20,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Text(
                value,
                style: _valueStyle,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

const TextStyle _labelStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

const TextStyle _valueStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
