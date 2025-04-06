import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/deepseek_service.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chatbot> {
  String username = "друг";
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      setState(() {
        username = user.email!.split('@')[0];
      });
    }
  }

  void _sendMessage() async {
    String userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "content": userMessage});
      messages.add({"role": "bot", "content": ""}); // Заготовка под поток
    });

    _controller.clear();
    _listKey.currentState?.insertItem(messages.length - 2); // user msg
    _listKey.currentState?.insertItem(messages.length - 1); // bot msg

    int botIndex = messages.length - 1;

    try {
      await for (final chunk in sendMessageToBotStream(userMessage)) {
        setState(() {
          messages[botIndex]["content"] =
              (messages[botIndex]["content"] ?? "") + chunk;
        });
      }
    } catch (e) {
      setState(() {
        messages[botIndex]["content"] = "Ошибка: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    if (messages.isEmpty)
                      Text(
                        "Йоу, $username! \nЧто хотите узнать?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF90010A),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    AnimatedList(
                      key: _listKey,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      initialItemCount: messages.length,
                      itemBuilder: (context, index, animation) {
                        bool isUser = messages[index]["role"] == "user";
                        return SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(1, 0), end: Offset(0, 0))
                              .animate(animation),
                          child: Align(
                            alignment: isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    isUser ? Color(0xFF90010A) : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                messages[index]["content"]!,
                                style: TextStyle(
                                  color: isUser ? Colors.white : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: CustomTextField(
                  controller: _controller, onSend: _sendMessage),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const CustomTextField({
    required this.controller,
    required this.onSend,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF90010A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: null,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.all(15),
                      border: InputBorder.none,
                      hintText: 'Введите запрос',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.52),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: onSend,
                    child: Container(
                      width: 35,
                      height: 35,
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
                      /*child: Icon(
                        Icons.send,
                        color: Color(0xFF90010A),
                      ),*/
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
