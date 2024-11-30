// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:safetalk/helpers/services/auth_service/auth_repo_impl.dart';

class AuthService {
  final AuthRepositoryImplementation impl;
  AuthService(this.impl);

  Future<Response> login(String username, String password) async {
    return await impl.logIn(username, password);
  }

  Future register( String username, String password) async {
    return await impl.register( username, password);
  }
}
