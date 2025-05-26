import 'package:cyclone/pages/add.dart';
import 'package:cyclone/pages/id.dart';
import 'package:cyclone/pages/table.dart';
import 'package:cyclone/widget/custom_app-bar.dart';
import 'package:cyclone/widget/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/l10n.dart';

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
  String fullName = "";

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
        fullName = user.email!;
      });
    }
  }

  String _getShortUsername(String username) {
    List<String> words = username.split('');
    if (words.length > 10) {
      return words.take(10).join('') + '...';
    }
    return username;
  }

  void _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            S.of(context).logoutTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF90010A),
            ),
          ),
          content: Text(
            S.of(context).logoutConfirmation,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                S.of(context).cancel,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: Text(
                S.of(context).logout,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF90010A),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: S.of(context).greeting(_getShortUsername(username)),
        onMenuTap: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, S.of(context).table, 'assets/icons/table.svg'),
              _buildNavItem(1, S.of(context).add, 'assets/icons/create.svg'),
              _buildNavItem(2, S.of(context).techPassport,
                  'assets/icons/animal_info.svg'),
            ],
          ),
        ),
      ),
      endDrawer: CustomDrawer(
        title: _getShortUsername(username),
        fullEmail: fullName,
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
          SizedBox(
            width: 90,
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
