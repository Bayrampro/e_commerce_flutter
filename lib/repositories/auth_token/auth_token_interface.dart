abstract interface class AuthTokenInterface {
  Future<void> saveTokens(String accessToken, String refreshToken);
  Future<void> setIsUserCreate(bool value);
  Future<void> setIsReset(bool value);
  Future<Map<String, String?>> getTokens();
  Future<void> deleteTokens();
  bool? get isAuthenticated;
  bool? get isUserCreated;
  bool? get isReset;
}
