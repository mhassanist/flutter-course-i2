import 'dart:async';
import 'package:coursesproject/web/user_repo.dart';

class LoginBloc {

  static StreamController _loginEcventController = new StreamController<LoginEvent>();
  static StreamController _stateUpdateController = new StreamController<AuthUpdateState>();

  static LoginBloc _loginBloc = LoginBloc._internal();

  Sink getStateUpdateSink(){
    return _stateUpdateController.sink;
  }
  Sink getLoginEventSink(){
    return _loginEcventController.sink;
  }

  static void _onLoginSucceeded(event) {
      //DON'T NEED IT HETE
  }
  static void _onLoginEvent(dynamic data){
    LoginEvent loginEvent = data;

    UserRepository userRepository = new UserRepository(null);
    userRepository.authenticate(loginEvent.username, loginEvent.password);
  }

  factory LoginBloc() {
    if(! _loginEcventController.hasListener)
      _loginEcventController.stream.listen(_onLoginEvent);

   /* if(! _stateUpdateController.hasListener)
      _stateUpdateController.stream.listen(_onLoginSucceeded);
*/
    /*
    //same as seprating the method
    _loginEcventController.stream.listen((data){
      LoginEvent loginEvent = data;

      UserRepository userRepository = new UserRepository(null);
      userRepository.authenticate(loginEvent.username, loginEvent.password);

    });*/


    return _loginBloc;
  }

  LoginBloc._internal();

  getStateUpdateStream() {
    return _stateUpdateController.stream;
  }


}

class AuthUpdateState {
  String message;
  AuthUpdateState(this.message);
}
class AuthSuccess extends AuthUpdateState{
  String token;

  AuthSuccess(this.token, message): super (message);
}
class AuthFailed extends AuthUpdateState{
  AuthFailed(String message) : super(message);
}

class LoginEvent {
  var password;
  var username;

  LoginEvent(this.username, this.password);
}
