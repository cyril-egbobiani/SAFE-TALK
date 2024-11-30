import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/sign_up/controller/signup_controller.dart';
import 'package:safetalk/helpers/constants/color.dart';
import 'package:safetalk/helpers/functions/navigation.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  static const String path = '/Signup';

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign up",
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
                    controller: signupController.usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                          fontFamily: "Poppins-Regular", fontSize: 16.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  //=============================================================== PASSWORD
                  TextFormField(
                    controller: signupController.passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontFamily: "Poppins-Regular", fontSize: 16.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.h),

                  //=============================================================== CONFIRM PASSWORD
                  TextFormField(
                    controller: signupController.confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                          fontFamily: "Poppins-Regular", fontSize: 16.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 42.h),

                  //=============================================================== Submit Button
                  Obx(() {
                    return GestureDetector(
                      onTap: signupController.isLoading.value
                          ? null
                          : signupController.signUp,
                      child: Container(
                        width: 327.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  primaryColor.withOpacity(0.3), // Shadow color
                              offset: const Offset(0, 3), // Shadow position
                              blurRadius: 6, // Blur effect
                            ),
                          ],
                        ),
                        child: Center(
                            child: signupController.isLoading.value
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
                    // ElevatedButton(
                    //   onPressed: signupController.isLoading.value
                    //       ? null
                    //       : signupController.signUp,
                    //   child: signupController.isLoading.value
                    //       ? const CircularProgressIndicator(
                    //           color: Colors.white,
                    //         )
                    //       : const Text("Sign Up"),
                    // );
                  }),

                  // Obx(() {
                  //   return signupController.isLoading.value
                  //       ? Container(
                  //           width: 327.w,
                  //           height: 50.h,
                  //           decoration: BoxDecoration(
                  //             color: primaryColor,
                  //             borderRadius: BorderRadius.circular(10.r),
                  //           ),
                  //           child: const Center(
                  //             child: CircularProgressIndicator(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         )
                  //       : GestureDetector(
                  //           onTap: () async {
                  //             await signupController.anonymousLogin();
                  //           },
                  //           child: Container(
                  //             width: 327.w,
                  //             height: 50.h,
                  //             decoration: BoxDecoration(
                  //               color: primaryColor,
                  //               borderRadius: BorderRadius.circular(10.r),
                  //             ),
                  //             child: Center(
                  //               child: Text(
                  //                 "Sign in anonymously",
                  //                 style: TextStyle(
                  //                     fontSize: 14.sp,
                  //                     color: Colors.white,
                  //                     fontFamily: "Poppins-SemiBold"),
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  // })

                  //     // if (signupController.firebaseUser.value == null) {
                  //     //   // If no user is signed in, show sign-in option
                  //     //   return const Padding(
                  //     //     padding: EdgeInsets.all(16.0),
                  //     //     child: Column(
                  //     //       mainAxisAlignment: MainAxisAlignment.center,
                  //     //       children: [
                  //     //         Text('You are not signed in yet'),
                  //     //       ],
                  //     //     ),
                  //     //   );
                  //     // } else {
                  //     //   // If the user is signed in anonymously
                  //     //   return Column(
                  //     //     mainAxisAlignment: MainAxisAlignment.center,
                  //     //     children: [
                  //     //       Text(
                  //     //           'Signed in as: ${signupController.firebaseUser.value?.uid}'),
                  //     //       SizedBox(height: 20),
                  //     //       ElevatedButton(
                  //     //         onPressed: () {
                  //     //           signupController.signOut();
                  //     //         },
                  //     //         child: Text('Sign Out'),
                  //     //       ),
                  //     //     ],
                  //     //   );
                  //     // }
                  //   },

                  SizedBox(
                    height: 42.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                            fontFamily: "Poppins-Regular",
                            fontSize: 14.sp,
                            color: subtextColor),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          push(page: '/Login');
                          debugPrint("hiiiiiiiiiii");
                        },
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Poppins-SemiBold",
                                color: primaryColor)),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
