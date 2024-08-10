import 'dart:async';
import 'package:dio/dio.dart';
import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/features/eCommerceApp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interceptors/interceptors.dart';
import 'repositories/auth_token/auth_token.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final authTokenRepository = AuthTokenRepository(prefs: prefs);
  final tokens = await authTokenRepository.getTokens();
  print('Access Token: ${tokens['access_token']}');
  print('Refresh Token: ${tokens['refresh_token']}');
  final dio = Dio();
  final productsApiClient = ProductsApiClient(dio);
  dio.interceptors.add(AuthInterceptor(
    authTokenRepository,
    productsApiClient,
  ));
  runApp(ECommerceApp(
    prefs: prefs,
    dio: dio,
  ));
}
