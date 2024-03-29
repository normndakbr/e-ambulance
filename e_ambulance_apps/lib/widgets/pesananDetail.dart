import 'package:cool_alert/cool_alert.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulance.dart';
import 'package:e_ambulance_apps/pages/trackingAmbulanceToRSMH.dart';
import 'package:flutter/material.dart';
import '../models/beranda_model.dart';
import 'package:intl/intl.dart';
import '../repositories/beranda_repositories.dart';
import '../services/sharedPreferences.dart';
import '../services/locationServices.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cron/cron.dart';
import '../main.dart';

Position? _currentPosition;
String idTransaksi = "";

class PesananDetail extends StatefulWidget {
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
  State<PesananDetail> createState() => _PesananDetailState();
}

class _PesananDetailState extends State<PesananDetail> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0E9E2E);
    var sizedBox1 = widget.height * 0.03;
    var fontSize1 = widget.height * 0.03;

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
                fontSize: widget.height * 0.030,
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.height * 0.03,
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
                    child: Text(widget.pesanan.pNamaLengkap),
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
                    child: Text(widget.pesanan.pAlamat),
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
                    child: Text(widget.pesanan.pNomorTelepon),
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
                          .format(widget.pesanan.pTanggalTransaksi),
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
                    child: Text(widget.pesanan.pKategoriAmbulance),
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
                    child: Text(widget.pesanan.pNomorPlat),
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
                    child: Text(widget.pesanan.pNomorInvoice),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: widget.height * 0.08,
        ),
        ContentDetail(
          height: widget.height,
          width: widget.width,
          fontSize1: fontSize1,
          primaryColor: primaryColor,
          idTransaksi: widget.pesanan.pIdTransaksi,
          pIdSupirDetail: widget.pesanan.pIdSupirDetail,
          pIdSupirDetail2: widget.pesanan.pIdSupirDetail2,
        )
      ],
    );
  }
}

class ContentDetail extends StatefulWidget {
  const ContentDetail({
    Key? key,
    required this.height,
    required this.width,
    required this.fontSize1,
    required this.primaryColor,
    required this.idTransaksi,
    required this.pIdSupirDetail,
    required this.pIdSupirDetail2,
  }) : super(key: key);

  final double height;
  final double width;
  final double fontSize1;
  final Color primaryColor;
  final String idTransaksi;
  final String pIdSupirDetail;
  final String pIdSupirDetail2;

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF0E9E2E);
    final SharedPreferenceService sharedPref = SharedPreferenceService();

    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }
      return true;
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();

      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).then((Position position) {
        setState(
          () => {
            _currentPosition = position,
          },
        );
      }).catchError((e) {
        debugPrint(e);
      });
    }

    return Center(
      child: SizedBox(
        height: widget.height * 0.085,
        width: widget.width * 0.8,
        child: TextButton(
          child: Text(
            'Konfirmasi',
            style: TextStyle(fontSize: widget.fontSize1),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: widget.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onPressed: () {
            BerandaRepository.updateStatusTransaksi(
                    widget.idTransaksi, 'accSupir')
                .then(
              (value) => {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: "Pesanan berhasil diterima",
                  confirmBtnText: 'Lanjut',
                  confirmBtnColor: color,
                  onConfirmBtnTap: () async {
                    cron.schedule(Schedule.parse('*/2 * * * *'), () async {
                      await _getCurrentPosition()
                          .then((value) => {
                                print("LatLong Print !"),
                                print(_currentPosition?.latitude.toString()),
                                print(_currentPosition?.longitude.toString()),
                              })
                          .then((value) async {
                        await BerandaRepository.updateLatLong(
                            widget.idTransaksi,
                            _currentPosition?.latitude.toString(),
                            _currentPosition?.longitude.toString());
                      });
                    });

                    await sharedPref.writeData(
                        'id_transaksi', widget.idTransaksi);
                    await sharedPref.writeData(
                        'p_id_supir_detail', widget.pIdSupirDetail);
                    await sharedPref.writeData(
                        'p_id_supir_detail_2', widget.pIdSupirDetail2);
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => TrackingAmbulance(),
                      ),
                    );
                  },
                ),
              },
            );
          },
        ),
      ),
    );
  }
}
