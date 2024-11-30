// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeModel {
  final String? message;
  final String? content;
  final String? category;
  final String? token;
  final String? voteType;
  final String? comments;
  final String? createdAt;
  final String? updatedAt;

  HomeModel({
    this.message,
    this.content,
    this.category,
    this.token,
    this.voteType,
    this.comments,
    this.createdAt,
    this.updatedAt,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      message: json['message'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'category': category,
      'token': token,
      'voteTypes': voteType,
      'comments': ['Nice post!', 'I agree'],
      "createdAt": createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return 'HomeModel(message: $message, token: $token )';
  }
}
