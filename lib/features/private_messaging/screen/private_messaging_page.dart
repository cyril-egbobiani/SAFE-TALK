// import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:get/get.dart';
// import 'package:safetalk/features/private_messaging/controller/private_messaging_controller.dart';
  
// class PrivateMessagingPage extends StatelessWidget {
//   final  PrivateMessagingController privateMessagingController = Get.put(PrivateMessagingController());
//   final types.User user = types.User(id: 'senderId', firstName: 'User');

//   // PrivateMessagingPage({super.key});  // Customize user details

//   PrivateMessagingPage({required String chatId}) {
//     privateMessagingController.fetchMessages(chatId, user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chat')),
//       body: Obx(() {
//         return Chat(
//           messages: privateMessagingController.chatMessages,
//           onSendPressed: (types.PartialText message) {
//             privateMessagingController.sendMessage(
//               'chatId',  // Replace with actual chat ID
//               user.id,
//               message.text,
//             );
//           },
//           user: user,
//         );
//       }),
//     );
//   }
// }
