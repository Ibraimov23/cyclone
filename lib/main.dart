import 'package:cyclone/pages/adding.dart';
import 'package:cyclone/pages/chatbot.dart';
import 'package:cyclone/pages/create.dart';
import 'package:cyclone/pages/finance.dart';
import 'package:cyclone/pages/home.dart';
import 'package:cyclone/pages/language.dart';
import 'package:cyclone/pages/language_provider.dart';
import 'package:cyclone/pages/login.dart';
import 'package:cyclone/pages/newpassowrd.dart';
import 'package:cyclone/pages/resetpassword.dart';
import 'package:cyclone/pages/shop.dart';
import 'package:cyclone/pages/signin.dart';
import 'package:cyclone/pages/stem.dart';
import 'package:cyclone/pages/welcome.dart';
import 'package:cyclone/widget/custom_app-bar.dart';
import 'package:cyclone/widget/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'generated/l10n.dart';

const String kLanguageScreenPassedKey = 'language_screen_passed';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  bool isLanguageScreenPassed =
      prefs.getBool(kLanguageScreenPassedKey) ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: CycloneApp(isLanguageScreenPassed: isLanguageScreenPassed),
    ),
  );
}

class CycloneApp extends StatelessWidget {
  final bool isLanguageScreenPassed;

  const CycloneApp({super.key, required this.isLanguageScreenPassed});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, langProvider, _) {
        final currentLocale = langProvider.locale;

        String fontFamily = currentLocale.languageCode == 'ky'
            ? 'NotoSans'
            : currentLocale.languageCode == 'en'
                ? 'WorkSans'
                : 'Montserrat';

        return MaterialApp(
          title: 'Cyclone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: fontFamily,
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: currentLocale,
          home: isLanguageScreenPassed
              ? const AuthWrapper()
              : const LanguageSelectionScreen(),
          routes: {
            '/chatbot': (context) => const Chatbot(),
            '/home': (context) => const Home(),
            '/language': (context) => const LanguageSelectionScreen(),
            '/welcome': (context) => const Welcome(),
            '/signin': (context) => const SignIn(),
            '/login': (context) => const Login(),
            '/newpassword': (context) => const NewPassword(),
            '/resetpassword': (context) => const ResetPassword(),
            '/create': (context) => const CreateStado(),
            '/shop': (context) => const Shop(),
            '/adding': (context) => const Adding(),
            '/finance': (context) => const Finance(),
            '/stem': (context) => const Steam(),
          },
          onGenerateRoute: (settings) {
            final args = settings.arguments as Map<String, dynamic>? ?? {};

            switch (settings.name) {
              default:
                return null;
            }
          },
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          return const MainScreen();
        } else {
          return const LanguageSelectionScreen();
        }
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String username = "друг";
  String fullEmail = "";

  static const List<Widget> _pages = [
    Home(),
    Shop(),
    Chatbot(),
    Steam(),
  ];

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.email != null) {
      setState(() {
        username = user!.email!.split('@')[0];
        fullEmail = user.email!;
      });
    }
  }

  String _shortUsername(String name) =>
      name.length > 10 ? '${name.substring(0, 10)}...' : name;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  Future<void> _logout() async {
    final loc = S.of(context);

    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          loc.logoutTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF90010A),
          ),
        ),
        content: Text(
          loc.logoutConfirmation,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              loc.cancel,
              style: const TextStyle(fontSize: 16, color: Colors.black45),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              loc.logout,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF90010A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: "${loc.mainScreenAppBarGreeting}${_shortUsername(username)}",
        onMenuTap: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _BottomNavBar(
          selectedIndex: _selectedIndex, onTap: _onItemTapped, loc: loc),
      endDrawer: CustomDrawer(
          title: _shortUsername(username),
          fullEmail: fullEmail,
          onLogout: _logout),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final S loc;

  const _BottomNavBar(
      {required this.selectedIndex, required this.onTap, required this.loc});

  @override
  Widget build(BuildContext context) {
    final items = [
      (loc.bottomNavFarm, 'assets/icons/home_b.svg'),
      (loc.bottomNavShop, 'assets/icons/shop.svg'),
      (loc.bottomNavMessages, 'assets/icons/chat.svg'),
      (loc.bottomNavFeeds, 'assets/icons/food.svg'),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final (label, iconPath) = items[index];
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: isSelected ? 48 : 40,
                  height: isSelected ? 48 : 40,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF90010A)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(11),
                  child: SvgPicture.asset(
                    iconPath,
                    width: 28,
                    height: 28,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(label,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
