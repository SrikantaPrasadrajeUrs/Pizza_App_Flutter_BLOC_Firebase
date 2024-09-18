import 'package:user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import '../sign_up_bloc/sign_up_state.dart';
import 'package:equatable/equatable.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc(this._userRepository) : super(SignInInitialState()) {
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
  }

  void _signIn(SignIn event, Emitter emit) async {
    emit(SignInLoadingState());
    try {
      await _userRepository.signIn(event.email, event.password);
    } catch (e) {
      emit(SignInFailureState());
    }
  }

  void _signOut(SignOut event, Emitter<SignInState> emit) async{
    await _userRepository.logOut();
  }

}
