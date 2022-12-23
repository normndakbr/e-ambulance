import 'package:flutter/material.dart';
import '../repositories/user_repositories.dart';
import '../services/sharedPreferences.dart';
import 'package:cool_alert/cool_alert.dart';

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const color = Color(0xFF0E9E2E);

    @override
    void initState() {
      userRepository = UserRepository();
      super.initState();
    }

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
                      onPressed: () {
                        UserRepository.login(userCtl.text, pwdCtl.text)
                            .then((value) => {
                                  print("p_id_user => " + value.data.p_id_user),
                                  if (value.status == 200)
                                    {
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
                                            Navigator.pushReplacementNamed(
                                                context, '/pesananAmbulance');
                                          }),
                                    }
                                  else
                                    {
                                      CoolAlert.show(
                                          context: context,
                                          type: CoolAlertType.error,
                                          text: value.message,
                                          confirmBtnText: 'Coba Lagi',
                                          confirmBtnColor: color,
                                          onConfirmBtnTap: () {
                                            Navigator.pop(context);
                                          }),
                                    }
                                });
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
