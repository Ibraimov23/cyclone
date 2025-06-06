import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

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
  final TextEditingController _dateController = TextEditingController();

  bool isLoading = false;
  List<String> healthStatuses = [];
  String? selectedHealthStatus;
  List<String> breeds = [];
  String? selectedBreed;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _loadHealthStatuses();
    _loadBreeds(widget.stadoId);
  }

  Future<void> _loadBreeds(String stadoId) async {
    try {
      final stadoSnapshot = await FirebaseFirestore.instance
          .collection('stados')
          .doc(stadoId)
          .get();

      if (!stadoSnapshot.exists) {
        print(S.of(context).herdNotFound);
        return;
      }

      final currentCattleType = stadoSnapshot.data()?['cattleType'];

      if (currentCattleType == null) {
        print(S.of(context).herdCattleTypeNotSpecified);
        return;
      }

      final breedsSnapshot =
          await FirebaseFirestore.instance.collection('breeds').get();

      final breedList = breedsSnapshot.docs
          .where((doc) => doc['cattleType'] == currentCattleType)
          .map((doc) => doc['name'].toString())
          .toList();

      setState(() {
        breeds = breedList;
      });
    } catch (e) {
      print("${S.of(context).errorLoadingBreeds}: $e");
    }
  }

  String translateHealthStatus(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'хорошее':
        return S.of(context).healthGood;
      case 'среднее':
        return S.of(context).healthMedium;
      case 'плохое':
        return S.of(context).healthPoor;
      default:
        return status;
    }
  }

  String localizeBreed(BuildContext context, String russianName) {
    final localizations = S.of(context);
    final Map<String, String> translationKeys = {
      'Лимузин': localizations.breedLimousin,
      'Голштинская': localizations.breedHolstein,
      'Нубийская': localizations.breedNubian,
      'Симментальская': localizations.breedSimmental,
      'Прекос': localizations.breedPrecos,
      'Шароле': localizations.breedCharolais,
      'Айрширская': localizations.breedAyrshire,
      'Тексель': localizations.breedTexel,
      'Дорпер': localizations.breedDorper,
      'Белоголовая': localizations.breedHerefordWhitehead,
      'Ангус': localizations.breedAngus,
      'Черно-пестрая': localizations.breedBlackPied,
      'Романовская': localizations.breedRomanov,
      'Герефорд': localizations.breedHereford,
      'Бурская': localizations.breedBoer,
      'Тоггенбургская': localizations.breedToggenburg,
      'Альпийская': localizations.breedAlpine,
      'Меринос': localizations.breedMerino,
      'Джерсейская': localizations.breedJersey,
      'Зааненская': localizations.breedSaanen,
    };

    return translationKeys[russianName] ?? russianName;
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
      print("${S.of(context).errorLoadingHealthStatuses}: $e");
    }
  }

  Future<void> _addAnimal() async {
    final loc = S.of(context);

    if (_stadoNameController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _selectedDate == null ||
        _weightController.text.isEmpty ||
        selectedHealthStatus == null ||
        selectedBreed == null ||
        _medCardController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(loc.fillAllFields, style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF90010A),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception(loc.userNotAuthorized);
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
            iconUrl = 'assets/icons/bull_id.svg';
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
        "age":
            _selectedDate != null ? Timestamp.fromDate(_selectedDate!) : null,
        "weight": _weightController.text,
        "health": selectedHealthStatus,
        "medical_card": _medCardController.text,
        "breed": selectedBreed,
        "stadoId": widget.stadoId,
        "createdAt": Timestamp.now(),
        "iconUrl": iconUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.animalAddedSuccessfully)),
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
      print("${loc.errorAddingAnimal}: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.errorAddingAnimal,
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF90010A),
          duration: const Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final loc = S.of(context);
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? widget) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(primary: const Color(0xFF90010A)),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Colors.white,
            dividerColor: Color(0xFF90010A),
            headerBackgroundColor: Color(0xFF90010A),
            headerForegroundColor: Colors.white,
          ),
        ),
        child: widget!,
      ),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            image: DecorationImage(
              image: const AssetImage('assets/pattern.png'),
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  loc.addAnimal,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    letterSpacing: 0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.tagNumber,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _stadoNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: loc.enterTagNumber,
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
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.gender,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: loc.enterGender,
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
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.breed,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    loc.selectBreed,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: breeds
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(localizeBreed(context, item)),
                          ))
                      .toList(),
                  value: selectedBreed,
                  onChanged: (value) {
                    setState(() {
                      selectedBreed = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      color: Colors.white,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.birthDate,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: loc.selectBirthDate,
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
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.weight,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: loc.enterWeight,
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
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.healthStatus,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    loc.selectHealthStatus,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: healthStatuses
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(translateHealthStatus(context, item)),
                          ))
                      .toList(),
                  value: selectedHealthStatus,
                  onChanged: (value) {
                    setState(() {
                      selectedHealthStatus = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      color: Colors.white,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  loc.medicalCard,
                  style: const TextStyle(fontSize: 20, letterSpacing: 0),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _medCardController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: loc.enterMedicalCard,
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
              const SizedBox(height: 25),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _addAnimal,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF90010A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          loc.addAnimalButton,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
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
