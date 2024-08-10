part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String username;
  final String password;
  final Completer? completer;

  const SignInEvent(
    this.completer, {
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class SignUpEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String password2;
  final Completer? completer;

  const SignUpEvent(
    this.completer, {
    required this.username,
    required this.email,
    required this.password,
    required this.password2,
  });

  @override
  List<Object> get props => [username, email, password, password2];
}

class SignOutEvent extends AuthEvent {}

class RefreshTokenEvent extends AuthEvent {}

class AppStartedEvent extends AuthEvent {}

class VerifyEvent extends AuthEvent {
  final int verifyCode;
  final String username;
  final String password;
  final Completer? completer;

  const VerifyEvent(
    this.completer, {
    required this.verifyCode,
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [verifyCode, username, password];
}

class ResetPasswordRequest extends AuthEvent {
  final String username;
  final Completer? completer;

  const ResetPasswordRequest(
    this.completer, {
    required this.username,
  });

  @override
  List<Object> get props => [username];
}

class ResetPasswordConfirm extends AuthEvent {
  final String username;
  final int code;
  final String newPassword;
  final Completer? completer;

  const ResetPasswordConfirm(
    this.completer, {
    required this.username,
    required this.code,
    required this.newPassword,
  });

  @override
  List<Object> get props => [username, code, newPassword];
}

class AuthWithGoogleEvent extends AuthEvent {
  const AuthWithGoogleEvent({
    required this.completer,
  });

  final Completer? completer;
}
