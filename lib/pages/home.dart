import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyclone/pages/subpage.dart';
import 'package:cyclone/widget/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            image: DecorationImage(
              image: const AssetImage('assets/pattern.png'),
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: stadoData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.red));
              }

              if (snapshot.hasError || snapshot.data == null) {
                return const Center(child: Text("Ошибка загрузки"));
              }

              var stadosList = snapshot.data!;

              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    "Моя ферма",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const SizedBox(height: 36),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 1.077,
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
                          title: cattle["cattleType"],
                          description: 'номер скота \n${cattle["name"]}',
                          iconPath: cattle["iconUrl"],
                          count: cattle["count"],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        bool? created =
                            await Navigator.pushNamed(context, '/create')
                                as bool?;

                        if (created == true) {
                          _loadData();
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFF90010A),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
                    'Тип скота: ${cattle["cattleType"]}',
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
