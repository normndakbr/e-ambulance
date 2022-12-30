import 'package:cool_alert/cool_alert.dart';
import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulanceToRSMH.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../repositories/beranda_repositories.dart';
import '../services/sharedPreferences.dart';

class TrackingToRSMH extends StatelessWidget {
  const TrackingToRSMH({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0E9E2E);
    var sizedBox1 = height * 0.03;
    var fontSize1 = height * 0.03;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              'Tracking Ambulance kembali ke Rumah Sakit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: height * 0.030,
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.2,
        ),
        Container(
          color: Colors.white,
          child: Image.asset('assets/images/ambulance4.png'),
        ),
        SizedBox(
          height: height * 0.2,
        ),
        ButtonSampaiTujuan(
          height: height,
          width: width,
          fontSize1: fontSize1,
          primaryColor: primaryColor,
        )
      ],
    );
  }
}

class ButtonSampaiTujuan extends StatefulWidget {
  const ButtonSampaiTujuan({
    Key? key,
    required this.height,
    required this.width,
    required this.fontSize1,
    required this.primaryColor,
  }) : super(key: key);

  final double height;
  final double width;
  final double fontSize1;
  final Color primaryColor;

  @override
  State<ButtonSampaiTujuan> createState() => _ButtonSampaiTujuanState();
}

class _ButtonSampaiTujuanState extends State<ButtonSampaiTujuan> {
  @override
  Widget build(BuildContext context) {
    var idTransaksi = "";
    const primaryColor = Color(0xFF0E9E2E);
    late BerandaRepository berandaRepository;
    final SharedPreferenceService sharedPref = SharedPreferenceService();

    return Center(
      child: SizedBox(
        height: widget.height * 0.085,
        width: widget.width * 0.8,
        child: TextButton(
          child: Text(
            'Pengantaran Selesai',
            style: TextStyle(fontSize: widget.fontSize1),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: widget.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onPressed: () async {
            EasyLoading.show(
              status: 'loading...',
              maskType: EasyLoadingMaskType.black,
            );
            await sharedPref.readData('id_transaksi').then((value) => {
                  EasyLoading.dismiss(),
                  setState(() => {
                        idTransaksi = value,
                      }),
                });

            BerandaRepository.updateStatusTransaksi(
                    idTransaksi, 'accSampaiDiRS')
                .then((value) => {
                      BerandaRepository.updateStatusAmbulance(idTransaksi)
                          .then((value) => {
                                BerandaRepository.updateStatusSopir(idTransaksi)
                                    .then((value) => {
                                          if (value.status == 200)
                                            {
                                              CoolAlert.show(
                                                context: context,
                                                type: CoolAlertType.success,
                                                text:
                                                    "Anda telah sampai kembali di Rumah Sakit",
                                                confirmBtnText:
                                                    'Pesanan Selesai',
                                                confirmBtnColor: primaryColor,
                                                onConfirmBtnTap: () async {
                                                  Navigator.pop(context);
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          PesananAmbulance(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            }
                                          else
                                            {
                                              EasyLoading.dismiss(),
                                              CoolAlert.show(
                                                context: context,
                                                type: CoolAlertType.error,
                                                text: value.message,
                                                confirmBtnText: 'Lanjut',
                                                confirmBtnColor: primaryColor,
                                                onConfirmBtnTap: () async {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            }
                                        }),
                              }),
                    });

            // Navigator.pushNamed(context, '/pesananAmbulance');
          },
        ),
      ),
    );
  }
}
