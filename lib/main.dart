import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swn_play/pages/app_route.dart';
import 'package:swn_play/pages/game_route.dart';
import 'package:swn_play/pages/search_route.dart';
import 'package:swn_play/pages/settings_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.subscribeToTopic("topic");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification: ${message.notification}');
    }
  });

  runApp(const SWNPlayApp());
}

class SWNPlayApp extends StatelessWidget {
  const SWNPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWN Play',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tab = 0;
  final List<Widget> _pages = [
    const GamePage(),
    const AppPage(),
    const SearchPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (value) => {
          setState(() {
            _tab = value;
          })
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.gamepad), label: "Игры"),
          NavigationDestination(icon: Icon(Icons.adb), label: "Приложения"),
          NavigationDestination(icon: Icon(Icons.search), label: "Поиск"),
          NavigationDestination(icon: Icon(Icons.person), label: "Профиль")
        ],
      ),
    );
  }
}
