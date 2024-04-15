part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SentEmail extends AuthState {}
final class NotSendEmail extends AuthState {
  final String e;

  NotSendEmail(this.e);
  
}
