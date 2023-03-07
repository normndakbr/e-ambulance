import 'dart:convert';
import 'package:e_ambulance_apps/models/beranda_model.dart';

import '../models/beranda_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../services/sharedPreferences.dart';

class BerandaRepository {
  static Future<BerandaRes> fetchBeranda() async {
    final SharedPreferenceService sharedPref = SharedPreferenceService();
    var id_user = await sharedPref.readData('p_id_user');
    String accKasir = "625962e2-7dd1-a6de-a5aa-b04e760a8c8c";
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.readTransaksiEndpoint +
        '/' +
        id_user +
        '/' +
        accKasir);
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    return BerandaRes.createHistoryRes(jsonObject);
  }

  static Future<BerandaUpdateRes> updateStatusTransaksi(
      String id_transaksi, String jenis_update) async {
    String idStatusTransaksi = "";
    final SharedPreferenceService sharedPref = SharedPreferenceService();
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.updateStatusTransaksi);

    if (jenis_update == 'accSupir') {
      idStatusTransaksi = '83f80c00-a4da-2939-096b-e976b719d7ac';
    } else if (jenis_update == 'accSampaiTujuan') {
      idStatusTransaksi = '3b6b76bc-20ca-7ebc-5afa-ed5d26b1c9d2';
    } else if (jenis_update == 'accSampaiDiRS') {
      idStatusTransaksi = 'e17b741e-46a8-1712-cdb6-1c010a473697';
    }

    await sharedPref.writeData('idStatusTransaksi', idStatusTransaksi);
    var apiResult = await http.post(url, body: {
      "id_status_transaksi": idStatusTransaksi,
      "id_transaksi": id_transaksi,
    });
    var jsonObject = json.decode(apiResult.body);
    return BerandaUpdateRes.createBerandaRes(jsonObject);
  }

  static Future<BerandaUpdateRes> updateStatusAmbulance(
      String id_transaksi) async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.updateStatusAmbulance);

    var apiResult = await http.post(url, body: {
      "id_transaksi": id_transaksi,
    });
    var jsonObject = json.decode(apiResult.body);

    return BerandaUpdateRes.createBerandaRes(jsonObject);
  }

  static Future<BerandaUpdateRes> updateStatusSopir(
      String id_supir, String id_supir_2) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.updateStatusSopir);

    var apiResult = await http.post(url, body: {
      "id_supir": id_supir,
    });

    var jsonObject = json.decode(apiResult.body);

    var apiResult2 = await http.post(url, body: {
      "id_supir": id_supir_2,
    });
    var jsonObject2 = json.decode(apiResult.body);

    return BerandaUpdateRes.createBerandaRes(jsonObject);
  }

  static Future<BerandaUpdateRes> updateLatLong(
      String id_transaksi, String? lat, String? long) async {
    var url =
        Uri.parse(ApiConstants.baseUrl + ApiConstants.sendLatLongEndpoint);

    var apiResult = await http.post(url,
        body: {"id_transaksi": id_transaksi, "lat": lat, "long": long});
    var jsonObject = json.decode(apiResult.body);

    return BerandaUpdateRes.createBerandaRes(jsonObject);
  }
}
