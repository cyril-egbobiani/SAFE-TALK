import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:safetalk/features/home/controller/home_controller.dart';
import 'package:safetalk/features/home/repository/home_repository.dart';
import 'package:safetalk/features/home/service/home_service.dart';
import 'package:safetalk/features/login/controller/login_controller.dart';
import 'package:safetalk/features/login/repository/login_repository.dart';
import 'package:safetalk/features/login/service/login_service.dart';
import 'package:safetalk/features/sign_up/controller/signup_controller.dart';
import 'package:safetalk/features/sign_up/repository/signup_repository.dart';
import 'package:safetalk/features/sign_up/service/signup_service.dart';
import 'package:safetalk/helpers/functions/dio_client.dart';
import 'package:safetalk/helpers/services/secure_storage_service.dart';

import '../services/storage_service.dart';

GetIt getIt = GetIt.instance;
Future<void> apiServiceLocator() async {
  try {
    // Register Dio first
    debugPrint('Before registering Dio');
    getIt.registerSingleton<Dio>(Dio());
    debugPrint('Dio registered');

    getIt.registerSingleton<StorageService>(StorageService());
    debugPrint('Storage Service registered');

    getIt.registerSingleton<SecureStorageService>(SecureStorageService());
    debugPrint('Secure Storage Service registered');

    getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));
    debugPrint('DioClient registered');

// =================================== SIGN UP =============================

    debugPrint('Registering SignupService');
    getIt.registerSingleton<SignupService>(
        SignupService(dioClient: getIt<DioClient>()));

    debugPrint('Registering SignupRepository');
    getIt.registerSingleton<SignupRepository>(
        SignupRepository(getIt<SignupService>()));

    debugPrint('Registering SignupController');
    getIt.registerSingleton<SignupController>(SignupController());

// =================================== LOG IN =============================

    debugPrint('Registering LoginService');
    getIt.registerSingleton<LoginService>(
        LoginService(dioClient: getIt<DioClient>()));

    debugPrint('Registering LoginRepository');
    getIt.registerSingleton<LoginRepository>(
        LoginRepository(getIt<LoginService>()));

    debugPrint('Registering LoginController');
    getIt.registerSingleton<LoginController>(LoginController());

// =================================== HOMEN =============================

    debugPrint('Registering HomeService');
    getIt.registerSingleton<HomeService>(
        HomeService(dioClient: getIt<DioClient>()));

    debugPrint('Registering HomeRepository');
    getIt.registerSingleton<HomeRepository>(
        HomeRepository(getIt<HomeService>()));

    debugPrint('Registering HomeController');
    getIt.registerSingleton<HomeController>(HomeController());
  } catch (e) {
    debugPrint('Error during registration: $e');
  }
}
