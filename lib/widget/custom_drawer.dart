import 'package:cyclone/pages/Instruction.dart';
import 'package:cyclone/pages/language.dart';
import 'package:cyclone/pages/profile.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  final String title;
  final String fullEmail;
  final VoidCallback onLogout;

  const CustomDrawer({
    Key? key,
    required this.title,
    required this.fullEmail,
    required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 43),
            Center(
              child: Image.asset('assets/alina.png'),
            ),
            const SizedBox(height: 23),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 50),
            _buildButton(context, loc.drawerProfile, Icons.person,
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(
                    username: title,
                    fullEmail: fullEmail,
                    onLogout: onLogout,
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            _buildButton(context, loc.drawerSubscription, Icons.star),
            const SizedBox(height: 30),
            _buildButton(context, loc.drawerLanguage, Icons.language,
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LanguageSelectionScreen(),
                ),
              );
            }),
            SizedBox(height: 30),
            _buildButton(context, loc.drawerInstructions, Icons.help_outline,
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Instruction(
                    username: title,
                    onLogout: onLogout,
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            _buildButton(context, loc.drawerStats, Icons.bar_chart),
            const SizedBox(height: 30),
            _buildButton(context, loc.drawerAddAccount, Icons.add,
                onPressed: () {
              Navigator.pushNamed(context, '/signin');
            }),
            const SizedBox(height: 30),
            _buildButton(context, loc.drawerLogout, Icons.logout,
                onPressed: onLogout),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData icon,
      {VoidCallback? onPressed}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF90010A),
            width: 1,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onPressed ??
            () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 300), () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).drawerSoon,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFF90010A),
                    duration: const Duration(seconds: 2),
                  ),
                );
              });
            },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF90010A)),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
            const Icon(Icons.navigate_next, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
