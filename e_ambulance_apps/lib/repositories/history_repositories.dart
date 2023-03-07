import 'dart:convert';
import 'package:e_ambulance_apps/models/beranda_model.dart';

import '../models/history_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../services/sharedPreferences.dart';

class HistoryRepository {
  static Future<HistoryRes> fetchHistory() async {
    String accSupirSampaidiRS = "e17b741e-46a8-1712-cdb6-1c010a473697";
    final SharedPreferenceService sharedPref = SharedPreferenceService();
    var id_user = await sharedPref.readData('p_id_user');
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.readHistoryEndpoint +
        '/' +
        id_user +
        '/' +
        accSupirSampaidiRS);

    // print("Url FETCH HISTORY => " + url.toString());

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    // print(jsonObject);

    return HistoryRes.createHistoryRes(jsonObject);
  }
}
