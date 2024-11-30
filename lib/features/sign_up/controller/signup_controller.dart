import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/sign_up/model/signup_model.dart';
// import 'package:dio/dio.dart';

// import 'package:safetalk/features/sign_up/model/signup_model.dart';
import 'package:safetalk/features/sign_up/repository/signup_repository.dart';
import 'package:safetalk/helpers/functions/api_service_locator.dart';
import 'package:safetalk/helpers/functions/navigation.dart';
// import 'package:safetalk/helpers/functions/navigation.dart';
// import 'package:safetalk/helpers/services/auth_service/auth_repo_impl.dart';
// import 'package:safetalk/helpers/services/auth_service/auth_service.dart';
import 'package:safetalk/helpers/services/storage_service.dart';
// import 'package:safetalk/helpers/services/storage_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final StorageService _storage = StorageService();
  final signupRepository = getIt.get<SignupRepository>();

  final StorageService _storageService = StorageService();

  // final AuthService _authService = AuthService(AuthRepositoryImplementation());

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    debugDNSLookup();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  //=============================================== UI VALIDATION

  bool _validateForm() {
    if (usernameController.text.isEmpty || usernameController.text.length < 3) {
      Get.snackbar(
        "Validation Error",
        "Username must be at least 3 characters",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      Get.snackbar(
        "Validation Error",
        "Password must be at least 6 characters",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Validation Error",
        "Passwords do not match",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  //====================================================== SIGN UP

  Future<void> signUp() async {
    if (_validateForm()) {
      isLoading.value = true;

      // final prefs = await SharedPreferences.getInstance();

      // var res = await _authService.register(
      //     usernameController.text, passwordController.text);
      // if (res.statusCode == 200) {
      //   isLoading.value = false;

      //   await prefs.setString('username', usernameController.text.trim());
      //   await prefs.setString('password', passwordController.text.trim());
      //   push(page: "/BottomNavBar");
      //   debugPrint('Sign-Up Successful');
      // } else {
      //   isLoading.value = false;

      //   debugPrint('Sign-Up failed');
      // }

      try {
        var addUserData = SignupModel(
            username: usernameController.text,
            password: passwordController.text);
        var result = await signupRepository.addUser(addUserData: addUserData);
        // if (result.token != '') {
        //   isLoading.value = false;
        //   // await _storage.saveString('token', result.token!);
        //   await _storage.saveString('username', usernameController.text);
        //   await _storage.saveString('password', passwordController.text);
        //   Get.snackbar("Success", "User successfully logged in!",
        //       backgroundColor: Colors.green, colorText: Colors.white);
        //   push(
        //     page: '/BottomNavBar',
        //   );
        // }
        if (result.message != "") {
          isLoading.value = false;
          _storageService.saveBoolean('isLoggedIn', true);
          await _storage.saveString('username', usernameController.text);
          await _storage.saveString('password', passwordController.text);
          push(page: "/BottomNavBar");
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void debugDNSLookup() async {
    try {
      final results =
          await InternetAddress.lookup('safe-talk-backend.onrender.com');
      for (var result in results) {
        debugPrint(
            '==============================IP address: ${result.address}');
      }
    } on SocketException catch (e) {
      debugPrint(
          '=================================Failed to lookup DNS: ${e.message}');
    }
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:safetalk/helpers/functions/navigation.dart';

// class SignupController extends GetxController {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final Rx<User?> firebaseUser = Rx<User?>(null); // Consider using firebaseUser
//   final RxBool isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     firebaseUser.bindStream(_firebaseAuth.authStateChanges());
//   }

//   Future<void> anonymousLogin() async {
//     isLoading.value = true;
//     await _firebaseAuth.signInAnonymously();

//     // Navigate to the login page after successful anonymous login
//     pushReplacement(page: '/Login');

//     // Get.snackbar(
//     //   'Success🙌',
//     //   'You have logged in anonymously!',
//     //   snackPosition: SnackPosition.TOP,
//     //   backgroundColor: primary,
//     //   colorText: Colors.white,
//     //   duration: const Duration(milliseconds: 1700),
//     // );
//     // } catch (e) {
//     //   isLoading.value = false;
//     //   Get.snackbar(
//     //     'Error',
//     //     'An error occurred. Please try again later.',
//     //     snackPosition: SnackPosition.TOP,
//     //     backgroundColor: Colors.red,
//     //     colorText: Colors.white,
//     //   );
//     //   debugPrint('Error with anonymous login: $e');
//     // }
//   }

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
// }
