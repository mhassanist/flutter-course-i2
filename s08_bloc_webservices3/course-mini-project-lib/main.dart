import 'package:coursesproject/ui/create_course.dart';
import 'package:coursesproject/ui/home_page.dart';
import 'package:coursesproject/ui/login_screen.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => MyHomePage(),
        '/create_course': (context) => CreateCourse(),

      },
    );
  }
}
