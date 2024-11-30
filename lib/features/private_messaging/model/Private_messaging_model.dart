import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class PrivateMessagingModel {
  String senderId;
  String content;
  DateTime createdAt;

  PrivateMessagingModel({
    required this.senderId,
    required this.content,
    required this.createdAt,
  });

  // Create a Message from Firestore data
  factory PrivateMessagingModel.fromFirestore(Map<String, dynamic> data) {
    return PrivateMessagingModel(
      senderId: data['senderId'],
      content: data['content'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Convert a Message to Firestore format
  Map<String, dynamic> toFirestore() {
    return {
      'senderId': senderId,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // Convert to flutter_chat_types TextMessage for chat UI
  types.TextMessage toTextMessage(types.User user) {
    return types.TextMessage(
      author: user,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: content,
      createdAt: createdAt.millisecondsSinceEpoch,
    );
  }
}
