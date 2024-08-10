part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthAuthenticated extends AuthState {}

final class AuthUnauthenticated extends AuthState {}

final class AuthError extends AuthState {
  const AuthError({
    required this.error,
  });

  final Object error;

  @override
  List<Object> get props => [error];
}
