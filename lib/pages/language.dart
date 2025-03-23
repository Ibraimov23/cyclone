import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'russian'; // По умолчанию выбран русский язык

  final Map<String, Map<String, String>> texts = {
    'kyrgyz': {
      'languagePrompt': 'Тил таңдаңыз',
      'kyrgyz': 'Кыргызча',
      'russian': 'Орусча',
      'english': 'Англисче',
      'selectButton': 'Тандоо',
    },
    'russian': {
      'languagePrompt': 'Выберите язык',
      'kyrgyz': 'Кыргызский',
      'russian': 'Русский',
      'english': 'Английский',
      'selectButton': 'Выбрать',
    },
    'english': {
      'languagePrompt': 'Choose language',
      'kyrgyz': 'Kyrgyz',
      'russian': 'Russian',
      'english': 'English',
      'selectButton': 'Select',
    },
  };

  void changeLanguage(String lang) {
    setState(() {
      selectedLanguage = lang;
    });
  }

  Widget _buildLanguageItem(String lang, String text) {
    return InkWell(
      onTap: () => changeLanguage(lang),
      child: Text(
        text,
        style: TextStyle(
          color: selectedLanguage == lang
              ? Colors.black
              : Colors.black.withOpacity(0.5),
          fontSize: 30,
          fontWeight:
              selectedLanguage == lang ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              texts[selectedLanguage]!['languagePrompt']!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 80),
            _buildLanguageItem('kyrgyz', texts[selectedLanguage]!['kyrgyz']!),
            const Text(
              '- - - - - - - - - - - - - - - -',
              style: TextStyle(
                color:
                    Colors.black54, // Используем Colors.black54 для opacity 0.8
              ),
            ),
            _buildLanguageItem('russian', texts[selectedLanguage]!['russian']!),
            const Text(
              '- - - - - - - - - - - - - - - -',
              style: TextStyle(
                color:
                    Colors.black54, // Используем Colors.black54 для opacity 0.8
              ),
            ),
            _buildLanguageItem('english', texts[selectedLanguage]!['english']!),
            const SizedBox(height: 180),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF90010A),
                    padding: const EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    texts[selectedLanguage]!['selectButton']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
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
