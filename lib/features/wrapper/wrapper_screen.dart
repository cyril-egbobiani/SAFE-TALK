import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import 'package:safetalk/features/wrapper/wrapper_controller.dart';
import 'package:safetalk/helpers/constants/color.dart';

class WrapperScreen extends StatelessWidget {
  WrapperScreen({super.key});
  final WrapperController wrapperController = Get.put(WrapperController());
   static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 180.h,
          ),
          Center(
            child: Image.asset(
              "assets/logo/Key.png",
              width: 200.w,
              height: 200.h,
            ),
          ),
          Image.asset(
            'assets/logo/SafeTalk.png',
            width: 200.w,
            height: 200.h,
          ),
        ],
      )),
    );
  }
}
