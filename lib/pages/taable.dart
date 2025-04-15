import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final List<String> dates = [
    'Прием 1',
    'Прием 2',
    'Прием 3',
    'Прием 4',
    'Прием 5',
  ];
  final List<String> feedNames = [
    'corns',
    'hays',
    'herbs',
    'oats',
    'peas',
    'silages',
    'straws',
  ];
  List<Map<String, dynamic>> data = []; // для UI
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
    fontFamily: 'Montserat',
    fontWeight: FontWeight.w600,
  );

  static const _primaryColor = Color(0xFF90010A);
  static const _appBarTitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static const _tableTitleStyle = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 2);
  static const _herdNumberStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'Montserat',
    fontWeight: FontWeight.w500,
  );
  static const _exportButtonStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Montserat',
    fontSize: 24,
  );

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await fetchFeedRatios();
    await fetchFeedData();
  }

  Future<void> fetchFeedRatios() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore
        .collection('storages')
        .where('ownerId', isEqualTo: user.uid)
        .get();

    final Map<String, double> ratios = {};

    for (var doc in snapshot.docs) {
      final data = doc.data();
      if (data.containsKey('corns') && data['corns'] is num) {
        ratios['corns'] = (data['corns'] as num).toDouble();
      } else {
        ratios['corns'] = 0.0;
      }

      if (data.containsKey('hays') && data['hays'] is num) {
        ratios['hays'] = (data['hays'] as num).toDouble();
      } else {
        ratios['hays'] = 0.0;
      }

      if (data.containsKey('herbs') && data['herbs'] is num) {
        ratios['herbs'] = (data['herbs'] as num).toDouble();
      } else {
        ratios['herbs'] = 0.0;
      }

      if (data.containsKey('oats') && data['oats'] is num) {
        ratios['oats'] = (data['oats'] as num).toDouble();
      } else {
        ratios['oats'] = 0.0;
      }

      if (data.containsKey('peas') && data['peas'] is num) {
        ratios['peas'] = (data['peas'] as num).toDouble();
      } else {
        ratios['peas'] = 0.0;
      }

      if (data.containsKey('silages') && data['silages'] is num) {
        ratios['silages'] = (data['silages'] as num).toDouble();
      } else {
        ratios['silages'] = 0.0;
      }

      if (data.containsKey('straws') && data['straws'] is num) {
        ratios['straws'] = (data['straws'] as num).toDouble();
      } else {
        ratios['straws'] = 0.0;
      }
    }

    setState(() {
      feedRatios = ratios;
    });
  }

  Future<void> fetchFeedData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final firestore = FirebaseFirestore.instance;
    final tableRef =
        firestore.collection('stados').doc(widget.stadoId).collection('tables');

    Map<String, List<num>> temp = {
      for (var f in feedNames) f: List.filled(dates.length, 0)
    };

    final querySnapshot = await tableRef.get();

    for (int i = 0; i < dates.length; i++) {
      final docName = 'reception ${i + 1}';
      QueryDocumentSnapshot<Map<String, dynamic>>? docSnap;

      for (var doc in querySnapshot.docs) {
        if (doc.id == docName) {
          docSnap = doc;
          break;
        }
      }

      if (docSnap == null) {
        continue;
      }

      final dataMap = docSnap.data();
      for (var feed in feedNames) {
        if (dataMap[feed] != null && dataMap[feed] is num) {
          temp[feed]![i] = dataMap[feed] as num;
        }
      }
    }

    final List<Map<String, dynamic>> tempData = [];

    for (var feed in feedNames) {
      final List<num> values = temp[feed]!;

      tempData.add({
        'origin': feed,
        'name': _translateFeedName(feed),
        'values': values.map((e) => '$e').toList(),
      });
    }

    final List<String> tempTotals = [];
    for (int i = 0; i < dates.length; i++) {
      num sum = 0;
      for (var feed in feedNames) {
        sum += temp[feed]![i];
      }
      tempTotals.add('${sum.toStringAsFixed(1)}');
    }

    setState(() {
      data = tempData;
      totals = tempTotals;
    });
  }

  String _translateFeedName(String key) {
    switch (key) {
      case 'corns':
        return 'Кукуруза';
      case 'hays':
        return 'Сено';
      case 'herbs':
        return 'Травы';
      case 'oats':
        return 'Овёс';
      case 'peas':
        return 'Горох';
      case 'silages':
        return 'Силос';
      case 'straws':
        return 'Солома';
      default:
        return key;
    }
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
            fit: BoxFit.cover,
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
        const Text('Таблица корма', style: _tableTitleStyle),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: 'стадо ',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: widget.stadoName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
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
                                    _translateFeedName(key),
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
                          child: const Text(
                            'корм ед.',
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
                                children: dates
                                    .map((d) => Container(
                                          width: 80,
                                          alignment: Alignment.center,
                                          child: Text(
                                            d,
                                            style: _headerTextStyle,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                            // Табличные строки
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
                                        final newValue = await _showEditDialog2(
                                          currentValue: val,
                                          stadoId: widget.stadoId,
                                          receptionId: 'reception ${index + 1}',
                                          fieldName: item['origin'],
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
                                          val + ' кг',
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
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'Montserat',
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
      ],
    );
  }

  Future<String?> _showEditDialog2({
    required String currentValue,
    required String stadoId,
    required String receptionId,
    required String fieldName,
  }) async {
    TextEditingController controller =
        TextEditingController(text: currentValue);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Редактировать $fieldName'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Введите новое значение'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                String newValue = controller.text;

                try {
                  await FirebaseFirestore.instance
                      .collection('stados')
                      .doc(stadoId)
                      .collection('tables')
                      .doc(receptionId)
                      .update({
                    fieldName: double.tryParse(newValue) ?? 0,
                  });
                } catch (e) {
                  print('Ошибка при сохранении: $e');
                }

                Navigator.of(context).pop(newValue);
              },
              child: Text('Сохранить'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отменить'),
            ),
          ],
        );
      },
    );
  }
}
