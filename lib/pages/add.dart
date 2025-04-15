import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddAnimal extends StatefulWidget {
  final String stadoId;

  const AddAnimal({super.key, required this.stadoId});

  @override
  State<AddAnimal> createState() => _CreateState();
}

class _CreateState extends State<AddAnimal> {
  final TextEditingController _stadoNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _healthController = TextEditingController();
  final TextEditingController _medCardController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();

  bool isLoading = false;
  List<String> healthStatuses = [];
  String? selectedHealthStatus;

  @override
  void initState() {
    super.initState();
    _loadHealthStatuses();
  }

  Future<void> _loadHealthStatuses() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('statushealth').get();

      final statuses =
          snapshot.docs.map((doc) => doc['status'].toString()).toList();

      setState(() {
        healthStatuses = statuses;
      });
    } catch (e) {
      print("Ошибка при загрузке статусов здоровья: $e");
    }
  }

  Future<void> _addAnimal() async {
    if (_stadoNameController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _ageController.text == null ||
        _weightController.text.isEmpty ||
        selectedHealthStatus == null ||
        _breedController.text.isEmpty ||
        _medCardController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Заполните все поля")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception("Пользователь не авторизован");
      }

      final stadoDoc = await FirebaseFirestore.instance
          .collection("stados")
          .doc(widget.stadoId)
          .get();

      String iconUrl = 'default.svg';

      if (stadoDoc.exists) {
        final stadoType =
            stadoDoc.data()?['cattleType']?.toString().toLowerCase();
        print(stadoType);
        switch (stadoType) {
          case 'коровы':
            iconUrl = 'assets/icons/beef_id.svg';
            break;
          case 'быки':
            iconUrl = 'assets/icons/goat_id.svg';
            break;
          case 'овцы':
            iconUrl = 'assets/icons/sheep_id.svg';
            break;
          case 'козлы':
            iconUrl = 'assets/icons/goat_id.svg';
            break;
          default:
            iconUrl = 'default.svg';
        }
      }

      await FirebaseFirestore.instance
          .collection("stados")
          .doc(widget.stadoId)
          .collection("animals")
          .add({
        "tagnumber": _stadoNameController.text,
        "floor": _genderController.text,
        "age": _ageController.text,
        "weight": _weightController.text,
        "health": selectedHealthStatus,
        "medical_card": _medCardController.text,
        "breed": _breedController.text,
        "stadoId": widget.stadoId,
        "createdAt": Timestamp.now(),
        "iconUrl": iconUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Животное успешно добавлено!")),
      );

      _stadoNameController.clear();
      _genderController.clear();
      _ageController.clear();
      _weightController.clear();
      _healthController.clear();
      _medCardController.clear();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Ошибка при добавлении животного: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка при добавлении животного")),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            image: DecorationImage(
              image: const AssetImage('assets/pattern.png'),
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Добавить животное',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    letterSpacing: 0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Бирочный номер",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _stadoNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите бирочный номер',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Пол",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите пол животного',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Возраст",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите возраст животного',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Вес
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Вес",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите вес животного',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Вес
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Порода",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _breedController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите породу животного',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Здоровье",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: DropdownButton2<String>(
                  value: selectedHealthStatus,
                  hint: Text("Выберите статус здоровья"),
                  items: healthStatuses.map((String status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHealthStatus = newValue;
                    });
                  },
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    offset: Offset(0, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Медицинская карта",
                  style: TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _medCardController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите данные медицинской карты',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 17),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: isLoading ? null : _addAnimal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF90010A),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Добавить",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
