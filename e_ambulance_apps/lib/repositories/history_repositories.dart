import 'dart:convert';
import '../models/history_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../services/sharedPreferences.dart';

class HistoryRepository {
  static Future<HistoryRes> fetchHistory() async {
    String accSupirSampaidiRS = "5f6bd832-e553-27ea-9733-30517939e6cf";
    final SharedPreferenceService sharedPref = SharedPreferenceService();
    var id_user = await sharedPref.readData('p_id_user');
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.readHistoryEndpoint +
        '/' +
        id_user +
        '/' +
        accSupirSampaidiRS +
        '/' +
        accSupirSampaidiRS);

    print("Url => " + url.toString());

    var apiResult = await http.get(url);

    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);
    // return listHistoryFromJson(jsonObject);
    return HistoryRes.createHistoryRes(jsonObject);
  }
}
