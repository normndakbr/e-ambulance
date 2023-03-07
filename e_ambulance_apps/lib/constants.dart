class ApiConstants {
  static String baseUrl = 'http://e-ambulance.isale.web.id/api';
  // static String baseUrl = 'http://dev-rsmh.isale.web.id/api';
  static String id_status_transaksi = "e17b741e-46a8-1712-cdb6-1c010a473697";

  // login
  static String loginEndpoint = '/login';

  // read transaksi
  static String readTransaksiEndpoint = '/read_transaksi';

  // read history
  static String readHistoryEndpoint = '/read_history';

  // update status ambulance
  static String updateStatusAmbulance = '/update_status_ambulance';

  // update status sopir
  static String updateStatusSopir = '/update_status_sopir';

  // update transaksi
  static String updateStatusTransaksi = '/update_transaksi';

  // filter transaksi
  static String filterTransaksiEndpoint =
      '/read_transaksi/id_supir/id_status_transaksi';

  // send lat long
  static String sendLatLongEndpoint = '/send_lat_long';
}
