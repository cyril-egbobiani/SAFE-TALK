import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/home/model/home_model.dart';
import 'package:safetalk/features/home/repository/home_repository.dart';
import 'package:safetalk/helpers/functions/api_service_locator.dart';
import 'package:safetalk/helpers/services/storage_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var selectedTabIndex = 0.obs;

  final TextEditingController postContentController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  final StorageService _storageService = StorageService();

  final homeRepository = getIt.get<HomeRepository>();

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  var posts = <Map<String, dynamic>>[].obs; // Observable list of posts

  final Dio dio = Dio(); // Replace with your configured Dio instance

  @override
  void onInit() {
     super.onInit();
    fetchPosts(); // Fetch posts on initialization
  }

  // Fetch posts from API
  Future<void> fetchPosts() async {
    isLoading.value = true; // Set loading state to true
    try {
      final response = await dio.get(
          'https://safe-talk-backend.onrender.com/posts'); // Replace with your API endpoint
      if (response.statusCode == 200) {
        posts.value = List<Map<String, dynamic>>.from(response.data);
      } else {
        posts.value = [];
        Get.snackbar(
          'Error',
          'Failed to fetch posts. Status: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch posts: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Upvote a post
  Future<void> upvotePost(int index, bool isUpvote) async {
    final post = posts[index];
    final postId = post['_id'];
    final postToken = post['token'];

    debugPrint("=====================================POST ID IS $postId");
    debugPrint("=====================================POST TOKEN IS $postToken");

    final payload = {'voteType': 'upvote'};

    try {
      final response = await dio.post(
        'https://safe-talk-backend.onrender.com/votes/$postId/vote',
        data: payload,
      );

      if (response.statusCode == 200) {
        final updatedPost = response.data;

        posts[index] = updatedPost; // Update post in the observable list
        Get.snackbar(
          "Success",
          "Post successfully ${isUpvote ? 'liked' : 'disliked'}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to vote on post',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Error',
        'Failed to vote on post: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

// Downvote a post with toggle functionality
  Future<void> downvotePost(int index) async {
    final post = posts[index];
    final postId = post['_id'];
    final isDownvoted =
        post['votes']['isDownvoted'] ?? false; // Check if already downvoted
    final isUpvoted =
        post['votes']['isUpvoted'] ?? false; // Check if already upvoted

    // If already downvoted, we set payload to null to remove the downvote
    final payload = {'voteType': isDownvoted ? null : 'downvote'};

    try {
      // If currently upvoted, we need to remove the upvote first
      if (isUpvoted) {
        await upvotePost(index, false); // Call upvotePost to toggle the upvote
      }

      final response = await dio.post(
        'https://safe-talk-backend.onrender.com/votes/$postId/vote',
        data: payload,
      );

      if (response.statusCode == 200) {
        final updatedPost = response.data;

        // Update the post in the observable list
        posts[index] = updatedPost;
        Get.snackbar(
          "Success",
          isDownvoted ? "Dislike removed" : "Post disliked",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to update downvote',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Error',
        'Failed to downvote: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Toggle vote based on user action
  Future<void> toggleVote(int index, bool isUpvote) async {
    if (isUpvote) {
      await upvotePost(index, true);
    } else {
      await downvotePost(index);
    }
  }

  // Open comment section for a post
  void openCommentSection(int index) {
    final post = posts[index];

    Get.defaultDialog(
      title: "Comments",
      content: Column(
        children: [
          ...post['comments']
                  ?.map<Widget>((comment) => Text(comment))
                  ?.toList() ??
              [const Text('No comments yet')],
        ],
      ),
      textCancel: "Close",
    );
  }

  // Reply to a post
  void replyToPost(int index) {
    final post = posts[index];
    TextEditingController replyController = TextEditingController();

    Get.defaultDialog(
      title: "Reply to Post",
      content: Column(
        children: [
          TextField(
            controller: replyController,
            decoration: const InputDecoration(hintText: "Enter your reply..."),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              var postId = post['_id'];
              debugPrint(
                  '============================================================== POST ID: $postId');

              final reply = replyController.text.trim();

              if (reply.isNotEmpty) {
                try {
                  // Example payload
                  final payload = {
                    'content': reply,
                  };
                  // Assuming the post has an 'id' field

                  // Make the API call
                  final response = await dio.post(
                    'https://safe-talk-backend.onrender.com/posts/$postId/comment',
                    // Replace with your endpoint
                    data: payload,
                  );

                  // Check if the API call was successful
                  if (response.statusCode == 200) {
                    // Assuming the response contains the updated comments and commentCount
                    final updatedPost = response.data;

                    // Update the local post data
                    posts[index] = updatedPost;
                    Get.back(); // Close the dialog
                  } else {
                    Get.back(); // Close the dialog
                    // Handle API error
                    Get.snackbar(
                        "Error", "Failed to send reply. Please try again.");
                  }
                } catch (e) {
                  debugPrint(e.toString());
                  // Handle connection or other errors
                  Get.snackbar("Error", "An error occurred: $e");
                }
              }
            },
            child: const Text("Submitt"),
          ),
        ],
      ),
    );
  }

  // Create a new post
  Future<void> createPost() async {
    var token = _storageService.getString('token');

    final String content = postContentController.text.trim();
    final String category = categoryController.text.trim();

    if (content.isEmpty || category.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      var homeUserData = HomeModel(
        content: content,
        category: category,
        token: token.toString(),
      );
      var result = await homeRepository.createPost(homeUserData: homeUserData);

      if (result.message != '') {
        Get.snackbar("Success", '${result.message}',
            colorText: Colors.white, backgroundColor: Colors.greenAccent);
        await fetchPosts();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Delete a post
  Future<void> deletePost(String postId) async {
    try {
      final response = await dio.delete(
        'https://safe-talk-backend.onrender.com/posts/$postId',
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Post deleted successfully!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        fetchPosts(); // Refresh the posts list
      } else {
        Get.snackbar(
          "Error",
          "Failed to delete post. Try again later.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "An error occurred: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
