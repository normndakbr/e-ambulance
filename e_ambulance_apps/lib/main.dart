import 'package:e_ambulance_apps/pages/login.dart';
import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulance.dart';
import 'package:e_ambulance_apps/pages/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cron/cron.dart';
import '../services/sharedPreferences.dart';

final cron = Cron();
Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Workmanager().cancelAll();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String p_username = "";
  String p_id_user = "";
  bool isLoggedIn = false;
  final SharedPreferenceService sharedPref = SharedPreferenceService();

  Future<void> checkUserLogin() async {
    await sharedPref.readData("p_username").then((value) => {
          setState(() => {
                p_username = value,
              })
        });
    await sharedPref.readData("p_id_user").then((value) => {
          setState(() => {
                p_id_user = value,
              })
        });

    if (p_username != "" && p_id_user != "") {
      print("true");
      setState(() {
        isLoggedIn = true;
      });
    } else {
      print("false");
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkUserLogin();
    super.initState();
  }

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
      initialRoute: isLoggedIn == true ? '/pesananAmbulance' : '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/pesananAmbulance': (context) => PesananAmbulance(),
        '/trackingAmbulance': (context) => TrackingAmbulance(),
        '/riwayat': (context) => Riwayat(),
      },
    );
  }
}
