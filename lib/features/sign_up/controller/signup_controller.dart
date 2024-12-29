import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/sign_up/model/signup_model.dart';
import 'package:safetalk/features/sign_up/repository/signup_repository.dart';
import 'package:safetalk/helpers/functions/api_service_locator.dart';
import 'package:safetalk/helpers/functions/navigation.dart';
import 'package:safetalk/helpers/services/storage_service.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final StorageService _storage = StorageService();
  final signupRepository = getIt.get<SignupRepository>();

  final StorageService _storageService = StorageService();

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

      try {
        var addUserData = SignupModel(
            username: usernameController.text,
            password: passwordController.text);
        var result = await signupRepository.addUser(addUserData: addUserData);
        if (result.message != "") {
          isLoading.value = false;
          _storageService.saveBoolean('isLoggedIn', true);
          await _storage.saveString('username', usernameController.text);
          await _storage.saveString('password', passwordController.text);
          pushReplacement(page: "/Login");
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
