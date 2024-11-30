// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:safetalk/features/content_library/model/content_model.dart';

// class ContentController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   RxList<ContentModel> contentList = <ContentModel>[].obs;

//   @override
//   void onInit() {
//     fetchContent();
//     super.onInit();
//   }

//   // Fetch content in real-time
//   void fetchContent() {
//     _firestore
//         .collection('content')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .listen((snapshot) {
//       contentList.value =
//           snapshot.docs.map((doc) => ContentModel.fromFirestore(doc)).toList();
//     });
//   }

//   // Add new content to Firestore
//   Future<void> addContent(ContentModel content) async {
//     await _firestore.collection('content').add(content.toFirestore());
//   }

//   // Increment likes for a content item
//   Future<void> likeContent(String contentId) async {
//     final contentRef = _firestore.collection('content').doc(contentId);
//     await contentRef.update({'likes': FieldValue.increment(1)});
//   }

//   // Filter content by type (e.g., articles, videos)
//   List<ContentModel> filterContentByType(String type) {
//     return contentList.where((content) => content.type == type).toList();
//   }
// }
