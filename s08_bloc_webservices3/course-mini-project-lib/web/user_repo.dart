import 'dart:async';

import 'package:coursesproject/bloc/login_bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UserRepository {
  LoginBloc loginBloc = new LoginBloc();

  StreamController<AuthUpdateState> loginStateUpdateStream;

  UserRepository(this.loginStateUpdateStream);

  authenticate(String username, String password) async {
    String url =
        "http://ec2-54-71-69-93.us-west-2.compute.amazonaws.com/lumen-course-v2/courses_lumen/public/login";

    var headers = {
      "Content-Type": "application/json",
    };

    var body = {
      "username": username, //"ovmsah@gmail.com",
      "password": password, //"12345678",
      "grant_type": "password",
      "client_id": 2,
      "client_secret": "5HSBcWKOiJLH8ACzpYTcHhOkgSpNimUBPakYHLiL",
      "notification_id":
          "740f4707bebcf74f9b7c25d48e3358945f6aa01da5ddb387462c7eaf61bb78ad",
      "device_os": "android"
    };

    http.Client client = http.Client();
    http.Response response = await client.post(url,
        headers: headers, body: convert.jsonEncode(body));

    print(response.body);
    AuthSuccess access = new AuthSuccess("Login Succeeeded","TOKEN");
    loginBloc.getStateUpdateSink().add(access);

    /*loginStateUpdateStream.add(new AuthSuccess("tokentoken",
        convert.jsonDecode(response.body)['meta_data']['access_token'].toString()));*/
  }
}
