import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'firebase_notification_services/firebase_notification_services.dart';
import 'firebase_options.dart';

/*
@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices _notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    _notificationServices.requestNotificationPermission();
    _notificationServices.forgroundMessage();
    _notificationServices.firebaseInit(context);
    _notificationServices.setupInteractMessage(context);
    _notificationServices.isTokenRefresh();
    _notificationServices.getDeviceToken().then((value){
      debugPrint("--------------------Device Token Is ---------------------------");
      debugPrint(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Home Screen"),
          )
        ],
      ),
    );
  }
}*/

///--------------------upper code is working down code if for the image,,,,

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices _notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    _notificationServices.requestNotificationPermission();
    _notificationServices.forgroundMessage();
    _notificationServices.firebaseInit(context);
    _notificationServices.setupInteractMessage(context);
    _notificationServices.isTokenRefresh();
    _notificationServices.getDeviceToken().then((value){
      debugPrint("--------------------Device Token Is ---------------------------");
      debugPrint(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Home Screen"),
          )
        ],
      ),
    );
  }
}