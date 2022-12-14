import 'package:cool_alert/cool_alert.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/beranda_model.dart';
import 'package:intl/intl.dart';

import '../repositories/beranda_repositories.dart';
import '../services/sharedPreferences.dart';

class PesananDetail extends StatelessWidget {
  PesananDetail({
    Key? key,
    required this.height,
    required this.width,
    required this.pesanan,
  }) : super(key: key);

  final double height;
  final double width;
  Data pesanan = Data();

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
                    child: Text(pesanan.pNamaLengkap),
                  ),
                ],
              ),
              SizedBox(height: sizedBox1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Text(pesanan.pAlamat),
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
                    child: Text(pesanan.pNomorTelepon),
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
                    child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format(pesanan.pTanggalTransaksi),
                    ),
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
                    child: Text(pesanan.pKategoriAmbulance),
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
                    child: Text(pesanan.pNomorPlat),
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
                    child: Text(pesanan.pNomorInvoice),
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
          primaryColor: primaryColor,
          idTransaksi: pesanan.pIdTransaksi,
        )
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
    required this.idTransaksi,
  }) : super(key: key);

  final double height;
  final double width;
  final double fontSize1;
  final Color primaryColor;
  final String idTransaksi;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF0E9E2E);
    late BerandaRepository berandaRepository;
    final SharedPreferenceService sharedPref = SharedPreferenceService();

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
            BerandaRepository.updateStatusTransaksi(idTransaksi, 'accSupir')
                .then(
              (value) => {
                CoolAlert.show(
                    context: context,
                    type: CoolAlertType.success,
                    text: "Pesanan berhasil diterima",
                    confirmBtnText: 'Lanjut',
                    confirmBtnColor: color,
                    onConfirmBtnTap: () async {
                      await sharedPref.writeData('id_transaksi', idTransaksi);
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TrackingAmbulance(),
                        ),
                      );
                    }),
                // Navigator.pushNamed(context, '/trackingAmbulance'),
              },
            );
          },
        ),
      ),
    );
  }
}
