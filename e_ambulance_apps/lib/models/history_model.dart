import 'dart:convert';

List<Data> listHistoryFromJson(String str) => List<Data>.from(
      json.decode(str).map((x) => Data.fromJson(x)),
    );

class HistoryRes {
  late int status;
  late String message;
  List<Data> data;

  HistoryRes({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoryRes.createHistoryRes(Map<String, dynamic> json) {
    return HistoryRes(
      status: json['status'],
      message: json['message'],
      data: (json['data'].length > 0)
          ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(
          data.map((x) => x.toJson()),
        ),
      };
}

class Data {
  String pIdTransaksi;
  String pNomorInvoice;
  String pAlamat;
  DateTime pTanggalTransaksi;
  String pIdStatusTransaksi;
  String pStatusTransaksi;

  Data({
    required this.pIdTransaksi,
    required this.pNomorInvoice,
    required this.pAlamat,
    required this.pTanggalTransaksi,
    required this.pIdStatusTransaksi,
    required this.pStatusTransaksi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pIdTransaksi: json["p_id_transaksi"],
        pNomorInvoice: json["p_nomor_invoice"],
        pAlamat: json["p_alamat"],
        pTanggalTransaksi: DateTime.parse(json["p_tanggal_transaksi"]),
        pIdStatusTransaksi: json["p_id_status_transaksi"],
        pStatusTransaksi: json["p_status_transaksi"],
      );

  Map<String, dynamic> toJson() => {
        "p_id_transaksi": pIdTransaksi,
        "p_nomor_invoice": pNomorInvoice,
        "p_alamat": pAlamat,
        "p_tanggal_transaksi": pTanggalTransaksi.toIso8601String(),
        "p_id_status_transaksi": pIdStatusTransaksi,
      };
}
