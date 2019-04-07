import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:walltime_player/Domain/agent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitialState("", "");

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    //yield await event.apply(currentState: currentState, bloc: this);
  }
}

// State for the login screen
@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]): super(props);
}

@immutable
class LoginInitialState extends LoginState {
    final String connectedAgentEmail;
    final String connectedAgentPassword;

  LoginInitialState(this.connectedAgentEmail, this.connectedAgentPassword): super([connectedAgentEmail, connectedAgentPassword]);
}

@immutable
class LoginLoadingState extends LoginState {}

@immutable
class LoginSuccessState extends LoginState {
  final Agent agent;

  LoginSuccessState(this.agent): super([agent]);
}

@immutable
class LoginFailedState extends LoginState {
  // Field / Error message
  final Map<String, String> errors;

  LoginFailedState(this.errors): super([errors]);
}

// Event from the UI
@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]): super(props);
}

class LoginAgentEvent extends LoginEvent {
  final String email;
  final String password;

  LoginAgentEvent(this.email, this.password): super([email, password]);
}