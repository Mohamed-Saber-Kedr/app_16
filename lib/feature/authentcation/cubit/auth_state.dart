part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthLoginSuccess extends AuthState {
  final Response response;
  AuthLoginSuccess({required this.response});
}
final class AuthRegesterSuccess extends AuthState {
  final Response response;
  AuthRegesterSuccess({required this.response});
}
