import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: ListView(

          scrollDirection: Axis.horizontal,

          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              color: Colors.pink,
            ),
            Container(
              height: 100,
              width: 100,              color: Colors.cyan,
            ),
            Container(
              child: Text("Hello"),
              height: 100,
              width: 100,              color: Colors.deepPurple,
            ),
            Container(
              height: 100,
              width: 100,              color: Colors.pink,
            ),
            Container(
              height: 100,
              width: 100,              color: Colors.cyan,
            ),
            Container(
              child: Text("Hello"),
              height: 100,
              width: 100,              color: Colors.deepPurple,
            ),
            Container(
              height: 100,
              width: 100,              color: Colors.pink,
            ),
            Container(
              height: 100,
              width: 100,              color: Colors.cyan,
            ),
            Container(
              child: Text("Hello"),
              height: 100,
              width: 100,              color: Colors.deepPurple,
            ),
          ],
        )
        ,
      ),
    );
  }
}