import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final String phoneNumber = "+71234567890";

  Future<void> _makeCall() async {
    const phoneNumber = '+71234567890';

    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.intent.action.DIAL',
        data: 'tel:$phoneNumber',
      );
      await intent.launch();
    } else {
      throw 'Платформа не поддерживается';
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    final lang = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: const Color(0xFFE7E7E7),
          image: const DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loc.shopScreenTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: loc.shopSearchHint,
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xFF90010A)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: lang == 'ru'
                        ? 0.781
                        : lang == 'en'
                            ? 0.838
                            : 0.788,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/korm.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 180,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Color(0xFF90010A),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(14),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    loc.feedTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    loc.feedSubtitle,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '${loc.shopContactTitle}:\n+7 (123) 456-78-90',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFF90010A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: _makeCall,
                                    child: Text(loc.shopCallButton),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
