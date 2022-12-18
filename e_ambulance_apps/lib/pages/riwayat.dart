import 'package:e_ambulance_apps/widgets/historyItem.dart';
import 'package:flutter/material.dart';
import 'package:e_ambulance_apps/services/sharedPreferences.dart';
import './pesananAmbulance.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  var mapData;

  @override
  void initState() {
    mapData = items.map((e) {
      return {
        "alamat": e.alamat,
        "statusPerjalanan": e.statusPerjalanan,
        "noInvoice": e.noInvoice,
        "tglPerjalanan": e.tglPerjalanan
      };
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    const primaryColor = Color(0xFF0E9E2E);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            Expanded(
              child: ListView.builder(
                  itemCount: mapData.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (BuildContext context, int element) {
                    return HistoryItem(
                      alamat: mapData[element]['alamat'],
                      statusPerjalanan: mapData[element]['statusPerjalanan'],
                      noInvoice: mapData[element]['noInvoice'],
                      tglPerjalanan: mapData[element]['tglPerjalanan'],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPerjalanan {
  String alamat, statusPerjalanan, noInvoice, tglPerjalanan;
  DataPerjalanan({
    required this.alamat,
    required this.statusPerjalanan,
    required this.noInvoice,
    required this.tglPerjalanan,
  });
}

List<DataPerjalanan> items = [
  DataPerjalanan(
    alamat: "Jln. Daan No. 752 Kec. Kaliorang Kab. Kutai Timur",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-75446",
    tglPerjalanan: "21/10/2022",
  ),
  DataPerjalanan(
    alamat: "Dk. Flores No. 404",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-73097",
    tglPerjalanan: "01/01/2022",
  ),
  DataPerjalanan(
    alamat: "Kpg. Abdul. Muis No. 861",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-77786",
    tglPerjalanan: "01/03/2022",
  ),
  DataPerjalanan(
    alamat: "Dk. Camar No. 665",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-713786",
    tglPerjalanan: "11/03/2022",
  ),
  DataPerjalanan(
    alamat: "Jr. Padma No. 322",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-29917",
    tglPerjalanan: "11/05/2022",
  ),
  DataPerjalanan(
    alamat: "Kpg. Peta No. 52",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-51678",
    tglPerjalanan: "11/08/2022",
  ),
  DataPerjalanan(
    alamat: "Kpg. Peta No. 52 Kec. Gunung Kidul",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-51678",
    tglPerjalanan: "11/08/2022",
  ),
  DataPerjalanan(
    alamat: "Dk. Salam No. 417",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-94037",
    tglPerjalanan: "17/08/2022",
  ),
  DataPerjalanan(
    alamat: "Ki. Ciwastra No. 588",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-61757",
    tglPerjalanan: "17/02/2022",
  ),
  DataPerjalanan(
    alamat: "Ki. Gotong Royong No. 328",
    statusPerjalanan: "Perjalanan Selesai",
    noInvoice: "INV-53316",
    tglPerjalanan: "27/02/2022",
  ),
];
