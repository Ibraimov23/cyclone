import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../generated/l10n.dart';

class TableScreen extends StatefulWidget {
  final String stadoId;
  final String stadoName;

  const TableScreen({
    super.key,
    required this.stadoId,
    required this.stadoName,
  });

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  Map<String, double> feedRatios = {};

  List<String> dates = [];
  List<String> feedNames = [];

  Map<String, Map<String, String>> feedIdByReceptionAndName = {};

  List<Map<String, dynamic>> data = [];
  List<String> totals = [];
  Map<String, Map<String, num>> tableData = {};
  bool isLoading = true;
  final ScrollController _horizontalController = ScrollController();

  static const _headerTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const _cellTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const _footerTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const _tableTitleStyle = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 2);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final firestore = FirebaseFirestore.instance;
    final tablesCollection =
        firestore.collection('stados').doc(widget.stadoId).collection('tables');
    final tablesSnapshot = await tablesCollection.get();
    final receptionNames = tablesSnapshot.docs.map((doc) => doc.id).toList()
      ..sort();
    final Set<String> feedNamesSet = {};
    List<Map<String, double>> receptionsFeedValues =
        List.generate(receptionNames.length, (_) => {});
    final Map<String, double> feedUnits = {};
    feedIdByReceptionAndName.clear();
    for (int i = 0; i < receptionNames.length; i++) {
      final receptionId = receptionNames[i];
      final feedsSnapshot =
          await tablesCollection.doc(receptionId).collection('feeds').get();
      final Map<String, double> feedValues = {};
      feedIdByReceptionAndName[receptionId] = {};
      for (var feedDoc in feedsSnapshot.docs) {
        final data = feedDoc.data();
        final feedId = feedDoc.id;
        final String? feedName = data['name'];
        final dynamic value = data['value'];
        final dynamic unitDynamic = data['feedUnit'];
        if (feedName != null && value is num) {
          feedValues[feedName] = value.toDouble();
          feedNamesSet.add(feedName);

          feedIdByReceptionAndName[receptionId]![feedName] = feedId;

          if (unitDynamic != null) {
            feedUnits[feedName] = unitDynamic.toDouble();
          } else {
            feedUnits[feedName] = 1.0;
          }
        }
      }
      receptionsFeedValues[i] = feedValues;
    }
    final feedNames = feedNamesSet.toList()..sort();
    final Map<String, double> tempFeedRatios = {
      for (var feed in feedNames) feed: feedUnits[feed] ?? 1.0,
    };
    Map<String, List<double>> feedValuesByReception = {
      for (var feed in feedNames) feed: List.filled(receptionNames.length, 0.0),
    };
    for (int i = 0; i < receptionNames.length; i++) {
      final feedMap = receptionsFeedValues[i];
      for (var feed in feedNames) {
        feedValuesByReception[feed]![i] = feedMap[feed] ?? 0.0;
      }
    }
    final List<Map<String, dynamic>> tempData = feedNames.map((feed) {
      final values = feedValuesByReception[feed]!;
      return {
        'origin': feed,
        'name': '$feed (${(feedUnits[feed] ?? 1.0).toStringAsFixed(1)})',
        'values': values.map((v) => v.toStringAsFixed(1)).toList(),
      };
    }).toList();
    final List<String> tempTotals = List.generate(receptionNames.length, (i) {
      double sum = 0;
      for (var feed in feedNames) {
        sum += feedValuesByReception[feed]![i] * (tempFeedRatios[feed] ?? 1.0);
      }
      return sum.toStringAsFixed(1);
    });
    setState(() {
      data = tempData;
      totals = tempTotals;
      dates = receptionNames;
      feedRatios = tempFeedRatios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE7E7E7),
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(S.of(context).tableTitle, style: _tableTitleStyle),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '${S.of(context).herd} ',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: widget.stadoName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 30,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 130,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xFF960C0C),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/stern.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                              SvgPicture.asset(
                                'assets/icons/one.svg',
                                width: 24,
                                height: 24,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(feedRatios.length, (i) {
                          final key = feedRatios.keys.elementAt(i);
                          final value = feedRatios[key] ?? 0.0;
                          final isEven = i.isEven;
                          final rowColor =
                              isEven ? const Color(0xFFF9F9F9) : Colors.white;

                          return Container(
                            width: 130,
                            height: 50,
                            color: rowColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    key,
                                    style: _cellTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  value.toStringAsFixed(1),
                                  style: _cellTextStyle,
                                ),
                              ],
                            ),
                          );
                        }),
                        Container(
                          width: 130,
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            S.of(context).feedUnit,
                            style: _footerTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _horizontalController,
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Color(0xFF960C0C),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                children: dates.map((d) {
                                  final index = dates.indexOf(d) + 1;
                                  return Container(
                                    width: 80,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${S.of(context).reception} $index',
                                      style: _headerTextStyle,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            ...List.generate(data.length, (i) {
                              final item = data[i];
                              final isEven = i.isEven;
                              final rowColor = isEven
                                  ? const Color(0xFFF9F9F9)
                                  : Colors.white;

                              return SizedBox(
                                height: 50,
                                child: Row(
                                  children: List.generate(item['values'].length,
                                      (index) {
                                    String val = item['values'][index];
                                    return GestureDetector(
                                      onTap: () async {
                                        final newValue = await _showEditDialog(
                                          currentValue: val,
                                          feedId: item['id'],
                                          stadoId: widget.stadoId,
                                          receptionId: 'reception ${index + 1}',
                                          feedName: item['origin'],
                                        );
                                        if (newValue != null) {
                                          setState(() {
                                            item['values'][index] = newValue;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 80,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: rowColor,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          val + ' ' + S.of(context).kg,
                                          style: _cellTextStyle,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            }),
                            Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: totals
                                    .map((t) => Container(
                                          width: 80,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            t,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Future<String?> _showEditDialog({
    required String currentValue,
    required String stadoId,
    required String receptionId,
    required String? feedId,
    required String feedName,
  }) async {
    TextEditingController controller =
        TextEditingController(text: currentValue);

    final feedId = feedIdByReceptionAndName[receptionId]?[feedName];
    if (feedId == null) {
      print('feedId не найден для $feedName в $receptionId');
    }
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            S.of(context).editDialog_title(feedName),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: S.of(context).editDialog_label,
              labelStyle: TextStyle(color: Colors.black),
              hintText: S.of(context).editDialog_hint,
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).editDialog_cancel,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () async {
                String newValueStr = controller.text.trim();
                double? newValue = double.tryParse(newValueStr);
                if (newValue == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).editDialog_invalidNumber,
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Color(0xFF90010A),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                final user = FirebaseAuth.instance.currentUser;
                if (user == null) return;
                final firestore = FirebaseFirestore.instance;
                final tableDocRef = firestore
                    .collection('stados')
                    .doc(stadoId)
                    .collection('tables')
                    .doc(receptionId);
                final feedDocRef = firestore
                    .collection('stados')
                    .doc(stadoId)
                    .collection('tables')
                    .doc(receptionId)
                    .collection('feeds')
                    .doc(feedId);
                final tableDocSnap = await tableDocRef.get();
                double oldValue = 0.0;
                if (tableDocSnap.exists) {
                  final data = tableDocSnap.data();
                  if (data != null && data[feedName] is num) {
                    oldValue = data[feedName];
                  }
                }
                double delta = newValue - oldValue;
                final storageQuery = await firestore
                    .collection('storages')
                    .where('ownerId', isEqualTo: user.uid)
                    .limit(1)
                    .get();

                if (storageQuery.docs.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).editDialog_noStorage,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color(0xFF90010A),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                final storageDoc = storageQuery.docs.first;
                final storageRef = storageDoc.reference;
                final storageData = storageDoc.data();
                double currentStock = 0.0;
                if (storageData.containsKey(feedName) &&
                    storageData[feedName]['value'] is num) {
                  currentStock =
                      (storageData[feedName]['value'] as num).toDouble();
                }
                if (currentStock < newValue) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(S.of(context).editDialog_insufficientFeed,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Color(0xFF90010A),
                        duration: Duration(seconds: 2)),
                  );
                  return;
                }
                if (feedId == null) {
                  print(
                      'Ошибка: не найден feedId для $feedName в $receptionId');
                  return;
                }
                try {
                  await firestore.runTransaction((transaction) async {
                    transaction.update(feedDocRef, {'value': newValue});
                    transaction.update(storageRef, {
                      '$feedName.value': double.parse(
                          (currentStock - delta).toStringAsFixed(2))
                    });
                  });
                  Navigator.of(context).pop(newValueStr);
                } catch (e) {
                  print('Ошибка при сохранении: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(S.of(context).editDialog_saveError,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Color(0xFF90010A),
                        duration: Duration(seconds: 2)),
                  );
                }
              },
              child: Text(
                S.of(context).editDialog_save,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> resetAndSaveStatistics(String stadoId) async {
    final firestore = FirebaseFirestore.instance;
    final tablesCollection =
        firestore.collection('stados').doc(stadoId).collection('tables');
    final statisticsCollection =
        firestore.collection('statistics').doc(stadoId).collection('daily');
    final receptionDocs = await tablesCollection.get();

    Map<String, dynamic> aggregatedData = {};
    for (var doc in receptionDocs.docs) {
      final data = doc.data();
      final receptionId = doc.id;

      aggregatedData[receptionId] = data;

      await tablesCollection.doc(receptionId).update(
            data.map((key, value) => MapEntry(key, 0)),
          );
    }
    final utcDate = DateTime.now().toUtc();
    final dateString =
        '${utcDate.year}-${utcDate.month.toString().padLeft(2, '0')}-${utcDate.day.toString().padLeft(2, '0')}';

    await statisticsCollection.doc(dateString).set({
      'date': utcDate,
      'receptions': aggregatedData,
    });
  }
}
