import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/repositories/auth_token/auth_token.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.productsApiClient,
    required this.authTokenRepository,
  }) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<VerifyEvent>(_onVerify);
    on<SignInEvent>(_onSignIn);
    on<RefreshTokenEvent>(_onRefreshToken);
    on<AppStartedEvent>(_onAppStarted);
    on<SignOutEvent>(_onSignOut);
    on<ResetPasswordRequest>(_onResetPasswordRequest);
    on<ResetPasswordConfirm>(_onResetPasswordConfirm);
    on<AuthWithGoogleEvent>(_onAuthGoogle);
  }

  final ProductsApiClient productsApiClient;
  final AuthTokenInterface authTokenRepository;
  Timer? _tokenRefreshTimer;

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      await authTokenRepository.setIsUserCreate(false);
      final requestBody = {
        'username': event.username,
        'email': event.email,
        'password': event.password,
        're_password': event.password2,
      };
      await productsApiClient.signUp(requestBody);
      await authTokenRepository.setIsUserCreate(true);
      emit(AuthAuthenticated());
      _startTokenRefreshTimer();
    } catch (e) {
      log(e.toString());
      emit(AuthError(error: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onVerify(VerifyEvent event, Emitter<AuthState> emit) async {
    try {
      final requestBody = {
        "code": event.verifyCode,
      };
      await productsApiClient.verify(requestBody);
      final response = await productsApiClient.signIn({
        'username': event.username,
        'password': event.password,
      });
      await authTokenRepository.saveTokens(
        response.accessToken,
        response.refreshToken,
      );
      emit(AuthAuthenticated());
      _startTokenRefreshTimer();
    } catch (e) {
      log(e.toString());
      emit(AuthError(error: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    try {
      final requestBody = {
        'username': event.username,
        'password': event.password,
      };
      final response = await productsApiClient.signIn(requestBody);
      await authTokenRepository.saveTokens(
        response.accessToken,
        response.refreshToken,
      );
      emit(AuthAuthenticated());
      _startTokenRefreshTimer();
    } catch (e) {
      emit(AuthError(error: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onResetPasswordRequest(
      ResetPasswordRequest event, Emitter<AuthState> emit) async {
    try {
      await authTokenRepository.setIsReset(false);
      final requestBody = {
        'username': event.username,
      };
      await productsApiClient.passwordResetRequest(requestBody);
      await authTokenRepository.setIsReset(true);
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthError(error: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onResetPasswordConfirm(
      ResetPasswordConfirm event, Emitter<AuthState> emit) async {
    try {
      final requestBody = {
        'username': event.username,
        'code': event.code,
        'new_password': event.newPassword,
      };
      await productsApiClient.passwordResetConfirm(requestBody);
      final response = await productsApiClient.signIn({
        'username': event.username,
        'password': event.newPassword,
      });
      await authTokenRepository.saveTokens(
        response.accessToken,
        response.refreshToken,
      );
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthError(error: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onRefreshToken(
      RefreshTokenEvent event, Emitter<AuthState> emit) async {
    final tokens = await authTokenRepository.getTokens();
    final refreshToken = tokens['refresh_token'];

    try {
      if (refreshToken != null) {
        final response = await productsApiClient.refreshToken({
          'refresh': refreshToken,
        });
        await authTokenRepository.saveTokens(
          response.accessToken,
          response.refreshToken,
        );
        log('Tokens refreshed: ${await authTokenRepository.getTokens()}');
        emit(AuthAuthenticated());
      } else {
        emit(const AuthError(error: "No refresh token available"));
      }
    } catch (e) {
      emit(AuthError(error: e));
    }
  }

  Future<void> _onAppStarted(
      AppStartedEvent event, Emitter<AuthState> emit) async {
    final tokens = await authTokenRepository.getTokens();
    log('Tokens on app start: $tokens');
    if (tokens['access_token'] != null && tokens['refresh_token'] != null) {
      emit(AuthAuthenticated());
      _startTokenRefreshTimer();
    } else {
      emit(AuthInitial());
    }
  }

  void _startTokenRefreshTimer() {
    _tokenRefreshTimer?.cancel();
    _tokenRefreshTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      add(RefreshTokenEvent());
    });
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      await authTokenRepository.deleteTokens();
      _tokenRefreshTimer?.cancel();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> _onAuthGoogle(
      AuthWithGoogleEvent event, Emitter<AuthState> emit) async {
    try {
      // final googleSignIn = GoogleSignIn();
      final googleSignIn = GoogleSignIn(
        clientId:
            '900056829709-nfljbe9gel13eueq37q5uisde8v5s5ak.apps.googleusercontent.com',
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final token = googleAuth.accessToken;
        final response = await productsApiClient.authWithGoogle({
          'token': token,
        });
        await authTokenRepository.saveTokens(
          response.accessToken,
          response.refreshToken,
        );
        emit(AuthAuthenticated());
        _startTokenRefreshTimer();
      } else {
        emit(const AuthError(error: 'Google sign in failed'));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthError(error: e));
    } finally {
      event.completer?.complete();
    }
  }
}
