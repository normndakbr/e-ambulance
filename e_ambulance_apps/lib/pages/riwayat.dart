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
              padding: EdgeInsets.only(left: width * 0.06),
              child: Text(
                'Riwayat Perjalanan',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.038,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: primaryColor,
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        hintText: 'cari',
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  SizedBox(
                    height: 53,
                    width: 53,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      // child: PesananKosong(height: height, width: width),
                      child: Image(
                        height: 50,
                        width: 50,
                        image: AssetImage('assets/images/btnFilter.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber,
                        child: Center(
                          child: Text('Entry'),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
