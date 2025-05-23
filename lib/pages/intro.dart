import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widget/custom_app-bar.dart';

class Intro extends StatefulWidget {
  final String username;
  final VoidCallback onLogout;

  const Intro({super.key, required this.username, required this.onLogout});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: S.of(context).greeting(widget.username),
        onMenuTap: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).introTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 1.5,
                color: Colors.grey,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).dividerDescription,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).startQuestion,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              _buildBulletPoint(S.of(context).bullet1),
              _buildBulletPoint(S.of(context).bullet2),
              _buildBulletPoint(S.of(context).bullet3),
              _buildBulletPoint(S.of(context).bullet4),
              const SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/onboarding.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.85,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).closingStatement,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, color: Color(0xFF90010A)),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14.5,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
