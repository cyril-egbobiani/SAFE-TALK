
class Post {
  String username;
  String content;
  int upvotes;
  int replies;
  bool isLiked;
  List<String> comments;

  Post({
    required this.username,
    required this.content,
    this.upvotes = 0,
    this.replies = 0,
    this.isLiked = false,
    this.comments = const [],
  });
}








// class PostModel {
//   String postId;
//   String content;
//   String category;
//   bool anonymous;
//   int upvotes;
//   int downvotes;
//   DateTime createdAt;

//   PostModel({
//     required this.postId,
//     required this.content,
//     required this.category,
//     required this.anonymous,
//     this.upvotes = 0,
//     this.downvotes = 0,
//     required this.createdAt,
//   });

//   // Factory to create a PostModel from API response
//   factory PostModel.fromJson(Map<String, dynamic> json) {
//     return PostModel(
//       postId: json['id'] as String,
//       content: json['content'] as String,
//       category: json['category'] as String,
//       anonymous: json['anonymous'] as bool,
//       upvotes: json['upvotes'] ?? 0, // Default to 0 if not provided
//       downvotes: json['downvotes'] ?? 0, // Default to 0 if not provided
//       createdAt: DateTime.parse(json['createdAt'] as String),
//     );
//   }

//   // Converts the PostModel into a JSON-compatible map for API requests
//   Map<String, dynamic> toJson() {
//     return {
//       'content': content,
//       'category': category,
//       'anonymous': anonymous,
//     };
//   }
// }
