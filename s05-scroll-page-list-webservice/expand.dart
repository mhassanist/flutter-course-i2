import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double minChild = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('DraggableScrollableSheet'),
            ),
            body: ExpandChild(
              child: Column(
                children: <Widget>[
                  OutlineButton(
                    child: Text('Button1'),
                    onPressed: () => print('Pressed button1'),
                  ),
                  OutlineButton(
                    child: Text('Button2'),
                    onPressed: () => print('Pressed button2'),
                  ),
                  OutlineButton(
                    child: Text('Button3'),
                    onPressed: () => print('Pressed button3'),
                  ),
                ],
              ),
            )));
  }
}
