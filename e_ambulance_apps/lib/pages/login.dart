import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../repositories/user_repositories.dart';
import '../services/sharedPreferences.dart';
import '../services/locationServices.dart';
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
  final LocationServices locationServices = LocationServices();
  late UserRepository userRepository;
  String p_username = "";
  String p_id_user = "";

  void checkToken() async {
    locationServices.getDevicePosition();
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
    if (p_username != null && p_id_user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => PesananAmbulance(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    userRepository = UserRepository();
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String userLevel = 'cef5e5a8-ebdc-b854-5fbf-0615a66e97e2';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const color = Color(0xFF0E9E2E);

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
