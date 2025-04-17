import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/widget/animal_passport.dart';
import 'package:flutter/material.dart';

class Id extends StatelessWidget {
  final String stadoId;
  final String stadoName;
  final String stadoType;

  const Id({
    super.key,
    required this.stadoId,
    required this.stadoName,
    required this.stadoType,
  });

  String formatAnimalName(String type) {
    const map = {
      'коровы': 'Корова',
      'быки': 'Бык',
      'овцы': 'Овца',
      'козлы': 'Козел',
    };
    return map[type.toLowerCase()] ?? 'Неизвестно';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Технический паспорт',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'стадо $stadoName',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("stados")
                    .doc(stadoId)
                    .collection("animals")
                    .orderBy("createdAt", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Ошибка загрузки данных'));
                  }

                  final animals = snapshot.data?.docs ?? [];

                  if (animals.isEmpty) {
                    return const Center(child: Text(""));
                  }

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: animals.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final animal = animals[index];
                      final data = animal.data() as Map<String, dynamic>;

                      int? calculateAgeFromTimestamp(dynamic value) {
                        if (value is Timestamp) {
                          DateTime birthDate = value.toDate();
                          DateTime today = DateTime.now();
                          int age = today.year - birthDate.year;
                          if (today.month < birthDate.month ||
                              (today.month == birthDate.month &&
                                  today.day < birthDate.day)) {
                            age--;
                          }
                          return age;
                        }
                        return null;
                      }

                      final int? calculatedAge =
                          calculateAgeFromTimestamp(data['age']);

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: AnimalPassport(
                            animalName: formatAnimalName(stadoType),
                            age: calculatedAge != null
                                ? '$calculatedAge лет'
                                : '—',
                            weight: data['weight'] ?? '—',
                            breed: data['breed'] ?? '—',
                            healthStatus: data['health'] ?? 'unknown',
                            iconPath:
                                data['iconUrl'] ?? 'assets/icons/default.svg',
                            idNumber: data['tagnumber'] ?? '',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
