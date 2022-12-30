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
      message: json['message'].toString(),
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  late String p_id_user;
  late String p_username;
  late String p_id_user_level;
  late String p_status_user;

  Data({
    p_id_user,
    p_username,
    p_id_user_level,
    p_status_user,
  });

  Data.fromJson(Map<String, dynamic> json) {
    p_id_user = json['p_id_user'];
    p_username = json['p_username'];
    p_id_user_level = json['p_id_user_level'];
    p_status_user = json['p_status_user'];
  }
}
