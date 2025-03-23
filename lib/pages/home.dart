import 'package:cyclone/widget/custom_app_bar.dart';
import 'package:cyclone/widget/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _buttonWidth = 80.0;
  String username = "друг";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      setState(() {
        username = user.email!.split('@')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Йоу, ${username}!"),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE7E7E7),
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              "Моя ферма",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 36),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 51,
                mainAxisSpacing: 30,
                childAspectRatio: 1.235,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  child: CustomCard(
                    title: 'Коровки',
                    description: 'мини описание',
                    iconPath: 'assets/beef.svg',
                    count: '17шт',
                  ),
                );
              },
            ),
            const SizedBox(height: 29),
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 80,
                width: _buttonWidth,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: const Icon(
                    Icons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
