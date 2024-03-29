import 'package:e_ambulance_apps/pages/login.dart';
import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulance.dart';
import 'package:e_ambulance_apps/pages/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkUserLogin() async {
    await sharedPref.readData("p_username").then((value) => {
          if (value != null)
            {
              setState(() => {
                    p_username = value,
                  })
            }
        });
    await sharedPref.readData("p_id_user").then((value) => {
          if (value != null)
            {
              setState(() => {
                    p_id_user = value,
                  })
            }
        });

    if (p_username != null && p_id_user != null) {
      if (this.mounted) {
        setState(() {
          isLoggedIn = true;
        });
      }
    } else {
      if (this.mounted) {
        setState(() {
          isLoggedIn = false;
        });
      }
    }
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
