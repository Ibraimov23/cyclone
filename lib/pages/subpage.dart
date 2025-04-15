import 'package:cyclone/pages/add.dart';
import 'package:cyclone/pages/id.dart';
import 'package:cyclone/pages/taable.dart';
import 'package:cyclone/widget/custom_app-bar.dart';
import 'package:cyclone/widget/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubPageScreen extends StatefulWidget {
  final String stadoId;
  final String stadoName;
  final String stadoType;

  const SubPageScreen(
      {Key? key,
      required this.stadoId,
      required this.stadoName,
      required this.stadoType})
      : super(key: key);

  @override
  State<SubPageScreen> createState() => _SubPageScreenState();
}

class _SubPageScreenState extends State<SubPageScreen> {
  int _selectedIndex = 0;
  String username = "друг";

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      TableScreen(stadoName: widget.stadoName, stadoId: widget.stadoId),
      AddAnimal(stadoId: widget.stadoId),
      Id(
          stadoId: widget.stadoId,
          stadoName: widget.stadoName,
          stadoType: widget.stadoType),
    ]);
    _loadUsername();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _loadUsername() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      setState(() {
        username = user.email!.split('@')[0];
      });
    }
  }

  void _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Выход из аккаунта"),
          content: const Text("Вы уверены, что хотите выйти?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Отмена"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: const Text("Выйти", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: "Йоу, ${username}",
        onMenuTap: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 10, right: 5, left: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Таблица', 'assets/icons/table.svg'),
            _buildNavItem(1, 'Добавить', 'assets/icons/create.svg'),
            _buildNavItem(2, 'Тех. паспорт', 'assets/icons/animal_info.svg'),
          ],
        ),
      ),
      endDrawer: CustomDrawer(
        title: username,
        onLogout: _logout,
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isSelected ? 48 : 40,
            height: isSelected ? 48 : 40,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF90010A) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset(
              iconPath,
              width: 28,
              height: 28,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
