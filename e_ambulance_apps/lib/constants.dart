class ApiConstants {
  // static String baseUrl = 'https://jsonplaceholder.typicode.com';
  // static String usersEndpoint = '/users';
  static String baseUrl = 'http://e-ambulance.isale.web.id/api';

  // login
  static String loginEndpoint = '/login';

  // read transaksi
  static String readTransaksiEndpoint = '/read_transaksi';

  static String id_status_transaksi = "e17b741e-46a8-1712-cdb6-1c010a473697";
  // read history
  static String readHistoryEndpoint = '/read_history';

  // update transaksi
  static String updateTransaksiEndpoint = '/update_transaksi';

  // filter transaksi
  static String filterTransaksiEndpoint =
      '/read_transaksi/id_supir/id_status_transaksi';

  // send lat long
  static String sendLatLongEndpoint = '/send_lat_long';
}