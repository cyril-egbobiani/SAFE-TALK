//  import 'package:get/get.dart';
// import 'package:safetalk/features/post/model/post_model.dart';

// class PostController extends GetxController {
//   // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   var posts = <PostModel>[].obs;

//   @override
//   void onInit() {
//     // fetchPosts();
//     super.onInit();
//   }

//   // void fetchPosts() async {
//   //   QuerySnapshot snapshot = await _firestore.collection('posts').get();
//   //   posts.value = snapshot.docs.map((doc) => PostModel.fromFirestore(doc)).toList();
//   // }

//   // Future<void> addPost(String content) async {
//   //   await _firestore.collection('posts').add({
//   //     'content': content,
//   //     'upvotes': 0,
//   //     'downvotes': 0,
//   //     'createdAt': FieldValue.serverTimestamp(),
//   //     'comments': [],
//   //   });
//   //   fetchPosts();
//   // }

//   // Future<void> upvotePost(String postId) async {
//   //   await _firestore.collection('posts').doc(postId).update({
//   //     'upvotes': FieldValue.increment(1),
//   //   });
//   //   fetchPosts();
//   // }

//   // Future<void> downvotePost(String postId) async {
//   //   await _firestore.collection('posts').doc(postId).update({
//   //     'downvotes': FieldValue.increment(1),
//   //   });
//   //   fetchPosts();
//   // }

//   // Future<void> addComment(String postId, String commentText) async {
//   //   await _firestore.collection('posts').doc(postId).update({
//   //     'comments': FieldValue.arrayUnion([
//   //       {'text': commentText, 'createdAt': FieldValue.serverTimestamp()}
//   //     ]),
//   //   });
//   //   fetchPosts();
//   // }
// }
