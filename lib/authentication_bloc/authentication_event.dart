part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}
class AuthenticationUserChangedEvent extends AuthenticationEvent{
  final MyUser? user;
  const AuthenticationUserChangedEvent(this.user);

  @override
  List<Object> get props => [user!];

}