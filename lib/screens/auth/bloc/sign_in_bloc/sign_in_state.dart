part of 'sign_in_bloc.dart';
abstract class SignInState {
const SignInState();
}

class SignInInitialState extends SignInState{}
class SignInLoadingState extends SignInState{}
class SignInSuccessState extends SignInState{}
class SignInFailureState extends SignInState{}
