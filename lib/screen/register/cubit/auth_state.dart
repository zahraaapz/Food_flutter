part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthNotSuccess extends AuthState {
  final String e;

  AuthNotSuccess(this.e);
  
}
