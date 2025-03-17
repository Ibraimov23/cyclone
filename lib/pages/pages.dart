import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/chatbot', (route) => true);
                  },
                  child: const Text("chatbotыв")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => true);
                  },
                  child: const Text("home")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/language', (route) => true);
                  },
                  child: const Text("language")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/welcome', (route) => true);
                  },
                  child: const Text("welcome")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/signin', (route) => true);
                  },
                  child: const Text("Signin")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/login", (route) => true);
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/newpassport", (route) => true);
                  },
                  child: const Text("New paspord")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/confirming", (route) => true);
                  },
                  child: const Text("Confirming")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/empty", (route) => true);
                  },
                  child: const Text("Empty")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/create", (route) => true);
                  },
                  child: const Text("Create")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/profile", (route) => true);
                  },
                  child: const Text("Profile")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/intro", (route) => true);
                  },
                  child: const Text("Intro")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/instruction", (route) => true);
                  },
                  child: const Text("Instruction")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/id", (route) => true);
                  },
                  child: const Text("Id")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/shop", (route) => true);
                  },
                  child: const Text("Shop")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/taable", (route) => true);
                  },
                  child: const Text("Table")),
            ],
          )
        ],
      ),
    );
  }
}
