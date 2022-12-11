import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';
import './pesananAmbulance.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   automaticallyImplyLeading: false,
        //   actions: [
        //     Container(
        //       padding: EdgeInsets.only(top: 20),
        //       child: ButtonRiwayat(),
        //     ),
        //   ],
        // ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonRiwayat extends StatelessWidget {
  const ButtonRiwayat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          child: Image.asset('assets/images/btnRiwayat.png'),
        ),
      ),
    );
  }
}

class Backup extends StatelessWidget {
  const Backup({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.08,
        ),
        Container(
          child: Text(
            'Pemesanan Ambulance',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: height * 0.030,
            ),
          ),
        ),
        Container(
          child: Text(
            'Sedang Tidak Ada Pesanan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height * 0.041,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        Container(
          color: Colors.white,
          child: Image.asset('assets/images/imgPesananKosong.png'),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
