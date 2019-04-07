import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walltime_player/Scenes/Authentication/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
    @required LoginBloc loginBloc,
  })  : _loginBloc = loginBloc,
        super(key: key);

  final LoginBloc _loginBloc;

  @override
  LoginScreenState createState() {
    return new LoginScreenState(_loginBloc);
  }
}

class LoginScreenState extends State<LoginScreen> {
  final LoginBloc _loginBloc;
  LoginScreenState(this._loginBloc);

  @override
  void initState() {
    super.initState();
    //this._loginBloc.dispatch(Login());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: widget._loginBloc,
        builder: (
          BuildContext context,
          LoginState currentState,
        ) {
          if (currentState is LoginInitialState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return new Container(
              child: new Center(
            child: new Text("Coucou"),
          ));
        });
  }
}
