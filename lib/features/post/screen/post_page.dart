// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:safetalk/features/login/view/content_input_modal.dart';
// import 'package:safetalk/features/post/controller/post_controller.dart';
// import 'package:safetalk/helpers/constants/color.dart';
// import 'package:safetalk/helpers/functions/navigation.dart';

// class PostPage extends StatelessWidget {
//   static const String path = '/Post';

//   final PostController postController = Get.put(PostController());

//   PostPage({super.key});

//   final work = ["vbvuwu", "nscu", "bsvvjhac", "bavBa", "bvVWV"];

//   final List<Map<String, dynamic>> comments = List.generate(
//     10,
//     (index) => {
//       'username': 'Q7tyw$index',
//       'comment':
//           'Lorem ipsum dolor sit amet consectetur. Sagittis ultrices vitae rhoncus egestas tellus leo. Scelerisque faucibus feugiat purus ut placerat blandit non viverra. Eu eu aliquet in mattis gravida sed sed.',
//       'likes': 412 + index,
//       'replies': 56 - index,
//     },
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Popular Topics'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             push(page: '/BottomNavBar');
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryColor,
//         focusColor: Colors.white,
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             isScrollControlled: true,
//             builder: (context) => ContentInputModal(),
//           );
//         },
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//         //     floatingActionButton: FloatingActionButton(
//   //       onPressed: () => postController.addPost("Sample post content"),
//   //       child: const Icon(Icons.add),
//   //     ),

//       body: ListView.builder(
//         itemCount: comments.length,
//         itemBuilder: (context, index) {
//           final comment = comments[index];
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade300),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         // CircleAvatar(
//                         //   radius: 20,
//                         //   backgroundImage: NetworkImage(
//                         //       'https://via.placeholder.com/150'), // Dummy profile image
//                         // ),
//                         const SizedBox(width: 12),
//                         Text(
//                           comment['username'],
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       comment['comment'],
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.thumb_up_alt_outlined),
//                               onPressed: () {},
//                             ),
//                             Text('${comment['likes']}'),
//                             const SizedBox(width: 16),
//                             IconButton(
//                               icon: const Icon(Icons.chat_bubble_outline),
//                               onPressed: () {},
//                             ),
//                             Text('${comment['replies']}'),
//                           ],
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text('Reply'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(title: const Text('Posts')),
//   //     body: Obx(() {
//   //       // if (postController.posts.isEmpty) {
//   //       //   return const Center(child: Text('info')

//   //       //       //     CircularProgressIndicator(
//   //       //       //   color: primaryColor,
//   //       //       // )
//   //       //       );
//   //       // }
//   //       return ListView.builder(
//   //         itemCount: work.length,
//   //         itemBuilder: (context, index) {
//   //           // final post = postController.posts[index];
//   //           return ListTile(
//   //             title: Text(post.content),
//   //             subtitle: Row(
//   //               children: [
//   //                 IconButton(
//   //                   icon: const Icon(Icons.thumb_up),
//   //                   onPressed: () => postController.upvotePost(post.postId),
//   //                 ),
//   //                 Text('${post.upvotes}'),
//   //                 IconButton(
//   //                   icon: const Icon(Icons.thumb_down),
//   //                   onPressed: () => postController.downvotePost(post.postId),
//   //                 ),
//   //                 Text('${post.downvotes}'),
//   //               ],
//   //             ),
//   //           );
//   //         },
//   //       );
//   //     }),
//   //     floatingActionButton: FloatingActionButton(
//   //       onPressed: () => postController.addPost("Sample post content"),
//   //       child: const Icon(Icons.add),
//   //     ),
//   //   );
//   // }
// }
