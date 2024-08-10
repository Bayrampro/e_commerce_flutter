import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/repositories/auth_token/auth_token.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(
    this.authTokenRepository,
    this.productsApiClient,
  );

  final AuthTokenInterface authTokenRepository;
  final ProductsApiClient productsApiClient;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokens = await authTokenRepository.getTokens();
    final accesToken = tokens['access_token'];

    if (accesToken != null) {
      options.headers['Authorization'] = 'Bearer $accesToken';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      log(err.response.toString());
      final tokens = await authTokenRepository.getTokens();
      final refreshToken = tokens['refresh_token'];
      log(refreshToken ?? '');

      if (refreshToken != null) {
        try {
          final response =
              await productsApiClient.refreshToken({'refresh': refreshToken});
          await authTokenRepository.saveTokens(
            response.accessToken,
            response.refreshToken,
          );

          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer ${response.accessToken}';

          final newResponse = await Dio().fetch(options);
          return handler.resolve(newResponse);
        } catch (e) {
          log(e.toString());
          return handler.reject(err);
        }
      }
    }

    return handler.reject(err);
  }
}
