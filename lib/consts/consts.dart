// const baseUrl = 'https://eshop2024.pythonanywhere.com/api/v1';

enum Confidential {
  baseUrl(
    'http://127.0.0.1:8000/api/v1',
  ),
  accessTokenKey(
    'access_token',
  ),
  isAuthenticatedKey(
    'is_authenticated',
  ),
  refreshTokenKey(
    'refresh_token',
  ),
  isResetPasswordKey(
    'is_reset_password',
  ),
  isUserCreatedKey(
    'is_user_created',
  );

  const Confidential(this.value);

  final String value;
}
