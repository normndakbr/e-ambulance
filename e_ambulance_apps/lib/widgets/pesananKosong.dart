import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PesananKosong extends StatelessWidget {
  const PesananKosong({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0E9E2E);

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
              'Pemesanan Ambulance',
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
          height: height * 0.1,
        ),
        Container(
          width: width * 0.5,
          child: Text(
            'Sedang Tidak Ada Pesanan, Tap 2x dimana saja untuk me refresh data.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.1,
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
