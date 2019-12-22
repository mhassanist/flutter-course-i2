import 'package:flutter/material.dart';

void main() {
  /*Container c = Container(
    color: Colors.green,);*/

  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Title"),
        ),
        body: Container(
          color: Colors.red,
          padding: EdgeInsets.all(100),
          child: Center(
            child: Container(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                  "Hello Flutter",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                    backgroundColor: Colors.cyan,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}
