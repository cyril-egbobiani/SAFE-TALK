import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/login/controller/login_controller.dart';
import 'package:safetalk/helpers/constants/color.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const String path = '/Login';

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Login",
            style: TextStyle(
                fontSize: 24.sp,
                fontFamily: "Poppins-Bold",
                color: primaryColor),
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            width: 326.w,
            child: Text(
              "Create your account to connect with peers, find support, and share experiences—all while staying anonymous.",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Poppins-Regular",
                  color: subtextColor),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          //  =============================================================== USERNAME
          TextFormField(
            controller: loginController.usernameController,
            decoration: InputDecoration(
              labelText: "Username",
              labelStyle:
                  TextStyle(fontFamily: "Poppins-Regular", fontSize: 16.sp),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: Colors.grey, width: 1)),
            ),
          ),
          SizedBox(height: 16.h),

          //=============================================================== PASSWORD
          TextFormField(
            controller: loginController.passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle:
                  TextStyle(fontFamily: "Poppins-Regular", fontSize: 16.sp),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
            ),
            obscureText: true,
          ),
          // SizedBox(height: 16.h),

          // //=============================================================== CONFIRM PASSWORD
          // TextFormField(
          //   controller: loginController.confirmPasswordController,
          //   decoration: InputDecoration(
          //     labelText: "Confirm Password",
          //     labelStyle:
          //         TextStyle(fontFamily: "Poppins-Regular", fontSize: 16.sp),
          //     border:
          //         OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
          //   ),
          //   obscureText: true,
          // ),
          SizedBox(height: 42.h),

          //=============================================================== Submit Button
          Obx(() {
            return GestureDetector(
              onTap: loginController.isLoading.value
                  ? null
                  : loginController.login,
              child: Container(
                width: 327.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3), // Shadow color
                      offset: const Offset(0, 3), // Shadow position
                      blurRadius: 6, // Blur effect
                    ),
                  ],
                ),
                child: Center(
                    child: loginController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Sign up',
                            style: TextStyle(
                                fontFamily: "Poppins-SemiBold",
                                color: Colors.white,
                                fontSize: 16.h),
                          )),
              ),
            );
            //    SizedBox(
            //     height: 42.h,
            //   ),
            //   SizedBox(
            //     height: 24.h,
            //   ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Already have an account ?",
            //         style: TextStyle(
            //             fontFamily: "Poppins-Regular",
            //             fontSize: 14.sp,
            //             color: subtextColor),
            //       ),
            //       SizedBox(
            //         width: 5.w,
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           push(page: '/Login');
            //           debugPrint("hiiiiiiiiiii");
            //         },
            //         child: Text("Login",
            //             style: TextStyle(
            //                 fontSize: 14.sp,
            //                 fontFamily: "Poppins-SemiBold",
            //                 color: primaryColor)),
            //       )
            //     ],
            //   )
            // ],
          }),
        ])),
      ),
    )));
  }
}
