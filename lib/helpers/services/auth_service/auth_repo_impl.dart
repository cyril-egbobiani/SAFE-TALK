import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:safetalk/helpers/services/auth_service/auth_repository.dart';

import '../../functions/api.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final Api _api = Api(Dio());
  @override
  logIn(String username, String password) async {
    debugPrint('$username///$password');
    try {
      return await _api.dio.post(
        '/auth/login',
        data: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
    } on DioException catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  register(String username, String password) async {
    // debugPrint(email);
    try {
      return await _api.dio.post('/auth/login',
          data: jsonEncode({'username': username, 'password': password}));
    } on DioException catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  updateProfile(Map<String, dynamic> data) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  // @override
  // register(Map<String, dynamic> payload) async {
  //   try {
  //     return await _api.dio.post('auth/login', data: payload);
  //   } on DioException catch (e) {
  //     debugPrint('$e');
  //   }
  // }

  // @override
  // updateProfile(Map<String, dynamic> data) async {
  //   try {

  //   } catch (e) {

  //   }
  // }
}
