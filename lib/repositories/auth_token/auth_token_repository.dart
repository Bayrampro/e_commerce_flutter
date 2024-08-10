import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/repositories/auth_token/auth_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenRepository implements AuthTokenInterface {
  AuthTokenRepository({
    required this.prefs,
  });

  final SharedPreferences prefs;

  final accessTokenKey = Confidential.accessTokenKey.value;
  final refreshTokenKey = Confidential.refreshTokenKey.value;
  final isAuthenticatedKey = Confidential.isAuthenticatedKey.value;
  final isUserCreatedKey = Confidential.isUserCreatedKey.value;
  final isResetKey = Confidential.isResetPasswordKey.value;

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await prefs.setString(accessTokenKey, accessToken);
    await prefs.setString(refreshTokenKey, refreshToken);
    await prefs.setBool(isAuthenticatedKey, true);
  }

  @override
  Future<Map<String, String?>> getTokens() async {
    return {
      'access_token': prefs.getString(accessTokenKey),
      'refresh_token': prefs.getString(refreshTokenKey),
    };
  }

  @override
  Future<void> deleteTokens() async {
    await prefs.remove(accessTokenKey);
    await prefs.remove(refreshTokenKey);
    await prefs.setBool(isAuthenticatedKey, false);
    await prefs.setBool(isUserCreatedKey, false);
    await prefs.setBool(isResetKey, false);
  }

  @override
  bool? get isAuthenticated => prefs.getBool(isAuthenticatedKey);

  @override
  Future<void> setIsUserCreate(bool value) async {
    await prefs.setBool(isUserCreatedKey, value);
  }

  @override
  bool? get isUserCreated => prefs.getBool(isUserCreatedKey);

  @override
  Future<void> setIsReset(bool value) async {
    await prefs.setBool(isResetKey, value);
  }

  @override
  bool? get isReset => prefs.getBool(isResetKey);
}
