import 'package:cloud_firestore/cloud_firestore.dart';

class ContentModel {
  String contentId;
  String title;
  String url;
  String type;
  String description;
  DateTime createdAt;
  int likes;
  List<String> imageUrls;

  ContentModel({
    required this.contentId,
    required this.title,
    required this.url,
    required this.type,
    this.description = '',
    required this.createdAt,
    this.likes = 0,
    this.imageUrls = const [], // Default empty list for imageUrls
  });

  // Convert Firestore document to Content instance
  factory ContentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ContentModel(
      contentId: doc.id,
      title: data['title'] ?? '',
      url: data['url'] ?? '',
      type: data['type'] ?? '',
      description: data['description'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      likes: data['likes'] ?? 0,
      imageUrls: data.containsKey('imageUrls') ? List<String>.from(data['imageUrls']) : [],
    );
  }

  // Convert Content instance to a Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'url': url,
      'type': type,
      'description': description,
      'createdAt': createdAt,
      'likes': likes,
      'imageUrls': imageUrls, // Add imageUrls here
    };
  }
}
