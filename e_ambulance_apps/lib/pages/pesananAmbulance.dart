import 'package:cool_alert/cool_alert.dart';
import 'package:cron/cron.dart';
import 'package:e_ambulance_apps/main.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulanceToRSMH.dart';
import 'package:e_ambulance_apps/repositories/beranda_repositories.dart';
import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';
import 'package:geolocator/geolocator.dart';
import '../models/beranda_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// pages
import '../services/locationServices.dart';
import '../widgets/MenuButton.dart';
import '../widgets/pesananDetail.dart';
import '../widgets/pesananKosong.dart';
import './login.dart';

// widgets
import '../widgets/ButtonRiwayat.dart';

Position? _currentPosition;

class PesananAmbulance extends StatefulWidget {
  const PesananAmbulance({Key? key}) : super(key: key);

  @override
  State<PesananAmbulance> createState() => _PesananAmbulanceState();
}

class _PesananAmbulanceState extends State<PesananAmbulance> {
  var flagPesanan = false;
  var flagLoading = false;
  String pUsername = "";
  String pIdUser = "";
  String _idTransaksi = "";
  BerandaRepository berandaReps = BerandaRepository();
  Data pesananBaru = Data();
  final SharedPreferenceService sharedPref = SharedPreferenceService();
  final LocationServices locationServices = LocationServices();

  Future<void> checkStatusTransaksi() async {
    await sharedPref.readData('id_transaksi').then((id_transaksi) async {
      if (id_transaksi != "" || id_transaksi != null) {
        await sharedPref
            .readData('idStatusTransaksi')
            .then((id_status_transaksi) => {
                  if (id_status_transaksi ==
                      "83f80c00-a4da-2939-096b-e976b719d7ac")
                    {
                      cron.schedule(Schedule.parse('*/2 * * * *'), () async {
                        await locationServices
                            .getDevicePosition()
                            .then((value) => {
                                  print("LatLong Print !"),
                                  print(_currentPosition?.latitude.toString()),
                                  print(_currentPosition?.longitude.toString()),
                                })
                            .then((value) async {
                          await BerandaRepository.updateLatLong(
                              id_transaksi,
                              _currentPosition?.latitude.toString(),
                              _currentPosition?.longitude.toString());
                        });
                      }),
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TrackingAmbulance(),
                        ),
                      ),
                    }
                  else if (id_status_transaksi ==
                      "3b6b76bc-20ca-7ebc-5afa-ed5d26b1c9d2")
                    {
                      cron.schedule(Schedule.parse('*/2 * * * *'), () async {
                        await locationServices
                            .getDevicePosition()
                            .then((value) => {
                                  print("LatLong Print !"),
                                  print(_currentPosition?.latitude.toString()),
                                  print(_currentPosition?.longitude.toString()),
                                })
                            .then((value) async {
                          await BerandaRepository.updateLatLong(
                              id_transaksi,
                              _currentPosition?.latitude.toString(),
                              _currentPosition?.longitude.toString());
                        });
                      }),
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TrackingAmbulanceToRSMH(),
                        ),
                      ),
                    }
                });
      }
    });
  }

  Future<void> fetchData() async {
    print("Fetch Data!");
    await BerandaRepository.fetchBeranda().then(
      (value) async {
        if (value.status == 200) {
          if (value.data != "") {
            await sharedPref.writeData(
                'id_transaksi', value.data!.pIdTransaksi);
            setState(
              () => {
                flagPesanan = true,
                pesananBaru = value.data!,
              },
            );
            EasyLoading.dismiss();
          } else {
            setState(() => {flagPesanan = false});
            EasyLoading.dismiss();
          }
        } else {
          if (this.mounted) {
            setState(() => {flagPesanan = false});
            EasyLoading.dismiss();
          }
        }
      },
    );
  }

  void checkToken() async {
    await sharedPref.readData("p_username").then((value) => {
          setState(() {
            pUsername = value;
          })
        });

    await sharedPref.readData("p_id_user").then((value) => {
          setState(() {
            pIdUser = value;
          })
        });
  }

  @override
  void initState() {
    checkStatusTransaksi();
    checkToken();
    if (pUsername == null && pIdUser == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
    } else {
      fetchData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const primaryColor = Color(0xFF0E9E2E);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              MenuButton(primaryColor: primaryColor, sharedPref: sharedPref),
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: () => {
                    EasyLoading.show(
                      status: 'loading...',
                      maskType: EasyLoadingMaskType.black,
                    ),
                    fetchData(),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: flagPesanan == false
                        ? PesananKosong(
                            height: height,
                            width: width,
                          )
                        : PesananDetail(
                            height: height,
                            width: width,
                            pesanan: pesananBaru,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
