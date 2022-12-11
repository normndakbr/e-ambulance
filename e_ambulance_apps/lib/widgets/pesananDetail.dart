import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PesananDetail extends StatelessWidget {
  const PesananDetail({
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
          height: height * 0.08,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 9, left: 33),
          alignment: Alignment.centerLeft,
          child: Text(
            'Ambulance 001',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height * 0.028,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 33),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "Nama Pasien",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("Kresna Vespri"),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "Alamat Pasien",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("Jl. Veteran Lr. Kenari"),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "No. HP Pasien",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("085145673654"),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "Tgl. Pemesanan",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("18/10/2023"),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "Jenis Ambulance",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("Ambulance Pasien"),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "Nomor Plat",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("BG 1234 PLT"),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      "No. Invoice",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text("INV - 5543234"),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.08,
        ),
        ContentDetail(
            height: height,
            width: width,
            fontSize1: fontSize1,
            primaryColor: primaryColor)
      ],
    );
  }
}

class ContentDetail extends StatelessWidget {
  const ContentDetail({
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
            'Konfirmasi',
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
            Navigator.pushNamed(context, '/trackingAmbulance');
          },
        ),
      ),
    );
  }
}
