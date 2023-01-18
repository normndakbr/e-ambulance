import 'dart:convert';

class BerandaRes {
  late int status;
  late String message;
  late Data? data;

  BerandaRes({
    required this.status,
    required this.message,
    this.data,
  });

  factory BerandaRes.createHistoryRes(Map<String, dynamic> json) {
    var response;
    if (json['status'] == 200) {
      response = BerandaRes(
        status: json['status'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );
    } else {
      response = BerandaRes(
        status: json['status'],
        message: json['message'],
      );
    }

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
  late String pNamaLengkap;
  late String pAlamat;
  late String pNomorTelepon;
  late DateTime pTanggalTransaksi;
  late String pIdStatusTransaksi;
  late String pKategoriAmbulance;
  late String pNomorPlat;
  late String pNomorInvoice;
  late String pIdSupirDetail;
  late String pIdSupirDetail2;

  Data({
    pIdTransaksi,
    pNamaLengkap,
    pAlamat,
    pNomorTelepon,
    pTanggalTransaksi,
    pIdStatusTransaksi,
    pKategoriAmbulance,
    pNomorPlat,
    pNomorInvoice,
    pIdSupirDetail,
    pIdSupirDetail2,
  });

  Data.fromJson(Map<String, dynamic> json) {
    pIdTransaksi = json["p_id_transaksi"];
    pNamaLengkap = json['p_nama_lengkap'];
    pAlamat = json["p_alamat"];
    pNomorTelepon = json['p_nomor_telepon'];
    pTanggalTransaksi = DateTime.parse(json["p_tanggal_transaksi"]);
    pIdStatusTransaksi = json["p_id_status_transaksi"];
    pKategoriAmbulance = json["p_kategori_ambulance"];
    pNomorPlat = json["p_nomor_plat"];
    pNomorInvoice = json["p_nomor_invoice"];
    pIdSupirDetail = json["p_id_supir_detail"];
    pIdSupirDetail2 =
        json["p_id_supir_detail_2"] == null ? "0" : json["p_id_supir_detail_2"];
  }

  Map<String, dynamic> toJson() => {
        "p_id_transaksi": pIdTransaksi,
        "p_nama_lengkap": pNamaLengkap,
        "p_alamat": pAlamat,
        "p_nomor_telepon": pNomorTelepon,
        "p_tanggal_transaksi": pTanggalTransaksi.toIso8601String(),
        "p_id_status_transaksi": pIdStatusTransaksi,
        "p_kategori_ambulance": pKategoriAmbulance,
        "p_nomor_plat": pNomorPlat,
        "p_nomor_invoice": pNomorInvoice,
        "p_id_supir_detail": pIdSupirDetail,
        "p_id_supir_detail_2": pIdSupirDetail2,
      };
}

class BerandaUpdateRes {
  late int status;
  late String message;

  BerandaUpdateRes({
    required this.status,
    required this.message,
  });

  factory BerandaUpdateRes.createBerandaRes(Map<String, dynamic> json) {
    var response = BerandaUpdateRes(
      status: json['status'],
      message: json['message'],
    );

    return response;
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
