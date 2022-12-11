import 'package:e_ambulance_apps/widgets/pesananKosong.dart';
import 'package:e_ambulance_apps/widgets/trackingDetail.dart';
import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';

// pages
import '../pages/pesananAmbulance.dart';

// widgets
import '../widgets/trackingDetail.dart';
import '../widgets/ButtonRiwayat.dart';

class TrackingAmbulance extends StatefulWidget {
  const TrackingAmbulance({Key? key}) : super(key: key);

  @override
  State<TrackingAmbulance> createState() => _TrackingAmbulanceState();
}

class _TrackingAmbulanceState extends State<TrackingAmbulance> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
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
                child: TrackingDetail(height: height, width: width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
