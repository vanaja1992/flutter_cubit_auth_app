part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class AuthenticationSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class AuthenticationError extends AuthenticationState {
  @override
  List<Object> get props => [];
}
