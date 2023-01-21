import 'package:cool_alert/cool_alert.dart';
import 'package:e_ambulance_apps/repositories/beranda_repositories.dart';
import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';
import '../models/beranda_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// pages
import '../widgets/MenuButton.dart';
import '../widgets/pesananDetail.dart';
import '../widgets/pesananKosong.dart';
import './login.dart';

// widgets
import '../widgets/ButtonRiwayat.dart';

class PesananAmbulance extends StatefulWidget {
  const PesananAmbulance({Key? key}) : super(key: key);

  @override
  State<PesananAmbulance> createState() => _PesananAmbulanceState();
}

class _PesananAmbulanceState extends State<PesananAmbulance> {
  var flagPesanan = false;
  var flagLoading = false;
  BerandaRepository berandaReps = BerandaRepository();
  Data pesananBaru = Data();
  final SharedPreferenceService sharedPref = SharedPreferenceService();

  fetchData() async {
    await BerandaRepository.fetchBeranda().then(
      (value) => {
        if (value.status == 200)
          {
            if (value.data != "")
              {
                setState(
                  () => {
                    flagPesanan = true,
                    pesananBaru = value.data!,
                  },
                ),
                EasyLoading.dismiss(),
              }
            else
              {
                setState(
                  () => {
                    flagPesanan = false,
                  },
                ),
                EasyLoading.dismiss(),
              }
          }
        else
          {
            setState(
              () => {
                flagPesanan = false,
              },
            ),
            EasyLoading.dismiss(),
          },
      },
    );
  }

  @override
  void initState() {
    fetchData();
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
