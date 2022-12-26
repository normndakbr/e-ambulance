import 'package:e_ambulance_apps/repositories/beranda_repositories.dart';
import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';
import '../models/beranda_model.dart';

// pages
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
  BerandaRepository berandaReps = BerandaRepository();
  Data pesananBaru = Data();

  fetchData() async {
    await BerandaRepository.fetchBeranda().then(
      (value) => {
        if (value.status == 200)
          {
            setState(
              () => {
                flagPesanan = true,
                pesananBaru = value.data,
              },
            ),
          }
        else
          {
            setState(
              () => {
                flagPesanan = false,
              },
            ),
          }
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
              Align(
                alignment: Alignment.topRight,
                child: ConstrainedBox(
                  child: Align(
                    child: ButtonRiwayat(),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 50,
                    maxWidth: 100,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: () => {
                    setState(() {
                      flagPesanan = !flagPesanan;
                      fetchData();
                    })
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
                        ? PesananKosong(height: height, width: width)
                        : PesananDetail(
                            height: height,
                            width: width,
                            pesanan: pesananBaru,
                          ),
                    // child: PesananKosong(height: height, width: width),
                    // child: PesananDetail(height: height, width: width),
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
