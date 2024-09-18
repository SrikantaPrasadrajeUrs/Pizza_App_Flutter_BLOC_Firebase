import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';
//
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc(this._userRepository) : super(SignUpInitial()){
    on<SignUp>(singUp);
  }

  Future<void> singUp(SignUp event, Emitter<dynamic> emit) async {
    emit(SignUpProcess());
    try{
      var user = await _userRepository.signUp(event.user, event.password);
      await _userRepository.setUserData(user);
      emit(SignUpSuccess());
    }catch(e,stackTrace){
      print("error while fetching user data ,error: $e, stack: $stackTrace");
      emit(SignUpFailure());
    }
  }
}
