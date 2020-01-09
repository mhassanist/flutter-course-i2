import 'package:coursesproject/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  LoginBloc loginBloc = new LoginBloc();
  String email, password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }
  void _submit() {
    if (_formKey.currentState.validate()) {
      //_formKey.currentState.save();

      LoginEvent loginEvent = new LoginEvent(_emailController.text,
          _passwordController.text);
      loginBloc.getLoginEventSink().add(loginEvent);

      //Navigator.pushNamed(context, '/home');
    }else{

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Login",
      )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: Image.asset(
                  'assets/images/ic_launcher.png',
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.0, right: 10, left: 10),
                child: TextFormField(
                  controller: _emailController,
                  validator: (input) =>
                      (!input.contains("@")) ? "Enter valid email" : null,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  onSaved: (input) => email = input,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 45.0, right: 10, left: 10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _passwordController,
                      validator: (input) => input.length < 6
                          ? "password must be at least 6 characters"
                          : null,
                      decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 15.0),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onSaved: (input) => password = input,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 15.0, bottom: 20, right: 10, left: 10),
                child: FlatButton(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: _submit,
                ),
              ),
              StreamBuilder<AuthUpdateState>(
                stream: loginBloc.getStateUpdateStream(),
                builder: (context, snapshot) {
                  if(snapshot.hasData)
                    return Text(snapshot.data.message);
                  else
                    return Text("");
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
