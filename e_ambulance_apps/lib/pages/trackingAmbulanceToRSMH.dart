import 'package:e_ambulance_apps/widgets/pesananKosong.dart';
import 'package:e_ambulance_apps/widgets/trackingDetail.dart';
import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';

// pages
import '../pages/pesananAmbulance.dart';

// widgets
import '../widgets/trackingDetail.dart';
import '../widgets/ButtonRiwayat.dart';
import '../widgets/trackingToRSMH.dart';

class TrackingAmbulanceToRSMH extends StatefulWidget {
  const TrackingAmbulanceToRSMH({Key? key}) : super(key: key);

  @override
  State<TrackingAmbulanceToRSMH> createState() =>
      _TrackingAmbulanceToRSMHState();
}

class _TrackingAmbulanceToRSMHState extends State<TrackingAmbulanceToRSMH> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
                  // child: PesananKosong(height: height, width: width),
                  child: TrackingToRSMH(height: height, width: width),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
