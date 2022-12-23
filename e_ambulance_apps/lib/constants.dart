class ApiConstants {
  // static String baseUrl = 'https://jsonplaceholder.typicode.com';
  // static String usersEndpoint = '/users';
  static String baseUrl = 'http://e-ambulance.isale.web.id/api';

  // login
  static String loginEndpoint = '/login';

  // read transaksi
  static String readTransaksiEndpoint = '/id_supir/id_status_transaksi';

  // read history
  static String readHistoryEndpoint =
      '/read_history/id_transaksi/id_transaksi2/id_transaksi3';

  // update transaksi
  static String updateTransaksiEndpoint = '/update_transaksi';

  // filter transaksi
  static String filterTransaksiEndpoint =
      '/read_transaksi/id_supir/id_status_transaksi';

  // send lat long
  static String sendLatLongEndpoint = '/send_lat_long';
}
