import 'dart:convert';

class BerandaRes {
  late int status;
  late String message;
  late Data data;

  BerandaRes({
    required status,
    required message,
    required data,
  });

  factory BerandaRes.createHistoryRes(Map<String, dynamic> json) {
    var response = BerandaRes(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );

    return response;
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class Data {
  late String pIdTransaksi;
  late String pNomorInvoice;
  late String pAlamat;
  late DateTime pTanggalTransaksi;
  late String pIdStatusTransaksi;

  Data({
    pIdTransaksi,
    pNomorInvoice,
    pAlamat,
    pTanggalTransaksi,
    pIdStatusTransaksi,
  });

  Data.fromJson(Map<String, dynamic> json) {
    pIdTransaksi = json["p_id_transaksi"];
    pNomorInvoice = json["p_nomor_invoice"];
    pAlamat = json["p_alamat"];
    pTanggalTransaksi = DateTime.parse(json["p_tanggal_transaksi"]);
    pIdStatusTransaksi = json["p_id_status_transaksi"];
  }

  Map<String, dynamic> toJson() => {
        "p_id_transaksi": pIdTransaksi,
        "p_nomor_invoice": pNomorInvoice,
        "p_alamat": pAlamat,
        "p_tanggal_transaksi": pTanggalTransaksi.toIso8601String(),
        "p_id_status_transaksi": pIdStatusTransaksi,
      };
}
