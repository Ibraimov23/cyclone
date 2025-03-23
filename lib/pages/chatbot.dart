import 'package:cyclone/widget/custom_app_bar.dart';
import 'package:cyclone/widget/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chatbot> {
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
      appBar: CustomAppBar(
        title: "",
        onMenuTap: () {},
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE7E7E7),
          image: DecorationImage(
            image: AssetImage("assets/pattern.png"),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 120),
                      Text(
                        "Йоу, $username! \nЧто хотите узнать?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF90010A),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: CustomTextField(),
            ),
          ],
        ),
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          TextField(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF90010A),
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: 'Введите запрос',
              hintStyle: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.52),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () {
                print('Нажата кнопка поиска');
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                /*child: const Icon(
                  Icons.search,
                  color: Color(0xFF90010A),
                  size: 20,
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}
