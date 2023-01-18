import 'package:cool_alert/cool_alert.dart';
import 'package:e_ambulance_apps/pages/pesananAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulanceToRSMH.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../main.dart';

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
              textAlign: TextAlign.left,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: height * 0.030,
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.09,
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
    var idSupir1 = "";
    var idSupir2 = "";
    const primaryColor = Color(0xFF0E9E2E);
    late BerandaRepository berandaRepository;
    final SharedPreferenceService sharedPref = SharedPreferenceService();
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

    Future<void> _getAddressFromLatLng(Position position) async {
      await placemarkFromCoordinates(
              _currentPosition!.latitude, _currentPosition!.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        setState(() {
          _currentAddress =
              '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        });
      }).catchError((e) {
        debugPrint(e);
      });
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();

      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() => _currentPosition = position);
        _getAddressFromLatLng(_currentPosition!);
      }).catchError((e) {
        debugPrint(e);
      });
    }

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

            // await sharedPref.writeData(
            //     'p_id_supir_detail', widget.pIdSupirDetail);
            // await sharedPref.writeData(
            //     'p_id_supir_detail_2', widget.pIdSupirDetail2);

            await sharedPref.readData('p_id_supir_detail').then((value) => {
                  setState(() => {
                        idSupir1 = value,
                      }),
                });

            await sharedPref.readData('p_id_supir_detail_2').then((value) => {
                  setState(() => {
                        idSupir2 = value,
                      }),
                });

            await sharedPref.readData('id_transaksi').then(
                  (value) => {
                    EasyLoading.dismiss(),
                    setState(() => {
                          idTransaksi = value,
                        }),
                  },
                );

            await _getCurrentPosition()
                .then((value) => {
                      print("Last LatLong Print !"),
                      print(_currentPosition?.latitude.toString()),
                      print(_currentPosition?.longitude.toString()),
                    })
                .then((value) async {
              await BerandaRepository.updateLatLong(
                  idTransaksi,
                  _currentPosition?.latitude.toString(),
                  _currentPosition?.longitude.toString());
            });

            BerandaRepository.updateStatusTransaksi(
                    idTransaksi, 'accSampaiDiRS')
                .then((value) => {
                      BerandaRepository.updateStatusAmbulance(idTransaksi)
                          .then((value) => {
                                BerandaRepository.updateStatusSopir(
                                        idSupir1, idSupir2)
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
                                                  idTransaksi = await sharedPref
                                                      .readData('id_transaksi');
                                                  cron.close();
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
                                                confirmBtnText: 'Ok',
                                                confirmBtnColor: primaryColor,
                                                onConfirmBtnTap: () async {
                                                  cron.close();
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
