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
    const primaryColor = Color(0xFF0E9E2E);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: width * 0.08),
              child: Text(
                'Riwayat Perjalanan',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.030,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.search),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'cari',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
