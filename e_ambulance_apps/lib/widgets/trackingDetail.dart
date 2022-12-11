import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingDetail extends StatelessWidget {
  const TrackingDetail({
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
              'Tracking Ambulance',
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
          height: height * 0.08,
        ),
        SizedBox(
          height: height * 0.08,
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

class ButtonSampaiTujuan extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height * 0.085,
        width: width * 0.8,
        child: TextButton(
          child: Text(
            'Sampai Tujuan',
            style: TextStyle(fontSize: fontSize1),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/pesananAmbulance');
          },
        ),
      ),
    );
  }
}
