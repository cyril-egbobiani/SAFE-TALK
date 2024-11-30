import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
String authorId;
  String text;
  DateTime createdAt;

  CommentModel({
    required this.authorId,
    required this.text,
    required this.createdAt,
  });

  factory CommentModel.fromFirestore(Map<String, dynamic> data) {
    return CommentModel(
      authorId: data['authorId'] ?? '',
      text: data['text'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'authorId': authorId,
      'text': text,
      'createdAt': createdAt,
    };
  }}
