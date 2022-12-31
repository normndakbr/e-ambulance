import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../pages/login.dart';
import '../services/sharedPreferences.dart';
import 'ButtonRiwayat.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.primaryColor,
    required this.sharedPref,
  }) : super(key: key);

  final Color primaryColor;
  final SharedPreferenceService sharedPref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => {
            CoolAlert.show(
                context: context,
                title: 'Keluar',
                type: CoolAlertType.confirm,
                text: 'Anda ingin keluar dari aplikasi?',
                confirmBtnText: 'Ya',
                cancelBtnText: 'Tidak',
                confirmBtnColor: primaryColor,
                onConfirmBtnTap: () async {
                  EasyLoading.show();
                  await sharedPref.deleteData('p_username');
                  await sharedPref.deleteData('p_id_user');
                  EasyLoading.dismiss();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                }),
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              child: Image.asset('assets/images/btnLogout.png'),
            ),
          ),
        ),
        ButtonRiwayat(),
      ],
    );
  }
}
