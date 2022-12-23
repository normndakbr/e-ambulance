class UserLogin {
  late int status;
  late String message;
  late Data data;

  UserLogin({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserLogin.createUserLogin(Map<String, dynamic> json) {
    return UserLogin(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  late String pIdTransaksi;
  late String pNomorInvoice;
  late String pNomorRegistrasi;
  late String pNomorSuratTugas;
  late String pLinkTracking;
  late String pAlamat;
  late String pJarak;
  late String pLatitudeTujuan;
  late String pLongitudeTujuan;
  late DateTime pTanggalTransaksi;
  late String pFotoMaps;
  late String pIdSupirDetail;
  late String pIdSupirDetail2;
  late String pIdStatusTransaksi;
  late String pIdAmbulance;
  late String pKategoriAmbulance;
  late String pJenisKendaraan;
  late String pIdWilayah;
  late String pIdUserNakes;
  late String pIdPasienDetail;
  late String pIdPembayaran;
  late String pTarifPembayaran;
  late DateTime pTanggalPembayaran;
  late String pKodeTindakan;
  late String pIdStatusPembayaran;
  late String pIdUserKasir;
  late String pMetodePembayaran;
  late String pNamaLengkap;
  late String pJenisKelamin;
  late String pNamaRuanganMedik;
  late String pNomorRekamMedik;
  late String pNomorKamar;
  late String pGolonganPasien;
  late String pNomorTelepon;

  Data({
    pIdTransaksi,
    pNomorInvoice,
    pNomorRegistrasi,
    pNomorSuratTugas,
    pLinkTracking,
    pAlamat,
    pJarak,
    pLatitudeTujuan,
    pLongitudeTujuan,
    pTanggalTransaksi,
    pFotoMaps,
    pIdSupirDetail,
    pIdSupirDetail2,
    pIdStatusTransaksi,
    pIdAmbulance,
    pKategoriAmbulance,
    pJenisKendaraan,
    pIdWilayah,
    pIdUserNakes,
    pIdPasienDetail,
    pIdPembayaran,
    pTarifPembayaran,
    pTanggalPembayaran,
    pKodeTindakan,
    pIdStatusPembayaran,
    pIdUserKasir,
    pMetodePembayaran,
    pNamaLengkap,
    pJenisKelamin,
    pNamaRuanganMedik,
    pNomorRekamMedik,
    pNomorKamar,
    pGolonganPasien,
    pNomorTelepon,
  });

  Data.fromJson(Map<String, dynamic> json) {
    pIdTransaksi = json["p_id_transaksi"];
    pNomorInvoice = json["p_nomor_invoice"];
    pNomorRegistrasi = json["p_nomor_registrasi"];
    pNomorSuratTugas = json["p_nomor_surat_tugas"];
    pLinkTracking = json["p_link_tracking"];
    pAlamat = json["p_alamat"];
    pJarak = json["p_jarak"];
    pLatitudeTujuan = json["p_latitude_tujuan"];
    pLongitudeTujuan = json["p_longitude_tujuan"];
    pTanggalTransaksi = DateTime.parse(json["p_tanggal_transaksi"]);
    pFotoMaps = json["p_foto_maps"];
    pIdSupirDetail = json["p_id_supir_detail"];
    pIdSupirDetail2 = json["p_id_supir_detail_2"];
    pIdStatusTransaksi = json["p_id_status_transaksi"];
    pIdAmbulance = json["p_id_ambulance"];
    pKategoriAmbulance = json["p_kategori_ambulance"];
    pJenisKendaraan = json["p_jenis_kendaraan"];
    pIdWilayah = json["p_id_wilayah"];
    pIdUserNakes = json["p_id_user_nakes"];
    pIdPasienDetail = json["p_id_pasien_detail"];
    pIdPembayaran = json["p_id_pembayaran"];
    pTarifPembayaran = json["p_tarif_pembayaran"];
    pTanggalPembayaran = DateTime.parse(json["p_tanggal_pembayaran"]);
    pKodeTindakan = json["p_kode_tindakan"];
    pIdStatusPembayaran = json["p_id_status_pembayaran"];
    pIdUserKasir = json["p_id_user_kasir"];
    pMetodePembayaran = json["p_metode_pembayaran"];
    pNamaLengkap = json["p_nama_lengkap"];
    pJenisKelamin = json["p_jenis_kelamin"];
    pNamaRuanganMedik = json["p_nama_ruangan_medik"];
    pNomorRekamMedik = json["p_nomor_rekam_medik"];
    pNomorKamar = json["p_nomor_kamar"];
    pGolonganPasien = json["p_golongan_pasien"];
    pNomorTelepon = json["p_nomor_telepon"];
  }
}
