import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final TextEditingController _stadoNameController = TextEditingController();
  String? selectedCattleType;
  List<String> cattleTypes = [];
  List<String> cattleTypeIds = []; // This will hold the IDs of the cattle types
  bool isLoading = false; // Flag to disable the save button while loading

  @override
  void initState() {
    super.initState();
    _loadCattleTypes();
  }

  // Load cattle types and their IDs
  Future<void> _loadCattleTypes() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("typeofstados").get();

      setState(() {
        cattleTypes =
            querySnapshot.docs.map((doc) => doc["name"] as String).toList();
        cattleTypeIds = querySnapshot.docs
            .map((doc) => doc.id)
            .toList(); // Capture the document IDs
      });
    } catch (e) {
      print("Ошибка загрузки типов скота: $e");
    }
  }

  // Save the new stado with cattleTypeId as the document ID
  Future<void> _saveStado() async {
    if (_stadoNameController.text.isEmpty || selectedCattleType == null) {
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

      // Get the index of the selected cattle type
      int selectedIndex = cattleTypes.indexOf(selectedCattleType!);
      String selectedCattleTypeId = cattleTypeIds[
          selectedIndex]; // Get the ID of the selected cattle type

      await FirebaseFirestore.instance.collection("stados").add({
        "name": _stadoNameController.text,
        "cattleType": selectedCattleType,
        "userId": userId,
        "createdAt": Timestamp.now(),
        "cattleTypeId": selectedCattleTypeId,
        // Store the document ID of the selected cattle type
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Стадо успешно создано!")),
      );

      _stadoNameController.clear();
      setState(() {
        selectedCattleType = null;
        isLoading = false;
      });

      /*Navigator.popUntil(context, ModalRoute.withName('/'));*/
    } catch (e) {
      print("Ошибка при создании стада: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка при создании стада")),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF90010A),
            shape: BoxShape.circle,
          ),
          child: IconTheme(
            data: IconThemeData(color: Colors.white),
            child: BackButton(),
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Создать стадо',
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
                  "Номер стадо",
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
                    hintText: 'Введите уникальный номер стадо',
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
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Вид скота",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: DropdownButton2<String>(
                  value: selectedCattleType,
                  hint: Text("Выберите вид скота"),
                  items: cattleTypes.map((String cattle) {
                    return DropdownMenuItem<String>(
                      value: cattle,
                      child: Text(cattle),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCattleType = newValue;
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
              const SizedBox(height: 300),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: isLoading ? null : _saveStado,
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
                          "Сохранить",
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
