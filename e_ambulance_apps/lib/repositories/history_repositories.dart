import 'dart:convert';
import '../models/history_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class HistoryRepository {
  static Future<HistoryRes> fetchHistory() async {
    String accSupirSampaidiRS = "e17b741e-46a8-1712-cdb6-1c010a473697";
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.readHistoryEndpoint +
        '/' +
        accSupirSampaidiRS +
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
