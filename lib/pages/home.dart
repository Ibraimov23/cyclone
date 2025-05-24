import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/pages/subpage.dart';
import 'package:cyclone/widget/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Map<String, dynamic>>> stadoData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    setState(() {
      stadoData = _fetchStadoData(userId);
    });
  }

  Future<List<Map<String, dynamic>>> _fetchStadoData(String userId) async {
    try {
      var stadosSnapshot = await FirebaseFirestore.instance
          .collection("stados")
          .where("userId", isEqualTo: userId)
          .get();

      if (stadosSnapshot.docs.isEmpty) return [];

      List<Future<Map<String, dynamic>>> fetchTasks =
          stadosSnapshot.docs.map((stado) async {
        var cattleTypeDoc = await FirebaseFirestore.instance
            .collection("typeofstados")
            .doc(stado["cattleTypeId"])
            .get();
        var animalsSnapshot = await FirebaseFirestore.instance
            .collection("stados")
            .doc(stado.id)
            .collection("animals")
            .get();

        return {
          "id": stado.id,
          "name": stado["name"],
          "cattleType": stado["cattleType"],
          "iconUrl": cattleTypeDoc.exists ? cattleTypeDoc["iconUrl"] : "",
          "count": "${animalsSnapshot.docs.length} шт",
        };
      }).toList();

      return await Future.wait(fetchTasks);
    } catch (e) {
      print("Ошибка загрузки данных: $e");
      return [];
    }
  }

  Future<void> _refreshData() async {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    final lang = Localizations.localeOf(context).languageCode;

    String getLocalizedAnimalType(BuildContext context, String originalType) {
      final loc = S.of(context);
      switch (originalType) {
        case 'Быки':
          return loc.bulls;
        case 'Коровы':
          return loc.cows;
        case 'Козлы':
          return loc.goats;
        case 'Овцы':
          return loc.sheep;
        default:
          return originalType;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? created =
              await Navigator.pushNamed(context, '/create') as bool?;
          if (created == true) {
            _loadData();
          }
        },
        backgroundColor: const Color(0xFF90010A),
        child: const Icon(Icons.add, size: 40, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            image: const DecorationImage(
              image: AssetImage('assets/pattern.png'),
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: stadoData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              }

              if (snapshot.hasError || snapshot.data == null) {
                return Center(child: Text(loc.loadingError));
              }

              var stadosList = snapshot.data!;

              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Text(
                    loc.homeTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 36),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: lang == 'ru' ? 1.071 : 1.078,
                    ),
                    itemCount: stadosList.length,
                    itemBuilder: (context, index) {
                      var cattle = stadosList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubPageScreen(
                                stadoId: cattle["id"],
                                stadoName: cattle["name"],
                                stadoType: cattle["cattleType"],
                              ),
                            ),
                          );
                        },
                        child: CustomCard(
                          title: getLocalizedAnimalType(
                              context, cattle["cattleType"]),
                          description:
                              '${loc.detailsCattleCount} \n${cattle["name"]}',
                          iconPath: cattle["iconUrl"],
                          count: cattle["count"],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CattleDetailsPage extends StatelessWidget {
  final String cattleId;

  CattleDetailsPage({required this.cattleId});

  String getLocalizedCattleType(String original, BuildContext context) {
    final loc = S.of(context);
    final locale = Localizations.localeOf(context).languageCode;

    if (locale == 'ru') return original;

    switch (original.toLowerCase()) {
      case 'быки':
        return loc.bulls;
      case 'коровы':
        return loc.cows;
      case 'козлы':
        return loc.goats;
      case 'овцы':
        return loc.sheep;
      default:
        return original;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали скота'),
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('stados')
              .doc(cattleId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(child: Text("Ошибка загрузки данных"));
            }

            var cattle = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).detailsCattleType}: ${getLocalizedCattleType(cattle["cattleType"], context)}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Номер скота: ${cattle["name"]}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Количество: ${cattle["count"]}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
