class LoginModel {
  String? message;
  String? token;
  String? username;
  String? password;

  LoginModel({
    this.message,
    this.token,
    this.username,
    this.password,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password; // Fixed typo
    data['token'] = token; // Fixed typo

    return data;
  }

  @override
  String toString() {
    return 'SignupModel(message: $message, token: $token )';
  }
}
