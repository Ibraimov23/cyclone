import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/l10n.dart';
import '../main.dart';
import 'language_provider.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLangCode;

  @override
  void initState() {
    super.initState();
    final langProvider = context.read<LanguageProvider>();
    _selectedLangCode = langProvider.locale.languageCode;
  }

  void _onLanguageCardTapped(String langCode) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    langProvider.changeLanguageSync(langCode);
    langProvider.persistLanguage(langCode);
    setState(() {
      _selectedLangCode = langCode;
    });
  }

  Future<void> _onSelectButtonPressed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kLanguageScreenPassedKey, true);

    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    Widget _buildLanguageCard({
      required String code,
      required String title,
      required String emoji,
    }) {
      final isSelected = _selectedLangCode == code;

      return GestureDetector(
        onTap: () => _onLanguageCardTapped(code),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? const Color(0xFF90010A) : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              if (isSelected)
                const BoxShadow(
                  color: Color(0x3390010A),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
            ],
          ),
          child: Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              if (isSelected)
                const Icon(Icons.check_circle,
                    color: Color(0xFF90010A), size: 26),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Text(
                loc.languagePrompt,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              _buildLanguageCard(code: 'ky', title: loc.kyrgyz, emoji: '🇰🇬'),
              _buildLanguageCard(code: 'ru', title: loc.russian, emoji: '🇷🇺'),
              _buildLanguageCard(code: 'en', title: loc.english, emoji: '🇬🇧'),
              const Spacer(),
              ElevatedButton(
                onPressed: _onSelectButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF90010A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  loc.selectButton,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
