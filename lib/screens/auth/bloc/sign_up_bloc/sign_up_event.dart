import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class SignUp extends SignUpEvent {
  final MyUser user;
  final String password;
  const SignUp({required this.user, required this.password});
  @override
  List<Object?> get props => [user,password];
}

class SignOut extends SignUpEvent{

}