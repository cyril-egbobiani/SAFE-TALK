import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:safetalk/helpers/constants/color.dart';

class ContentInputModal extends StatelessWidget {
  // final ContentController contentController = Get.put(ContentController());

  const ContentInputModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0.w,
        right: 16.0.w,
        top: 16.0.h,
        bottom: MediaQuery.of(context).viewInsets.bottom * 1.15.h ,
       ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            // onChanged: (text) => contentController.postText.value = text,
            maxLines:
                null, // This allows the TextField to expand vertically as needed
            decoration: InputDecoration(
              hintText: "What's happening?",
              hintStyle:
                  TextStyle(fontFamily: "Poppins-SemiBold", fontSize: 14.sp),
              border: InputBorder.none,
            ),
          ),
          // if (contentController.selectedImages.isNotEmpty)
          //   SizedBox(
          //     height: 100.0,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: contentController.selectedImages.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.only(right: 8.0),
          //           child: Image.file(contentController.selectedImages[index],
          //               height: 100.0),
          //         );
          //       },
          //     ),
          //   ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(
              //   icon: const Icon(Icons.image),
              //   onPressed: contentController.pickImages,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     contentController.addContent(
              //         "sampleUserId"); // Replace with actual user ID
              //   },
              //   child: const Text("Post"),
              // ),
              GestureDetector(
                onTap: () {
                  // contentController.addContent(
                  //     "sampleUserId"); // Replace with actual user ID
                },
                child: Container(
                  height: 45.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5.r)),
                  // ignore: prefer_const_constructors
                  child: Center(
                    child: const Text(
                      "Post",
                      style: TextStyle(
                        fontFamily: "Poppins-SemiBold",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
