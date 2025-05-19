import 'package:cyclone/pages/add.dart';
import 'package:cyclone/pages/adding.dart';
import 'package:cyclone/pages/chatbot.dart';
import 'package:cyclone/pages/create.dart';
import 'package:cyclone/pages/finance.dart';
import 'package:cyclone/pages/home.dart';
import 'package:cyclone/pages/id.dart';
import 'package:cyclone/pages/instruction.dart';
import 'package:cyclone/pages/intro.dart';
import 'package:cyclone/pages/language.dart';
import 'package:cyclone/pages/language_provider.dart';
import 'package:cyclone/pages/login.dart';
import 'package:cyclone/pages/newpassowrd.dart';
import 'package:cyclone/pages/profile.dart';
import 'package:cyclone/pages/resetpassword.dart';
import 'package:cyclone/pages/shop.dart';
import 'package:cyclone/pages/signin.dart';
import 'package:cyclone/pages/stem.dart';
import 'package:cyclone/pages/subpage.dart';
import 'package:cyclone/pages/taable.dart';
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
  final prefs = await SharedPreferences.getInstance();
  bool isLanguageScreenPassed =
      prefs.getBool(kLanguageScreenPassedKey) ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    final langProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: 'Cyclone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: langProvider.locale,
      home: isLanguageScreenPassed
          ? const AuthWrapper()
          : const LanguageSelectionScreen(),
      routes: {
        '/chatbot': (context) => const Chatbot(),
        '/home': (context) => const Home(),
        '/language': (context) => const LanguageSelectionScreen(),
        '/welcome': (context) => const Welcome(),
        "/signin": (context) => const Sigin(),
        "/login": (context) => const Login(),
        "/newpassword": (context) => const NewPassword(),
        "/resetpassword": (context) => const ResetPassword(),
        "/create": (context) => const CreateStado(),
        "/profile": (context) =>
            Profile(username: 'null', fullEmail: 'null', onLogout: () {}),
        "/intro": (context) => Intro(username: 'null', onLogout: () {}),
        "/instruction": (context) =>
            Instruction(username: 'null', onLogout: () {}),
        "/id": (context) => const Id(
              stadoId: 'null',
              stadoName: 'null',
              stadoType: 'null',
            ),
        "/shop": (context) => const Shop(),
        "/taable": (context) => const TableScreen(
              stadoName: 'null',
              stadoId: 'null',
            ),
        "/adding": (context) => const Adding(),
        "/finance": (context) => const Finance(),
        "/stem": (context) => const Steam(),
        "/add": (context) => const AddAnimal(stadoId: 'null'),
        "/inner": (context) => const SubPageScreen(
              stadoId: 'null',
              stadoName: 'null',
              stadoType: 'null',
            ),
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
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const MainScreen();
        } else {
          return const MainScreen();
          /*return const LanguageSelectionScreen();*/
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

  final List<Widget> _pages = const [
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

  String _getShortUsername(String name) {
    return name.length > 10 ? '${name.substring(0, 10)}...' : name;
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Future<void> _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "Выход из аккаунта",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF90010A),
          ),
        ),
        content: const Text(
          "Вы уверены, что хотите выйти?",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Отмена",
                style: TextStyle(fontSize: 16, color: Colors.black45)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Выйти",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF90010A),
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      await FirebaseAuth.instance.signOut();
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: "Йоу, ${_getShortUsername(username)}",
        onMenuTap: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      endDrawer: CustomDrawer(
        title: _getShortUsername(username),
        fullEmail: fullEmail,
        onLogout: _logout,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final items = [
      ('Ферма', 'assets/icons/home_b.svg'),
      ('Магазин', 'assets/icons/shop.svg'),
      ('Сообщения', 'assets/icons/chat.svg'),
      ('Кормы', 'assets/icons/food.svg'),
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
          return _buildNavItem(index, label, iconPath, isCircular: index == 2);
        }),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath,
      {bool isCircular = false}) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isSelected ? 48 : 40,
            height: isSelected ? 48 : 40,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF90010A) : Colors.transparent,
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
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
