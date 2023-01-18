import 'package:e_ambulance_apps/pages/login.dart';
import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulance.dart';
import 'package:e_ambulance_apps/pages/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cron/cron.dart';

final cron = Cron();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF0E9E2E);

    return MaterialApp(
      title: 'e - Ambulance',
      builder: EasyLoading.init(),
      theme: ThemeData(
        scaffoldBackgroundColor: color,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/pesananAmbulance': (context) => PesananAmbulance(),
        '/trackingAmbulance': (context) => TrackingAmbulance(),
        '/riwayat': (context) => Riwayat(),
      },
    );
  }
}
