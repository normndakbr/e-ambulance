import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../repositories/user_repositories.dart';
import '../services/sharedPreferences.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:geolocator/geolocator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userCtl = TextEditingController();
  TextEditingController pwdCtl = TextEditingController();
  final SharedPreferenceService sharedPref = SharedPreferenceService();
  late UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    String userLevel = 'cef5e5a8-ebdc-b854-5fbf-0615a66e97e2';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const color = Color(0xFF0E9E2E);
    LocationPermission permission;
    String? _currentAddress;
    Position? _currentPosition;

    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();

      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() => _currentPosition = position);
      }).catchError((e) {
        debugPrint(e);
      });
    }

    @override
    void initState() {
      userRepository = UserRepository();
      super.initState();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: color,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(height * 0.05),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/ambulance.png'),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: TextField(
                      controller: userCtl,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: 'Username',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: TextField(
                      controller: pwdCtl,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: 'Password',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.08,
                      width: width * 0.5,
                      child: TextButton(
                        child: Text('Login'),
                        style: TextButton.styleFrom(
                          primary: color,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.black,
                          );
                          await UserRepository.login(userCtl.text, pwdCtl.text)
                              .then(
                            (value) => {
                              if (value.status == 401)
                                {
                                  EasyLoading.dismiss(),
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: value.message,
                                    confirmBtnText: 'Coba Lagi',
                                    confirmBtnColor: color,
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                }
                              else if (value.status == 404)
                                {
                                  EasyLoading.dismiss(),
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.error,
                                    text: value.message,
                                    confirmBtnText: 'Coba Lagi',
                                    confirmBtnColor: color,
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                }
                              else if (value.status == 200)
                                {
                                  if (value.data.p_id_user_level == userLevel)
                                    {
                                      EasyLoading.dismiss(),
                                      CoolAlert.show(
                                          context: context,
                                          type: CoolAlertType.success,
                                          text: value.message,
                                          confirmBtnText: 'Lanjut',
                                          confirmBtnColor: color,
                                          onConfirmBtnTap: () async {
                                            await sharedPref.writeData(
                                                'p_username',
                                                value.data.p_username);
                                            await sharedPref.writeData(
                                                'p_id_user',
                                                value.data.p_id_user);
                                            _getCurrentPosition().then(
                                              (value) => {
                                                print("LatLong Print !"),
                                                print(_currentPosition?.latitude
                                                    .toString()),
                                                print(_currentPosition
                                                    ?.longitude
                                                    .toString()),
                                              },
                                            );
                                            Navigator.pop(context);
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PesananAmbulance(),
                                              ),
                                            );
                                          }),
                                    }
                                  else
                                    {
                                      EasyLoading.dismiss(),
                                      CoolAlert.show(
                                          context: context,
                                          type: CoolAlertType.error,
                                          text: 'Akun supir tidak terdaftar',
                                          confirmBtnText: 'Coba Lagi',
                                          confirmBtnColor: color,
                                          onConfirmBtnTap: () {
                                            Navigator.pop(context);
                                          }),
                                    }
                                }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
