import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kSelectedLanguageCodeKey = 'selected_language';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('ky');

  LanguageProvider() {
    _loadLanguage();
  }

  Locale get locale => _locale;

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('kSelectedLanguageCodeKey');
    if (langCode != null && langCode.isNotEmpty) {
      _locale = Locale(langCode);
    }
  }

  Future<void> changeLanguage(String langCode) async {
    if (_locale.languageCode == langCode) return;
    _locale = Locale(langCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kSelectedLanguageCodeKey, langCode);
    notifyListeners();
  }
}
