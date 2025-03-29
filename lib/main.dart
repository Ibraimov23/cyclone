import 'package:cyclone/pages/Instruction.dart';
import 'package:cyclone/pages/adding.dart';
import 'package:cyclone/pages/chatbot.dart';
import 'package:cyclone/pages/create.dart';
import 'package:cyclone/pages/finance.dart';
import 'package:cyclone/pages/home.dart';
import 'package:cyclone/pages/id.dart';
import 'package:cyclone/pages/intro.dart';
import 'package:cyclone/pages/language.dart';
import 'package:cyclone/pages/login.dart';
import 'package:cyclone/pages/newpassowrd.dart';
import 'package:cyclone/pages/passport.dart';
import 'package:cyclone/pages/profile.dart';
import 'package:cyclone/pages/resetpassword.dart';
import 'package:cyclone/pages/shop.dart';
import 'package:cyclone/pages/signin.dart';
import 'package:cyclone/pages/stem.dart';
import 'package:cyclone/pages/taable.dart';
import 'package:cyclone/pages/welcome.dart';
import 'package:cyclone/widget/custom_app_bar.dart';
import 'package:cyclone/widget/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Cyclone());
}

class Cyclone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyclone',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
      ),
      home: AuthWrapper(),
      routes: {
        '/chatbot': (context) => Chatbot(),
        '/passport': (context) => Passport(),
        '/home': (context) => Home(),
        '/language': (context) => LanguageSelectionScreen(),
        '/welcome': (context) => Welcome(),
        "/signin": (context) => Sigin(),
        "/login": (context) => Login(),
        "/newpassword": (context) => NewPassword(),
        "/resetpassword": (context) => ResetPassword(),
        "/create": (context) => Create(),
        "/profile": (context) => Profile(),
        "/intro": (context) => Intro(),
        "/instruction": (context) => Instruction(),
        "/id": (context) => Id(),
        "/shop": (context) => Shop(),
        "/taable": (context) => Warehouse(),
        "/adding": (context) => Adding(),
        "/finance": (context) => Finance(),
        "/steam": (context) => Steam(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return MainScreen();
        } else {
          return Welcome();
        }
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String username = "друг";

  final List<Widget> _pages = [
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _loadUsername() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      setState(() {
        username = user.email!.split('@')[0];
      });
    }
  }

  void _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Выход из аккаунта"),
          content: const Text("Вы уверены, что хотите выйти?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Отмена"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
              },
              child: const Text("Выйти", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E7E7),
      appBar: CustomAppBar(
          title: "Йоу, ${username}",
          onMenuTap: () {
            Scaffold.of(context).openEndDrawer();
          }),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 8, bottom: 10, right: 5, left: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Ферма', 'assets/icons/home_b.svg'),
            _buildNavItem(1, 'Магазин', 'assets/icons/shop.svg'),
            _buildNavItem(2, 'Сообщения', 'assets/icons/chat.svg',
                isCircular: true),
            _buildNavItem(3, 'Кормы', 'assets/icons/food.svg'),
          ],
        ),
      ),
      endDrawer: CustomDrawer(
        title: username,
        onLogout: _logout,
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath,
      {bool isCircular = false}) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isSelected ? 48 : 40,
            height: isSelected ? 48 : 40,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF90010A) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(11),
            child: SvgPicture.asset(
              iconPath,
              width: 28,
              height: 28,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
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

/*runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Montserrat',
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(color: Colors.black),
      //     // Замена bodyText1 на bodyMedium
      //     bodySmall: TextStyle(color: Colors.black),
      //     // Замена bodyText2 на bodySmall
      //     displayLarge: TextStyle(color: Colors.black),
      //     // Замена headline1 на displayLarge
      //     displayMedium: TextStyle(color: Colors.black),
      //     // Замена headline2 на displayMedium
      //     displaySmall: TextStyle(color: Colors.black),
      //     // Замена headline3 на displaySmall
      //     headlineMedium: TextStyle(color: Colors.black),
      //     // Замена headline4 на headlineMedium
      //     headlineSmall: TextStyle(color: Colors.black),
      //     // Замена headline5 на headlineSmall
      //     titleLarge: TextStyle(color: Colors.black),
      //     // Замена headline6 на titleLarge
      //     titleMedium: TextStyle(color: Colors.black),
      //     // Замена subtitle1 на titleMedium
      //     titleSmall: TextStyle(color: Colors.black),
      //     // Замена subtitle2 на titleSmall
      //     labelLarge: TextStyle(color: Colors.black),
      //     // Замена button на labelLarge
      //     bodyLarge: TextStyle(color: Colors.black),
      //     // Замена bodyText1 на bodyLarge (если нужно)
      //     labelSmall: TextStyle(color: Colors.black),
      //     // Замена caption на labelSmall
      //   ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
    ),
    initialRoute: "/",
    routes: {
      '/': (context) => Pages(),
      '/chatbot': (context) => Chatbot(),
      '/passport': (context) => Passport(),
      '/home': (context) => Home(),
      '/language': (context) => LanguageSelectionScreen(),
      '/welcome': (context) => Welcome(),
      "/signin": (context) => Sigin(),
      "/login": (context) => Login(),
      "/newpassport": (context) => Newpassowrd(),
      "/confirming": (context) => Confirming(),
      "/empty": (context) => Empty(),
      "/create": (context) => Create(),
      "/profile": (context) => Profile(),
      "/intro": (context) => Intro(),
      "/instruction": (context) => Instruction(),
      "/id": (context) => Id(),
      "/shop": (context) => Shop(),
      "/taable": (context) => Taable(),
      "/adding": (context) => Adding(),
      "/finance": (context) => Finance(),
    },
  ));
}*/
