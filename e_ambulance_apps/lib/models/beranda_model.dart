import 'dart:convert';

class BerandaRes {
  late int status;
  late String message;
  late Data data;

  BerandaRes({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BerandaRes.createHistoryRes(Map<String, dynamic> json) {
    var response = BerandaRes(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
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
  late String pNamaLengkap;
  late String pAlamat;
  late String pNomorTelepon;
  late DateTime pTanggalTransaksi;
  late String pIdStatusTransaksi;
  late String pKategoriAmbulance;
  late String pNomorPlat;
  late String pNomorInvoice;

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
      };
}
