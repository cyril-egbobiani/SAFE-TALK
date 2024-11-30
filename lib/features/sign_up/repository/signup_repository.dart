import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/sign_up/model/signup_model.dart';
import 'package:safetalk/helpers/functions/navigation.dart';

import '../service/signup_service.dart';

class SignupRepository {
  final SignupService signupService;

  SignupRepository(this.signupService);

  Future<SignupModel> addUser({required SignupModel addUserData}) async {
    try {
      final response =
          await signupService.addUser(signupModelData: addUserData);
      if (response.statusCode == 200) {
        debugPrint('USER ADDED SUCCESSFULLY');
        Get.snackbar("Success", "User successfully logged in!",
            backgroundColor: Colors.green, colorText: Colors.white);
        push(
          page: '/BottomNavBar',
        );
        var user = SignupModel.fromJson(response.data as Map<String, dynamic>);
        return user;
      } else {
        return SignupModel.fromJson({});
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      rethrow;
    }
  }
}
