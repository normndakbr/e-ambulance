import 'package:flutter/material.dart';
import '../services/sharedPreferences.dart';
import 'package:cool_alert/cool_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  TextEditingController userCtl = TextEditingController();
  TextEditingController pwdCtl = TextEditingController();
  final SharedPreferenceService sharedPref = SharedPreferenceService();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const color = Color(0xFF0E9E2E);

    return Scaffold(
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/pesananAmbulance');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
