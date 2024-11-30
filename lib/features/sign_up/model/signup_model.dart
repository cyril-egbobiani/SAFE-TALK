class SignupModel {
  String? message;
  // String? token;
  String? username;
  String? password;

  SignupModel({
    this.message,
    // this.token,
    this.username,
    this.password,
  });

  SignupModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password; // Fixed typo
    return data;
  }

  @override
  String toString() {
    return 'SignupModel(message: $message, )';
  }
}
