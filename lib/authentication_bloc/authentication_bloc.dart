import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:user_repository/user_repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;
  AuthenticationBloc({
    required this.userRepository,
}) : super(const AuthenticationState.unknown()){
    _userSubscription=userRepository.user.listen((user) {
      add(AuthenticationUserChangedEvent(user));
    });
     on<AuthenticationUserChangedEvent>(authenticationUserChangedEvent);
  }

 void authenticationUserChangedEvent(AuthenticationUserChangedEvent event, Emitter<AuthenticationState> emit) {
    if(event.user!=MyUser.empty){
      emit(AuthenticationState.authenticated(event.user!));
    }else{
      emit(const AuthenticationState.unAuthenticated());
    }
  }

  @override
  Future<void> close(){
    _userSubscription.cancel();
    return super.close();
  }
}
