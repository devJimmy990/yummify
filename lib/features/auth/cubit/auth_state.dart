part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AccountCreated extends AuthState {
  const AccountCreated(this.email, this.password);
  final String email, password;
}

class Authenticated extends AuthState {
  const Authenticated(this.user);
  final User user;

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  const AuthError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
