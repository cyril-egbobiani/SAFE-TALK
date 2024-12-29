// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:safetalk/features/private_messaging/model/Private_messaging_model.dart';
// import 'package:safetalk/helpers/services/encryption_service.dart';

// class PrivateMessagingController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final EncryptionService _encryptionService = EncryptionService();
//   RxList<types.Message> chatMessages = <types.Message>[].obs;

//   // Fetch messages between users in real-time
//   void fetchMessages(String chatId, types.User user) {
//     _firestore
//         .collection('chats/$chatId/messages')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .listen((snapshot) {
//       chatMessages.value = snapshot.docs.map((doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         data['content'] = _encryptionService.decryptMessage(data['content']);
//         final message = PrivateMessagingModel.fromFirestore(data);
//         return message.toTextMessage(user);
//       }).toList();
//     });
//   }

//   // Send a new message
//   Future<void> sendMessage(
//       String chatId, String senderId, String content) async {
//     final encryptedContent = _encryptionService.encryptMessage(content);
//     final message = PrivateMessagingModel(
//         senderId: senderId,
//         content: encryptedContent,
//         createdAt: DateTime.now());
//     await _firestore
//         .collection('chats/$chatId/messages')
//         .add(message.toFirestore());
//   }
// }
