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

    // print("id user => " + id_user);
    // print("accKasir => " + accKasir);

    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.readTransaksiEndpoint +
        '/' +
        id_user +
        '/' +
        accKasir);

    print("Url => " + url.toString());

    var apiResult = await http.get(url);

    var jsonObject = json.decode(apiResult.body);

    print(jsonObject);

    // return listHistoryFromJson(jsonObject);
    return BerandaRes.createHistoryRes(jsonObject);
  }
}
