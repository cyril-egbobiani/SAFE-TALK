import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/categories/view/categories_page.dart';
import 'package:safetalk/features/home/controller/home_controller.dart';
import 'package:safetalk/features/login/controller/login_controller.dart';
import 'package:safetalk/helpers/constants/color.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

  final HomeController homeController = Get.put(HomeController());
  final LoginController loginController = Get.put(LoginController());

  final Dio dio = Dio(); // Instance of Dio for API calls

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: fabColor,
        focusColor: Colors.white,
        onPressed: () {
          _showPostInputModal(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildGreetingSection(),
          // _buildPostSectionTitle(),
          _buildPostList(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/logo/SafeTalk(1).svg",
            height: 14.h,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          SvgPicture.asset(
            "assets/logo/Frame 80.svg",
            height: 30.h,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTab('Popular Post', 0, secondaryColor),
          _buildTab('All Post', 1, Colors.black),
          GestureDetector(
            onTap: () => Get.to(CategoriesPage()),
            child: _buildCustomTab('Categories', primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, Color activeColor) {
    return Obx(
      () => GestureDetector(
        onTap: () => homeController.changeTab(index),
        child: Container(
          height: 35.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: homeController.selectedTabIndex.value == index
                ? activeColor
                : activeColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.transparent),
            boxShadow: homeController.selectedTabIndex.value == index
                ? [
                    BoxShadow(
                      color: activeColor.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: const Offset(0, 2),
                    )
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontFamily: 'Poppins-SemiBold'),
            ),
          ),
        ),
      ),
    );
  }

  //========================================================================= Bottom Sheet for Post Input
  void _showPostInputModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              16.0, 16.0, 16.0, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a Post",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: "Poppins-Bold",
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: homeController.postContentController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Post Content",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: homeController.categoryController,
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      homeController.createPost();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontFamily: 'Poppins-SemiBold',
                          fontSize: 14.sp,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      homeController.postContentController.clear();
                      homeController.categoryController.clear();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomTab(String label, Color color) {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
              fontFamily: 'Poppins-SemiBold'),
        ),
      ),
    );
  }

  Widget _buildPostList() {
    return Expanded(
      child: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (homeController.posts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/no-results.png",
                  height: 50.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'No Posts Available',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Poppins-SemiBold',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: homeController.posts.length,
          itemBuilder: (context, index) {
            final post = homeController.posts[index];
            // final isLiked = post['isLiked'] ?? false;
            // final likeCount = post['likeCount'] ?? 0;
            final commentCount = post['commentCount'] ?? 0;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['username'] ?? 'Anonymous',
                        style: TextStyle(
                          fontFamily: 'Poppins-SemiBold',
                          fontSize: 12.sp,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        post['content'] ?? 'No content',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post['category'] ?? 'General',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: primaryColor,
                              fontFamily: 'Poppins-SemiBold',
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/logo/likeIcon.svg",
                                  height: 20.h,
                                  width: 20.h,
                                ),
                                // Icon(Icons.thumb_up,
                                //     color: post['votes']['isUpvoted'] == true
                                //         ? Colors.blue
                                //         : Colors.grey),
                                onPressed: () =>
                                    homeController.toggleVote(index, true),
                              ),
                              Text(post['votes']['upvotes'].toString()),
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/logo/dislikeIcon.svg",
                                  height: 20.h,
                                  width: 20.h,
                                ),

                                // Icon(Icons.thumb_down,
                                //     color: post['votes']['isDownvoted'] == true
                                //         ? Colors.red
                                //         : Colors.grey),
                                onPressed: () =>
                                    homeController.toggleVote(index, false),
                              ),
                              Text(post['votes']['downvotes'].toString()),
                              const SizedBox(width: 8),
                              // Comment icon with comment count
                              IconButton(
                                onPressed: () {
                                  homeController.openCommentSection(index);
                                },
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.blue.shade400,
                                ),
                              ),
                              Text(
                                commentCount.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'Poppins-Regular',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Reply button
                      TextButton(
                        onPressed: () {
                          homeController.replyToPost(index);
                        },
                        child: Text(
                          'Reply',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: primaryColor,
                            fontFamily: 'Poppins-Bold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
